// Support for embedded records in Ember Data Beta 1.0 is gone for now.
// Because we consuming data returned directly from Github, we need embedded
// record support. In a production application, I would return the data in the correct
// sideloaded-format.
//
// This serializer implements support for one-to-one and one-to-many relationships.
//
// Credit:
//   http://mozmonkey.com/2013/12/loading-json-with-embedded-records-into-ember-data-1-0-0-beta/
//   http://jsfiddle.net/jgillick/TPhtC/
//
// Transition guide reference:
//   https://github.com/emberjs/data/blob/master/TRANSITION.md
//
//
// Handle deserializing data
//
EmberGithubExample.ApplicationSerializer = DS.RESTSerializer.extend({
    /**
     The current ID index of generated IDs
     @property
     @private
    */
    _generatedIds: 0,

    /**
     Sideload a JSON object to the payload

     @method sideloadItem
     @param {Object} payload JSON object representing the payload
     @param {subclass of DS.Model} type The DS.Model class of the item to be sideloaded
     @paraam {Object} item JSON object representing the record to sideload to the payload
    */
    sideloadItem: function(payload, type, item){
        var sideloadKey = type.typeKey.pluralize(),     // The key for the sideload array
            sideloadArr = payload[sideloadKey] || [],   // The sideload array for this item
            primaryKey = Ember.get(this, 'primaryKey'), // the ID property key
            id = item[primaryKey];

        // Missing an ID, give it one
        if (typeof id == 'undefined') {
            id = 'generated-'+ (++this._generatedIds);
            item[primaryKey] = id;
        }

        // Don't add if already side loaded
        if (sideloadArr.findBy('id', id) != undefined){
            return payload;
        }

        // Add to sideloaded array
        sideloadArr.push(item);
        payload[sideloadKey] = sideloadArr;
        return payload;
    },

    /**
     Extract relationships from the payload and sideload them. This function recursively
     walks down the JSON tree

     @method sideloadItem
     @param {Object} payload JSON object representing the payload
     @paraam {Object} recordJSON JSON object representing the current record in the payload to look for relationships
     @param {Object} primaryType The DS.Model class of the record object
    */
    extractRelationships: function(payload, recordJSON, primaryType){
        primaryType.eachRelationship(function(key, relationship) {
            var related = recordJSON[key], // The record at this relationship
                type = relationship.type;  // belongsTo or hasMany

            if (related){

                // One-to-one
                if (relationship.kind == 'belongsTo') {
                    // Sideload the object to the payload
                    this.sideloadItem(payload, type, related);

                    // Replace object with ID
                    recordJSON[key] = related.id;

                    // Find relationships in this record
                    this.extractRelationships(payload, related, type);
                }

                // Many
                else if (relationship.kind == 'hasMany') {
                    // Loop through each object
                    related.forEach(function(item, index){

                        // Sideload the object to the payload
                        this.sideloadItem(payload, type, item);

                        // Replace object with ID
                        related[index] = item.id;

                        // Find relationships in this record
                        this.extractRelationships(payload, item, type);
                    }, this);
                }

            }
        }, this);

        return payload;
    },

    /**
     Overrided method
    */
    normalizePayload: function(type, payload) {
        var typeKey = type.typeKey,
            typeKeyPlural = typeKey.pluralize();

        payload = this._super(type, payload);

        // Many items (findMany, findAll)
        if (typeof payload[typeKeyPlural] != 'undefined'){
            payload[typeKeyPlural].forEach(function(item, index){
                this.extractRelationships(payload, item, type);
            }, this);
        }

        // Single item (find)
        else if (typeof payload[typeKey] != 'undefined'){
            this.extractRelationships(payload, payload[typeKey], type);
        }

        return payload;
    }
});

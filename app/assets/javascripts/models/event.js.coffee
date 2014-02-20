EmberGithubExample.Event = DS.Model.extend
  type:      DS.attr('string')
  public:    DS.attr('string')
  createdAt: DS.attr('date')
  actor:     DS.belongsTo('actor')
  repo:      DS.belongsTo('repo')
  org:       DS.belongsTo('org')

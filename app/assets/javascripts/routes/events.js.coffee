EmberGithubExample.EventsRoute = Ember.Route.extend
  model: (params) ->
    orgName = @modelFor('org').orgName
    return [] unless orgName # No results

    @store.find('event', { org: orgName })

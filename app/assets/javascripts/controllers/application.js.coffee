EmberGithubExample.ApplicationController = Ember.Controller.extend
  queryField: null
  actions:
    search: ->
      @transitionTo('events', @get('queryField')) if @get('queryField')

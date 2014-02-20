# http://emberjs.com/guides/models/using-the-store/

# Uses https://github.com/pixelhandler/ember-data-extensions for embedded record support
EmberGithubExample.ApplicationSerializer = DS.EmbeddedSerializer.extend()

# Uses https://github.com/pixelhandler/ember-data-extensions for embedded record support
EmberGithubExample.ApplicationAdapter = DS.EmbeddedAdapter.extend
  namespace: 'api'

EmberGithubExample.Store = DS.Store.extend
  # Use our custom adapter that extends `DS.ActiveModelAdapter`
  # with a namespace for our API
  adapter: 'EmberGithubExample.ApplicationAdapter'

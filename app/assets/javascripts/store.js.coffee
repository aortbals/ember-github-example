# http://emberjs.com/guides/models/using-the-store/

EmberGithubExample.ApplicationAdapter = DS.ActiveModelAdapter.extend
  namespace: 'api'

EmberGithubExample.Store = DS.Store.extend
  # Use our custom adapter that extends `DS.ActiveModelAdapter`
  # with a namespace for our API
  adapter: 'EmberGithubExample.ApplicationAdapter'

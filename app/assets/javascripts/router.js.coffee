# For more information see: http://emberjs.com/guides/routing/

EmberGithubExample.Router.map ()->
  @resource 'org', { path: '/orgs/:orgName' }, ->
    @resource 'events'


# Use the browser history API
EmberGithubExample.Router.reopen
   location: 'history'

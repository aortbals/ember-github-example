EmberGithubExample.Actor = DS.Model.extend
  login:      DS.attr('string')
  gravatarId: DS.attr('string')

  gravatarUrl: (->
    "http://gravatar.com/avatar/#{@get('gravatarId')}"
  ).property('gravatarId')

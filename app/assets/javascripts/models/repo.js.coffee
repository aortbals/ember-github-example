EmberGithubExample.Repo = DS.Model.extend
  name: DS.attr('string')

  url: (->
    "https://github.com/#{@get('name')}"
  ).property('name')

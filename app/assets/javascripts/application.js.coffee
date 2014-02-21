#= require jquery
#= require jquery_ujs

# *** Components ***
#= require momentjs/moment

#= require handlebars
#= require ember
#= require ember-data
#= require ember-data-extensions/dist/embedded-adapter
#= require_self
#= require ember_github_example

# for more details see: http://emberjs.com/guides/application/
window.EmberGithubExample = Ember.Application.create({
  LOG_TRANSITIONS: true,
  LOG_ACTIVE_GENERATION: true,
  LOG_VIEW_LOOKUPS: true
})

#= require_tree .

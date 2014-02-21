Ember.Handlebars.helper 'from-now', (date) ->
  return unless date
  moment(date).fromNow()

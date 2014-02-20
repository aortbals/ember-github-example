EmberGithubExample.EventSerializer = EmberGithubExample.ApplicationSerializer.extend
  attrs:
    repo:  { embedded: 'always' }
    org:   { embedded: 'always' }
    actor: { embedded: 'always' }

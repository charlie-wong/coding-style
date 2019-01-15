Testing
===============================================================================
- Use `busted <http://olivinelabs.com/busted>`_ and write lots of tests in
  a ``test`` folder. Separate tests by module.
- Use descriptive ``describe`` and ``it`` blocks so it's obvious to see
  what precisely is failing.
- Test interfaces. Don't test private methods. If you need to test something
  that is private, it probably shouldn't be private in the first place.

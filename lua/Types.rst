Types
===============================================================================
**Primitives**: When you access a primitive type you work directly on its value

- ``string``
- ``number``
- ``boolean``
- ``nil``

.. code-block:: lua

    local foo = 1
    local bar = foo

    bar = 9

    print(foo, bar) -- => 1 9

**Complex**: When you access a complex type you work on a reference to its value

  - ``table``
  - ``function``
  - ``userdata``
  
.. code-block:: lua

    local foo = { 1, 2 }
    local bar = foo

    bar[0] = 9
    foo[1] = 3

    print(foo[0], bar[0]) -- => 9   9
    print(foo[1], bar[1]) -- => 3   3
    print(foo[2], bar[2]) -- => 2   2		


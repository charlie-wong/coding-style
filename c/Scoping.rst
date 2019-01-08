Scoping
===============================================================================

Use of internal linkage in ``.c`` files is encouraged for all code
that does not need to be referenced elsewhere, and do not use internal
linkage in ``.h`` files.

Functions and variables can be given internal linkage by declaring them ``static``.
This means that anything you're declaring can't be accessed from another file.
If a different file declares something with the same name, then the two entities
are completely independent.

.. _c_scope_global_variables:

Global Variables
-------------------------------------------------------------------------------
Avoid using global variable where possible.

.. _c_scope_static_variables:

Static Variables
-------------------------------------------------------------------------------
When variables definied in a ``.c`` file, which do not need to be referenced
outside of that file, declare them as ``static``. It is rarely to define
``static`` variables in header files.

.. _c_scope_local_variables:

Locale Variables
-------------------------------------------------------------------------------
Place function's variables in the narrowest scope, and initialize them.

- Declare local variables in as local a scope as possible.
- Declare local variables as close to the first use as possible.

This makes it easier for the reader to find the declaration and see what type the variable is and
what it was initialized to. In particular, initialization should be used instead of declaration
and assignment, e.g.

.. code-block:: c

    int i;
    i = get_value(); // Bad -- initialization separate from declaration.

    int j = get_value(); // Good -- declaration has initialization.

It may be more efficient to declare a variable used in a loop outside that loop.

.. code-block:: c

    // More efficient
    foo_st foo = { 0 }; // create once
    for(int i = 0; i < 1000000; ++i)
    {
        doSomething(foo); // use it
    }

    // create & destory for each time
    for(int i = 0; i < 1000000; ++i)
    {
        foo_st foo = { 0 };
        doSomething(foo); // use it
    }

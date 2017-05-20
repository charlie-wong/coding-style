.. _appendix_best_coding_practices:

Best Coding Practices(C/C++)
===============================================================================

.. _appendix_usage_of_layering:

Usage of Layering
-------------------------------------------------------------------------------
Layering is the primary technique for reducing complexity in a system. A system should be divided
into layers. Layers should communicate between adjacent layers using well defined interfaces. When
a layer uses a non-adjacent layer then a layering violation has occurred.

A layering violation simply means we have dependency between layers that is not controlled by a well
defined interface. When one of the layers changes code could break. We don't want code to break so
we want layers to work only with other adjacent layers.

Sometimes we need to jump layers for performance reasons. This is fine, but we should know what we
are doing and document it appropriately.

.. _appendix_coding_tips:

Coding Tips
-------------------------------------------------------------------------------
.. code-block:: c

    // this is better
    if(f())
    {
        do_some_thing();
    }
    
    // this is not good
    if(FAIL != f())
    {
        do_other_thing();
        ...
    }

- Usually Avoid Embedded Assignments

.. code-block:: c

    d = (a = b + c) + r; // do you realy need to do it like this?
    a = b + c;
    d = a + r;           // This will be good and clear enough

    // there is no other way, and this is good enough
    while(EOF != (c = getchar()))
    {
        do_some_thing();
    }

.. _appendix_expressions:

Expressions
-------------------------------------------------------------------------------
- Do not depend on the order of evaluation for side effects
- Use parentheses for precedence of operation
- Do not depend on the order of evaluation of subexpressions
- Do not depend on the order in which side effects take place
- Do not read uninitialized memory
- Do not dereference **null** pointers
- Do not access a variable through a pointer of an incompatible type
- Do not modify constant objects
- Do not compare padding data
- Do not ignore values returned by functions
- Do not assume the size of a structure is the sum of the sizes of its members
- Ensure pointer arithmetic is used correctly
- Use ``sizeof`` to determine the size of a type or variable
- Do not make assumptions regarding the layout of structures with bit-fields
- Use braces for the body of an ``if``, ``for``, or ``while`` statement
- Perform explicit tests to determine **success**, **true** and **false**, and **equality**
- Beware of integer promotion when performing bitwise operations on smaller integer types

.. _appendix_integers:

Integers
-------------------------------------------------------------------------------
- Ensure that unsigned integer operations do not wrap
- Ensure that integer conversions do not result in lost or misinterpreted data
- Ensure that operations on signed integers do not result in overflow
- Ensure that division and remainder operations do not result in divide-by-zero errors
- Use correct integer precisions
- Use bitwise operators only on unsigned operands
- Avoid performing bitwise and arithmetic operations on the same data
- Evaluate integer expressions in a larger size before comparing or assigning to that size
- Converting a pointer to integer or integer to pointer
- Do not shift an expression by a negative number or a greater number of bits

.. _appendix_floating_point:

Floating Point
-------------------------------------------------------------------------------
- Do not use floating-point variables as loop counters
- Ensure that floating-point conversions are within range of the new type

.. _appendix_characters_and_strings:

Characters and Strings
-------------------------------------------------------------------------------
- Do not attempt to modify string literals
- Guarantee that storage for strings has sufficient space for character data and the **null** terminator
- Do not pass a non-null-terminated character sequence to a library function that expects a string
- Cast characters to ``unsigned char`` before converting to larger integer sizes
- Arguments to character-handling functions must be representable as an ``unsigned char``
- Do not confuse narrow and wide character strings and functions
- Use pointers to ``const`` when referring to string literals

.. _appendix_memorym_anagement:

Memory Management
-------------------------------------------------------------------------------
- Do not access freed memory
- Free dynamically allocated memory when no longer needed
- Allocate and copy structures containing a flexible array member dynamically
- Only free memory allocated dynamically
- Allocate sufficient memory for an object
- Allocate and free memory in the same module, at the same level of abstraction
- Store a new value(e.g. ``NULL``) in pointers immediately after ``free()``
- Immediately cast the result of a memory allocation function call
- Beware of zero-length allocations
- Avoid large stack allocations
- Define and use a pointer validation function


.. _appendix_application_programming_interfaces:

Application Programming Interfaces
-------------------------------------------------------------------------------
- Functions should validate their parameters
- Avoid laying out strings in memory directly before sensitive data
- Functions that read or write an array should take an argument to specify target size

.. _appendix_miscellaneous:

Miscellaneous
-------------------------------------------------------------------------------
- No **magic** numbers, use ``enum``, ``const`` or macros.
- Notice the difference of ``#if XX``, ``#ifdef XX`` and ``#if defined(XX)``.
- The easiest way commenting out large code blocks is using ``#if 0``.
- Do not use floating-point variables where discrete values are needed.
- Using a float for a loop counter is a great way to shoot yourself in the foot.
- Always test floating-point numbers as ``<=`` or ``>=``, never use an exact comparison ``==`` or ``!=``.
- Compile cleanly at high warning levels
- Use comments consistently and in a readable fashion
- Detect and remove dead code
- Detect and remove code that has no effect or is never executed
- Detect and remove unused values
- Do not introduce unnecessary platform dependencies
- Use robust loop termination conditions
- Ensure that control never reaches the end of a non-void function
- Do not use deprecated or obsolescent functions

Coding Practices
===============================================================================

API
-------------------------------------------------------------------------------
- Functions should validate their parameters.
- Avoid laying out strings in memory directly before sensitive data.
- Functions that read or write an array should take an argument to specify target size.

Layer
-------------------------------------------------------------------------------
Layering is the primary technique for reducing complexity in a system.
A system should be divided into layers. Layers should communicate between
adjacent layers using well defined interfaces. When a layer uses a non-adjacent
layer then a layering violation has occurred.

A layering violation simply means we have dependency between layers that is
not controlled by a well defined interface. When one of the layers changes
code could break. We don't want code to break so we want layers to work
only with other adjacent layers.

Sometimes we need to jump layers for performance reasons. This is fine, but
we should know what we are doing and document it appropriately.

Integers
-------------------------------------------------------------------------------
- Use correct integer precisions.
- Use bitwise operators only on ``unsigned`` operands.
- Ensure that ``unsigned`` integer operations do not wrap.
- Ensure that operations on ``signed`` integers do not result in overflow.
- Ensure that integer conversions do not result in lost or misinterpreted data.
- Ensure that division and remainder operations do not result in **divide-by-zero** errors.
- Avoid performing bitwise and arithmetic operations on the same data.
- Avoid performing converting a pointer to integer or integer to pointer.
- Evaluate integer expressions in a larger size before comparing or assigning to that size.
- Do not shift an expression by a negative number or a greater number of bits.

Expressions
-------------------------------------------------------------------------------
- Ensure pointer arithmetic is used correctly.
- Use parentheses for precedence of operation.
- Do not compare padding data.
- Do not modify ``const`` objects.
- Do not read uninitialized memory.
- Do not dereference ``null`` pointers.
- Do not ignore values returned by functions.
- Do not depend on the order of evaluation for side effects.
- Do not depend on the order of evaluation of subexpressions.
- Do not depend on the order in which side effects take place.
- Do not access a variable through a pointer of an incompatible type.
- Do not make assumptions regarding the layout of ``struct`` with bit-fields.
- Do not assume the size of a ``struct`` is the sum of the sizes of all its' members.
- Use ``sizeof`` to determine the size of a type or variable.
- Use braces for the body of an ``if``, ``for``, or ``while`` statement.
- Perform explicit tests to determine **success**, **failure**, **true** and **false**, and **equality**.
- Beware of integer promotion when performing bitwise operations on smaller integer types.

Floating Point
-------------------------------------------------------------------------------
- Do not use floating-point variables as loop counters.
- Ensure that floating-point conversions are within range of the new type.

Characters and Strings
-------------------------------------------------------------------------------
- Do not attempt to modify string literals.
- Use ``const`` pointers when referring to string literals.
- Do not confuse **narrow** and **wide** character strings and functions.
- Do not pass **non-null-terminated** chars sequence to a library function that expects a string.
- Cast characters to ``unsigned char`` before converting to larger integer sizes.
- Arguments to character-handling functions must be representable as an ``unsigned char``.
- Guarantee that storage for strings has sufficient space for characters and ``NULL`` terminator.

Memory Management
-------------------------------------------------------------------------------
- Do not access freed memory.
- Avoid large stack allocations.
- Beware of zero-length allocations.
- Only free memory allocated dynamically.
- Allocate sufficient memory for an object.
- Define and use a pointer validation function.
- Free dynamically allocated memory when no longer needed.
- Immediately cast the result of a memory allocation function call.
- Store a new value(e.g. ``NULL``) in pointers immediately after ``free()``.
- Allocate and copy structures containing a flexible array member dynamically.
- Allocate and free memory in the same module, at the same level of abstraction.

Miscellaneous
-------------------------------------------------------------------------------
- Detect and remove dead code.
- Detect and remove unused values.
- Compile cleanly at high warning levels.
- Use robust loop termination conditions.
- Do not use **deprecated** or **obsolescent** functions.
- Do not introduce unnecessary platform dependencies.
- Make comments consistently and in a readable fashion.
- Using a float for a loop counter is a great way to shoot yourself.
- Detect and remove code that has no effect or is never executed.
- Ensure that control never reaches the end of a **non-void** function.
- Do not use floating-point variables where discrete values are needed.
- No **magic** numbers, use ``enum``, ``const`` or ``MACRO``.
- Notice the difference of ``#if XX``, ``#ifdef XX`` and ``#if defined(XX)``.
- The easiest way commenting out large code blocks is using ``#if 0``.
- Always test floating-point numbers as ``<=`` or ``>=``, never use an exact comparison ``==`` or ``!=``.

More Coding Tips
-------------------------------------------------------------------------------
.. code-block:: c

    // this is better
    if(f())
    {
        do_some_thing();
    }

    // this is not good, why reverse it?
    if(FAIL != f())
    {
        do_other_thing();
        ...
    }

Usually avoid embedded assignments, for example

.. code-block:: c

    // do you realy need to do it like this?
    d = (a = b + c) + r;

    // This will be good and clear enough
    a = b + c;
    d = a + r;

    // no other way, and so this is good enough
    while(EOF != (c = getchar()))
    {
        do_some_thing();
    }

C++ Features
===============================================================================

.. _cpp_var_rvalue_references:

Rvalue References
-------------------------------------------------------------------------------
Use rvalue references only to define move constructors and move assignment operators, or for
perfect forwarding.

.. _cpp_friends:

Friends
-------------------------------------------------------------------------------
We allow use of friend classes and functions, within reason.

Friends should usually be defined in the same file so that the reader does not have to look in
another file to find uses of the private members of a class. A common use of friend is to have a
FooBuilder class be a friend of Foo so that it can construct the inner state of Foo correctly,
without exposing this state to the world. In some cases it may be useful to make a unittest class
a friend of the class it tests.

Friends extend, but do not break, the encapsulation boundary of a class. In some cases this is
better than making a member public when you want to give only one other class access to it.
However, most classes should interact with other classes solely through their public members.

.. _cpp_exceptions:

Exceptions
-------------------------------------------------------------------------------
We do not use C++ exceptions.


.. _cpp_run_time_type_information:

Run-Time Type Information (RTTI)
-------------------------------------------------------------------------------
Avoid using Run Time Type Information (RTTI).

.. _cpp_casting:

Casting
-------------------------------------------------------------------------------
todo

.. _cpp_streams:

Streams
-------------------------------------------------------------------------------
todo

.. code-block:: c

    int  is_good = 1;     // Bad  - should have type bool.
    bool is_good = true;  // Good - just use boolean type where possible.

.. _cpp_variable_declarations:

Variable Declarations
-------------------------------------------------------------------------------
Declare only one variable per line, and each line have only one sentence.

.. code-block:: c

    int i, j = 1;     // never do this
    int k=0; func();  // never do this also
    
    int i = 0;        // this will more clear
    int j = 1;        // no bug easy to hide
    int k = 0;
    func();

.. _cpp_0_and_NULL:

0 and NULL
-------------------------------------------------------------------------------
- Use ``0`` for integers;
- Use ``0.0`` for reals;
- Use ``NULL`` for pointers;
- Use ``'\0'`` for chars;

.. _cpp_usage_of_sizeof:

Usage of sizeof
-------------------------------------------------------------------------------
Prefer ``sizeof(varname)`` to ``sizeof(type)``.

Use ``sizeof(varname)`` when you take the size of a particular variable. ``sizeof(varname)`` will
update appropriately if someone changes the variable type either now or later.

You may use ``sizeof(type)`` for code unrelated to any particular variable.

.. _cpp_usage_of_goto:

Usage of goto
-------------------------------------------------------------------------------
Just do not use ``goto`` when it is absolutely necessary.

The goto statement comes in handy when a function exits from multiple locations and some common work
such as cleanup has to be done. If there is no cleanup needed then just return directly.

The use of ``goto`` make code hard to read and management, so just use it as rare as possible.
If for some reason, you must use ``goto``, then choose label names which say what the goto does
or why the goto exists.

The rationale for using gotos is:

- nesting is reduced.
- errors by not updating individual exit points when making modifications are prevented.
- saves the compiler work to optimize redundant code away.

A common type of bug to be aware of is one ``err`` bugs which look like this:

.. code-block:: c

    err:
        kfree(foo->bar);
        kfree(foo);
        return ret;

The bug in this code is that on some exit paths ``foo`` is ``NULL``. Normally the fix for this is
to split it up into two error labels ``err_free_bar`` and ``err_free_foo``, e.g.

.. code-block:: c

    err_free_bar:
        kfree(foo->bar);
    err_free_foo:
        kfree(foo);
        return ret;

.. _cpp_usage_of_macros:

Usage of Macros
-------------------------------------------------------------------------------
Macros with multiple statements should be enclosed in a ``do-while`` block, e.g.

.. code-block:: c

    // make properly align of \'s to increase the readability
    #define macrofun(a, b, c)   \
        do                      \
        {                       \
            if(a == 5)          \    
            {                   \
                do_this(b, c);  \
            }                   \
        }while(0)

- Avoid using macros if they affect control flow, e.g.

.. code-block:: c

    #define FOO(x)                 \
        do                         \
        {                          \
            if(blah(x) < 0)        \
            {                      \
                return ERROR_CODE; \
            }                      \
        }while(0)

- Avoid using macros if they depend on having a local variable with a magic name, e.g.

.. code-block:: c

    // what the hell of them?
    #define FOO(val) bar(index, val)

- Make the expression precedence very very clear by using properly parentheses.

.. _cpp_conditional_compilation:

Conditional Compilation
-------------------------------------------------------------------------------
Wherever possible, don’t use preprocessor conditionals (``#if``, ``#ifdef``, etc.) in ``.c`` files,
and doing so makes code harder to read and logic harder to follow. Instead, use such conditionals in
a header file defining functions for use in those ``.c`` files, providing no-operation stub versions
in the ``#else`` case, and then call those functions unconditionally from ``.c`` files. The compiler
will avoid generating any code for the stub calls, producing identical results, but the logic will
remain easy to follow.

If you have a function or variable which may potentially go unused in a particular configuration,
and the compiler would warn about its definition going unused, so just mark the definition as
``__attribute__((unused))``
(see `See GCC Attribute Syntax <https://gcc.gnu.org/onlinedocs/gcc/Attribute-Syntax.html>`_)
rather than wrapping it in a preprocessor conditional. However, if a function or variable always
goes unused, then just delete it.

At the end of any non-trivial ``#if`` or ``#ifdef`` block (more than a few lines), place a comment
after the ``#endif`` on the same line, noting the conditional expression used. For instance:

.. code-block:: c

    #ifdef CONFIG_SOMETHING

    doing_some_thing

    #endif // CONFIG_SOMETHING

Also do NOT not put ``#ifdef`` in an expressions for readability.



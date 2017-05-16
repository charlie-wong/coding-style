C Features
===============================================================================

.. _c_var_len_of_array_alloca:

Variable-Length of arrays and alloca()
-------------------------------------------------------------------------------
Variable-length arrays can cause hard to detect stack overflows. So, avoid use them where possible.

.. _c_data_struct:

Data Struct
-------------------------------------------------------------------------------
When declaring variables in structures, declare them organized in a manner to attempt to minimize
the memory wastage because of compiler alignment issues.

- Each member variable gets its own type and line and no exception.
- Note that the use of bitfields in general is discouraged.

Major structures should be declared at the top of the file in which they are used, or in separate
header files, if they are used in multiple source files. The declaration and the usage of the struct
should be separated if they are used more then once.

.. _c_use_const:

Use Const
-------------------------------------------------------------------------------
Use ``const`` whenever it makes sense.

- Easier for people to understand how variables are being used.
- Allows the compiler to do better type checking, and generate better code.
- Helps people convince the program correctness because they know the functions they call are
  limited in how they can modify the variables.
- Helps people know what functions are safe to use without locks in multi-threaded programs.

Use ``const`` pointer whenever it makes sense..

Some people favor the form ``int const *ptr`` to ``const int *ptr``.

They argue that this is more readable because it's more consistent:
it keeps the rule that ``const`` always follows the object it's describing.
However, this consistency argument doesn't apply in codebases with few deeply-nested pointer
expressions since most const expressions have only one ``const``. In such cases, there's no
consistency to maintain. Putting the ``const`` first is arguably more readable, since it follows
English in putting the **adjective** (``const``) before the **noun** (``int``).

While we encourage putting ``const`` first, do not require it, just be consistent with the code
around you!

.. _c_integer_types:

Integer Types
-------------------------------------------------------------------------------
The built-in integer types:

	``char``, ``int``, ``uint8_t``, ``int8_t``, ``uint16_t``, ``int16_t``,
	``uint32_t``, ``int32_t``, ``uint64_t``, ``int64_t``, ``uintmax_t``,
	``intmax_t``, ``size_t``, ``ssize_t``, ``uintptr_t``, ``intptr_t``, ``ptrdiff_t``


Use ``int`` for error codes, local and trivial variables only.

BE care when converting integer types. Integer conversions and promotions can cause non-intuitive
behavior.

Note that the signedness of ``char`` is implementation defined.

There are no convenient ``printf`` format placeholders for fixed width types.
Cast to ``uintmax_t`` or ``intmax_t`` if you have to format fixed width integers.

+---------------+-----------+--------+
| Type          | unsigned  | signed |
+===============+===========+========+
| char          | %hhu      | %hhd   |
+---------------+-----------+--------+
| int           | n/a       | %d     |
+---------------+-----------+--------+
| (u)intmax_t   | %ju       | %jd    |
+---------------+-----------+--------+
| (s)size_t     | %zu       | %zd    |
+---------------+-----------+--------+
| ptrdiff_t     | %tu       | %td    |
+---------------+-----------+--------+

.. tip::

    - If needs different size of integers, use a precise-width integer type from ``<stdint.h>``.
    - If a variable represents a value that could ever be greater than or equal to 2^31 (2GiB),
      use a 64-bit type, such as ``int64_t``.
    - Keep in mind that even if your value won't ever be too large for an int, it may be used in
      intermediate calculations which may require a larger type.

.. _c_use_boolean:

Use Boolean
-------------------------------------------------------------------------------
Use boolean type to represent boolean values when it is possible.

.. code-block:: c

    int  is_good = 1;     // Bad  - should have type bool.
    bool is_good = true;  // Good - just use boolean type where possible.

.. _c_variable_declarations:

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

.. _c_0_and_NULL_NUL:

0 and NULL & NUL
-------------------------------------------------------------------------------
- Use ``0.0`` for real
- Use ``0`` for integer
- Use ``NULL`` for pointer
- Use ``'\0'`` or ``NUL`` for char

.. _c_usage_of_sizeof:

Usage of sizeof
-------------------------------------------------------------------------------
Prefer ``sizeof(varname)`` to ``sizeof(type)``.

Use ``sizeof(varname)`` when you take the size of a particular variable. ``sizeof(varname)`` will
update appropriately if someone changes the variable type either now or later.

You may use ``sizeof(type)`` for the code unrelated to any particular variable.

.. _c_usage_of_goto:

Usage of goto
-------------------------------------------------------------------------------
Just do not use ``goto`` when it is absolutely necessary.

The ``goto`` statement comes in handy when a function exits from multiple locations and some common
work such as cleanup has to be done. If there is no cleanup needed then just return directly.

The abusively use of ``goto`` make code hard to read and management, so just use it as rare as
possible. If for some reason, you must use ``goto``, then choose label names which say what the
``goto`` does or why the ``goto`` exists.

The rationale for using ``gotos`` is:

- nesting is reduced.
- errors by not updating individual exit points when making modifications are prevented.
- saves the compiler work to optimize redundant code away.

A common type of bug to be aware of is **one err** bug which look like this:

.. code-block:: c

    err:
        kfree(foo->bar);
        kfree(foo);
        return ret;

The bug in this code is that on some exit paths ``foo`` is ``NULL``. Normally the fix for this bug
is to split it up into two error labels ``err_free_bar`` and ``err_free_foo``, e.g.

.. code-block:: c

    err_free_bar:
        kfree(foo->bar);
    err_free_foo:
        kfree(foo);
        return ret;

.. _c_usage_of_macros:

Usage of Macros
-------------------------------------------------------------------------------
Macros with multiple statements should be enclosed in a ``do { ... }while(0)``, so that a trailing
semicolon works, e.g.

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

    // do not do it like this
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

    // what the hell of the 'index' and 'val'
    #define FOO(val) bar(index, val)

- Make the expression precedence very very clear by using properly parentheses.
- Macros should be used with caution because of the potential for error when invoked with an
  expression that has side effects.
- When putting expressions in macros always wrap the expression in parenthesis to avoid potential
  communitive operation abiguity.

.. code-block:: c

    #define max(x, y)  ((x>y)?(x):(y))
    ...
    max(f(x), z++);

.. _c_conditional_compilation:

Conditional Compilation
-------------------------------------------------------------------------------
Wherever possible, don’t use preprocessor conditionals (``#if``, ``#ifdef``, etc.) in ``.c`` files,
and doing so makes code harder to read and logic harder to follow. Instead, use such conditionals in
a header file defining functions for use in those ``.c`` files, providing no-operation stub versions
in the ``#else`` case, and then call those functions unconditionally from ``.c`` files. The compiler
will avoid generating any code for the stub calls, producing identical results, but the logic will
remain easy to follow.

If you have a function or variable which may potentially go unused in a particular configuration,
and the compiler would warn about its definition going unused, so just mark the definition with
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

.. _c_mixing_c_and_cpp:

Mixing C and C++
-------------------------------------------------------------------------------
When calling a C function from C++, the function name will be mangled unless you turn it off. Name
mangling is turned off with the ``extern "C"`` syntax.

- If you want to create a C function in C++ you must wrap it with the ``extern "C"`` syntax.
- If you want to call a C function in a C library from C++ you must wrap in the above syntax.

.. code-block:: c

    //Creating a C function in C++
    extern "C" void
    a_c_function_in_cplusplus(int a)
    {
        do_some_thing();
    }

    // Calling C functions from C++
    extern "C" int strncpy(...);
    extern "C" int my_great_function();
    extern "C"
    {
        int strncpy(...);
        int my_great_function();
    };

If you have code that must compile in a C and C++ environment then you must use the ``__cplusplus``
preprocessor directive, e.g.

.. code-block:: c

    #ifdef __cplusplus
        extern "C" some_function();
    #else
        extern some_function();
    #endif


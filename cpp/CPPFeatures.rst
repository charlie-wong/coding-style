C++ Features
===============================================================================

.. _cpp_var_rvalue_references:

Rvalue References
-------------------------------------------------------------------------------
Use **rvalue** references only to define move constructors and move assignment operators, or for
perfect forwarding.

Rvalue references are a type of reference that can only bind to temporary objects. The syntax is
similar to traditional reference syntax. For example, ``void f(string&& s);`` declares a function
whose argument is an rvalue reference to a string.

.. _cpp_friends:

Friends
-------------------------------------------------------------------------------
We allow use of ``friend`` classes and functions, within reason.

Friends should usually be defined in the same file so that the reader does not have to look in
another file to find uses of the private members of a class. A common use of ``friend`` is to
have a **FooBuilder** class be a ``friend`` of **Foo** so that it can construct the inner state of
**Foo** correctly, without exposing this state to the world. In some cases it may be useful to make
a unittest class a ``friend`` of the class it tests.

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

RTTI allows a programmer to query the C++ class of an object at run time. This is done
by use of ``typeid`` or ``dynamic_cast``.

.. _cpp_casting:

Casting
-------------------------------------------------------------------------------
- Use C++-style casts like ``static_cast<float>(double_value)``, or brace initialization for
  conversion of arithmetic types like ``int64 y = int64{1} << 42``.
- Do not use cast formats like ``int y = (int)x`` or ``int y = int(x)``, but the latter is okay
  when invoking a constructor of a class type.

C++ introduced a different cast system from C that distinguishes the types of cast operations.

- The problem with C casts is the ambiguity of the operation: sometimes you are doing a conversion,
  e.g., ``(int)3.5`` and sometimes you are doing a cast, e.g., ``(int)"hello"``.
  Brace initialization and C++ casts can often help avoid this ambiguity. Additionally, C++ casts
  are more visible when searching for them.
- The C++-style cast syntax is verbose and cumbersome.

Do not use C-style casts. Instead, use these C++-style casts when explicit type conversion
is necessary.

  - Use brace initialization to convert arithmetic types, e.g. ``int64{x}``. This is the safest
    approach because code will not compile if conversion can result in information loss.
    The syntax is also concise.
  - Use ``static_cast`` as the equivalent of a C-style cast that does value conversion, when you
    need to explicitly up-cast a pointer from a class to its superclass, or when you need to
    explicitly cast a pointer from a superclass to a subclass. In this last case, you must be sure
    your object is actually an instance of the subclass.
  - Use ``const_cast`` to remove the const qualifier (see :ref:`const <cpp_usage_of_const>`).
  - Use ``reinterpret_cast`` to do unsafe conversions of pointer types to and from integer and
    other pointer types. Use this only if you know what you are doing and you understand the
    aliasing issues.
  - See the :ref:`RTTI <cpp_run_time_type_information>` for guidance on the use of ``dynamic_cast``.

.. _cpp_lambda_expressions:

Lambda Expressions
-------------------------------------------------------------------------------
- Use lambda expressions where appropriate.
- Prefer explicit captures when the lambda will escape the current scope.

Lambda expressions are a concise way of creating anonymous function objects. They're often useful
when passing functions as arguments.

.. _cpp_streams:

Streams
-------------------------------------------------------------------------------
Use streams where appropriate, and stick to **simple** usages.

Streams are the standard I/O abstraction in C++, exemplified by the standard header ``<iostream>``.

.. code-block:: c

    int  is_good = 1;     // Bad  - should have type bool.
    bool is_good = true;  // Good - just use boolean type where possible.

.. _cpp_Preincrement_and_Predecrement:

Preincrement and Predecrement
-------------------------------------------------------------------------------
Use prefix form (``++i``) of the increment and decrement operators with iterators and other
template objects.

When a variable is incremented (``++i`` or ``i++``) or decremented (``--i`` or ``i--``) and the
value of the expression is not used, one must decide whether to preincrement (decrement) or
postincrement (decrement).

When the return value is ignored, the **pre** form (``++i``) is never less efficient than the
**post** form (``i++``), and is often more efficient. This is because post-increment (or decrement)
requires a copy of ``i`` to be made, which is the value of the expression. If ``i`` is an iterator
or other non-scalar type, copying ``i`` could be expensive. Since the two types of increment behave
the same when the value is ignored, why not just always pre-increment?

The tradition developed, in C, of using post-increment when the expression value is not used,
especially in for loops. Some find post-increment easier to read, since the **subject** (i) precedes
the **verb** (++), just like in English.

For simple scalar (non-object) values there is no reason to prefer one form and we allow either.
For iterators and other template types, use pre-increment.

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

.. _cpp_0_and_NULL_nullptr:

0, nullptr and NULL
-------------------------------------------------------------------------------
- Use ``0`` for integers
- Use ``0.0`` for reals
- Use ``NULL`` or ``nullptr`` for pointers
- Use ``'\0'`` for chars

For pointers (address values), there is a choice between ``0``, ``NULL``, and ``nullptr``:

- For projects that allow C++11 features, use ``nullptr``.
- For C++03 projects, we prefer ``NULL`` because it looks like a pointer.

In fact, some C++ compilers provide special definitions of ``NULL`` which enable them to give
useful warnings, particularly in situations where ``sizeof(NULL)`` is not equal to ``sizeof(0)``.

Use ``'\0'`` for chars. This is the correct type and also makes code more readable.

.. _cpp_integer_types:

Integer Types
-------------------------------------------------------------------------------
Of the built-in C++ integer types, the only one used is ``int``. If a program needs a variable of
a different size, use a precise-width integer type from ``<stdint.h>``, such as ``int16_t``.
If your variable represents a value that could ever be greater than or equal to 2^31 (2GiB), use a
64-bit type such as ``int64_t``. Keep in mind that even if your value won't ever be too large for
an ``int``, it may be used in intermediate calculations which may require a larger type.
When in doubt, choose a larger type.

C++ does not specify the sizes of its integer types. Typically people assume that:

- ``short`` is 16 bits
- ``int`` is 32 bits
- ``long`` is 32 bits
- ``long long`` is 64 bits

.. _cpp_usage_of_auto:

Usage of auto
-------------------------------------------------------------------------------
- ``auto`` is permitted when it increases readability.
- Never initialize an auto-typed variable with a braced initializer list.

Use ``auto`` to avoid type names that are noisy, obvious, or unimportant, where the type doesn't
aid in clarity for the reader. Continue to use manifest type declarations when it helps readability.

- C++ type names can be long and cumbersome, especially when they involve templates or namespaces.
- When a C++ type name is repeated within a single declaration or a small code region, the
  repetition may not be aiding readability.
- It is sometimes safer to let the type be specified by the type of the initialization expression,
  since that avoids the possibility of unintended copies or type conversions.


.. _cpp_usage_of_const:

Usage of const
-------------------------------------------------------------------------------
Use const whenever it makes sense.

In C++11, ``constexpr`` is a better choice for some uses of const, and use ``constexpr`` to define
true constants or to ensure constant initialization.

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

.. _cpp_usage_of_braced_initializer_list:

Usage of Braced Initializer List
-------------------------------------------------------------------------------
You may use braced initializer lists.

In C++03, aggregate types (arrays and structs with no constructor) could be initialized with braced
initializer lists.

.. code-block:: cpp

    struct Point
    {
        int x;
        int y;
    };
    Point p = {1, 2};

In C++11, this syntax was generalized, and any object type can now be created with a braced
initializer list, known as a braced-init-list in the C++ grammar. Here are a few examples of its use.

.. code-block:: cpp

    // Vector takes a braced-init-list of elements.
    std::vector<string> v{"foo", "bar"};

    // Basically the same, ignoring some small technicalities.
    // You may choose to use either form.
    std::vector<string> v = {"foo", "bar"};

    // Usable with 'new' expressions.
    auto p = new vector<string>{"foo", "bar"};

    // A map can take a list of pairs. Nested braced-init-lists work.
    std::map<int, string> m = {{1, "one"}, {2, "2"}};

    // A braced-init-list can be implicitly converted to a return type.
    std::vector<int> test_function() { return {1, 2, 3}; }

    // Iterate over a braced-init-list.
    for (int i : {-1, -2, -3}) {}

    // Call a function using a braced-init-list.
    void TestFunction2(std::vector<int> v) {}
    TestFunction2({1, 2, 3});

A user-defined type can also define a constructor and/or assignment operator that take
``std::initializer_list<T>``, which is automatically created from braced-init-list:

.. code-block:: cpp

    class MyType
    {
        public:
        // std::initializer_list references the underlying init list.
        // It should be passed by value.
        MyType(std::initializer_list<int> init_list)
        {
            for (int i : init_list) append(i);
        }

        MyType& operator=(std::initializer_list<int> init_list)
        {
            clear();
            for(int i : init_list)
            {
                append(i);
            }
        }
    };
    MyType m{2, 3, 5, 7};

Finally, brace initialization can also call ordinary constructors of data types, even if they do
not have ``std::initializer_list<T>`` constructors.

.. code-block:: cpp

    double d{ 1.23 };
    // Calls ordinary constructor as long as MyOtherType has no
    // std::initializer_list constructor.
    class MyOtherType
    {
        public:
        explicit MyOtherType(string);
        MyOtherType(int, string);
    };
    MyOtherType m = { 1, "b" };
    // If the constructor is explicit, you can't use the "= {}" form.
    MyOtherType m{ "b" };

Never assign a braced-init-list to an ``auto`` local variable. In the single element case,
what this means can be confusing:

.. code-block:: cpp

    auto d = {1.23};        // Bad  - d is a std::initializer_list<double>
    auto d = double{1.23};  // Good - d is a double, not a std::initializer_list

.. _cpp_usage_of_macros:

Usage of Macros
-------------------------------------------------------------------------------
- Avoid defining macros, especially in headers
- Prefer ``inline`` functions, ``enums``, and ``const`` variables
- Name macros with a project-specific prefix
- Do not use macros to define pieces of a C++ API

Macros mean that the code you see is not the same as the code the compiler sees. This can introduce
unexpected behavior, especially since macros have global scope.

The problems introduced by macros are especially severe when they are used to define pieces of a
C++ API, and still more so for ``public`` APIs. Every error message from the compiler when
developers incorrectly use that interface now must explain how the macros formed the interface.
Refactoring and analysis tools have a dramatically harder time updating the interface. As a
consequence, we specifically disallow using macros in this way.

Luckily, macros are not nearly as necessary in C++ as they are in C.

- Instead of using a macro to inline performance-critical code, use an ``inline`` function.
- Instead of using a macro to store a constant, use a ``const`` variable.
- Instead of using a macro to **abbreviate** a long variable name, use a **reference**.
- Instead of using a macro to conditionally compile code, well, don't do that at all,
  except, of course, for the ``#define`` guards to prevent double inclusion of header files.
  It makes testing much more difficult.

Macros can do things these other techniques cannot, and you do see them in the codebase, especially
in the lower-level libraries. And some of their special features (like stringifying, concatenation,
and so forth) are not available through the language proper. But before using a macro, consider
carefully whether there's a non-macro way to achieve the same result.

The following usage pattern will avoid many problems with macros, if you use macros,
follow it whenever possible:

- Don't define macros in a ``.h`` file
- ``#define`` macros right before you use them, and ``#undef`` them right after.
- Do not just ``#undef`` an existing macro before replacing it with your own; instead, pick a name
  that's likely to be unique.
- Try not to use macros that expand to unbalanced C++ constructs, or at least document that behavior well.
- Prefer not using **##** to generate function/class/variable names.

Exporting macros from headers, i.e. defining them in a header without ``#undefing`` them before the
end of the header, is extremely strongly discouraged. If you do export a macro from a header, it
must have a globally unique name. To achieve this, it must be named with a prefix consisting of
your project's namespace name.

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

.. _cpp_about_boost_libraries:

About Boost Libraries
-------------------------------------------------------------------------------
Use only approved libraries from the `Boost <https://www.boost.org/>`_ library collection.

.. _cpp_about_cpp11_features:

About C++ 11 Features
-------------------------------------------------------------------------------
C++11 contains significant changes both to the language and libraries. Use libraries and language
extensions from C++11 when appropriate. Consider portability to other environments before using
C++11 features in your project.


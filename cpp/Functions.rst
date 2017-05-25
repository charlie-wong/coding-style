Functions
===============================================================================

.. _cpp_write_short_functions:

Write Short Functions
-------------------------------------------------------------------------------
Prefer small and focused functions, it is more readable and more manageable.

We recognize that long functions are sometimes appropriate, so no hard limit is placed on functions
length. If a function exceeds about 40 lines, think about whether it can be broken up without
harming the structure of the program.

Another measure of the function is the number of local variables. They shouldn’t exceed 5-10.
If not, then re-think the function, and split it into smaller pieces. A human brain can generally
easily keep track of about 7 different things, anything more and it gets confused. You know you’re
brilliant, but maybe you’d like to understand what you did 2 weeks from now.

Even if your long function works perfectly now, someone modifying it in a few months may add new
behavior. This could result in bugs that are hard to find. Keeping your functions short and simple
makes it easier for other people to read and modify your code.

You could find long and complicated functions when working with some code. Do not be intimidated by
modifying existing code: if working with such a function proves to be difficult, you find that
errors are hard to debug, or you want to use a piece of it in several different contexts, consider
breaking up the function into smaller and more manageable pieces.

.. _cpp_parameter_ordering:

Parameter Ordering
-------------------------------------------------------------------------------
When defining a function, parameter order is: ``inputs``, then ``outputs``.

Parameters to C/C++ functions are either input to the function, output from the function, or both.
Input parameters are usually values or const references, while output and input/output parameters
will be pointers to non-const. When ordering function parameters, put all input-only parameters
before any output parameters. In particular, do not add new parameters to the end of the function
just because they are new; place new input-only parameters before the output parameters.

This is not a hard-and-fast rule. Parameters that are both input and output (often classes/structs)
muddy the waters, and, as always, consistency with related functions may require you to bend the rule.

.. _cpp_reference_arguments:

Reference Arguments
-------------------------------------------------------------------------------
All parameters passed by reference must be labeled ``const``.

In C, if a function needs to modify a variable, the parameter must use a pointer, e.g.

.. code-block:: c

    int foo(int *pval);

In C++, the function can alternatively declare a reference parameter, e.g.

.. code-block:: cpp

    int foo(int &val);

- Defining a parameter as reference avoids ugly code like ``(*pval)++``.
- Necessary for some applications like copy constructors, makes it clear, unlike with pointers,
  that a null pointer is not a possible value.
- References can be confusing, as they have value syntax but pointer semantics.

Within function parameter lists all references must be ``const``, for example:

.. code-block:: cpp

    void Func(const string &in, string *out);

In fact it is a very good convention that **input** arguments are values or ``const`` references,
while **output** arguments are pointers. Input parameters may be ``const`` pointers, but we never
allow non-const reference parameters except when required by convention, e.g., ``swap()``.

However, there are some instances where using ``const T*`` is preferable to ``const T&`` for
**input** parameters. For example:

- You want to pass in a null pointer.
- The function saves a pointer or reference to the input.

Remember that most of the time **input** parameters are going to be specified as ``const T&``.
Using ``const T*`` instead communicates to the reader that the input is somehow treated differently.
So if you choose ``const T*`` rather than ``const T&``, do so for a concrete reason; otherwise it
will likely confuse readers by making them look for an explanation that doesn't exist.

.. _cpp_static_functions:

Static Functions
-------------------------------------------------------------------------------
When functions defined in a ``.c`` file, and will never be used outside of that file, then just
declare them as ``static``.

.. _cpp_function_overloading:

Function Overloading
-------------------------------------------------------------------------------
Use overloaded functions (including constructors) only if a reader looking at a call site can get a
good idea of what is happening without having to first figure out exactly which overload is being
called.

You may write a function that takes a ``const string&`` and overload it with another that takes
``const char*``, which is:

.. code-block:: cpp

    class MyClass
    {
    public:
        void Analyze(const string &text);
        void Analyze(const char *text, size_t textlen);
    };

- Overloading can make code more intuitive by allowing an identically-named function to take
  different arguments. It may be necessary for templatized code, and it can be convenient for
  Visitors.
- If a function is overloaded by the argument types alone, a reader may have to understand
  C++'s complex matching rules in order to tell what's going on. Also many people are confused
  by the semantics of inheritance if a derived class overrides only some of the variants of a
  function.

If you want to overload a function, consider qualifying the name with some information about the
arguments, e.g., ``AppendString()``, ``AppendInt()`` rather than just ``Append()``. If you are
overloading a function to support variable number of arguments of the same type, consider making
it take a ``std::vector`` so that the user can use an initializer list to specify the arguments.

.. _cpp_default_arguments:

Default Arguments
-------------------------------------------------------------------------------
Default arguments are allowed on non-virtual functions when the default is guaranteed to always have
the same value.

- Often you have a function that uses default values, but occasionally you want to override the
  defaults. Default parameters allow an easy way to do this without having to define many functions
  for the rare exceptions. Compared to overloading the function, default arguments have a cleaner
  syntax, with less boilerplate and a clearer distinction between **required** and **optional** arguments.
- Defaulted arguments are another way to achieve the semantics of overloaded functions, so all the
  reasons not to overload functions apply.
- The defaults for arguments in a virtual function call are determined by the static type of the
  target object, and there's no guarantee that all overrides of a given function declare the same
  defaults.
- Default parameters are re-evaluated at each call site, which can bloat the generated code. Readers
  may also expect the default's value to be fixed at the declaration instead of varying at each call.
- Function pointers are confusing in the presence of default arguments, since the function signature
  often doesn't match the call signature. Adding function overloads avoids these problems.

Default arguments are banned on virtual functions, where they don't work properly, and in cases
where the specified default might not evaluate to the same value depending on when it was evaluated.

In some other cases, default arguments can improve the readability of their function declarations
enough to overcome the downsides above, so they are allowed. When in doubt, use overloads.

.. _cpp_trailing_return_type_syntax:

Trailing Return Type Syntax
-------------------------------------------------------------------------------
Use trailing return types only where using the ordinary syntax (leading return types) is impractical
or much less readable.

C++ allows two different forms of function declarations. In the older form, the return type appears
before the function name. For example:

.. code-block:: cpp

    int foo(int x);

The new form, introduced in C++11, uses the ``auto`` keyword before the function name and a trailing
return type after the argument list. For example, the declaration above could equivalently be
written:

.. code-block:: cpp

    auto foo(int x) -> int;

The trailing return type is in the function's scope. This doesn't make a difference for a simple
case like ``int`` but it matters for more complicated cases, like types declared in class scope or
types written in terms of the function parameters.

- Trailing return types are the only way to explicitly specify the return type of a
  :ref:`lambda expression <cpp_lambda_expressions>`. In some cases the compiler is able to deduce a
  lambda's return type, but not in all cases. Even when the compiler can deduce it automatically,
  sometimes specifying it explicitly would be clearer for readers.

  Sometimes it's easier and more readable to specify a return type after the function's parameter
  list has already appeared. This is particularly true when the return type depends on template
  parameters. For example:

  .. code-block:: cpp

    template <class T, class U> auto add(T t, U u) -> decltype(t + u);

  versus

  .. code-block:: cpp

    template <class T, class U> decltype(declval<T&>() + declval<U&>()) add(T t, U u);

- Trailing return type syntax is relatively new and it has no analogue in C++-like languages like C
  and Java, so some readers may find it unfamiliar.

  Existing code bases have an enormous number of function declarations that aren't going to get
  changed to use the new syntax, so the realistic choices are using the old syntax only or using
  a mixture of the two. Using a single version is better for uniformity of style.

In most cases, continue to use the older style of function declaration where the return type goes
before the function name. Use the new trailing-return-type form only in cases where it's required
(such as **lambdas**) or where, by putting the type after the function's parameter list, it allows
you to write the type in a much more readable way. The latter case should be rare.


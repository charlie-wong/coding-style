Scoping
===============================================================================

.. _cpp_scope_named_namespaces:

Named Namespaces
-------------------------------------------------------------------------------
- Make proper use of ``inline namespaces``.
- Do not declare anything in namespace ``std``.
- With few exceptions, always place code in a ``namespace``.
- Do not use ``using`` directives, e.g. ``using namespace foo;``.

Namespaces subdivide the global scope into distinct, named scopes, and so are
useful for preventing name collisions in the global scope while allowing most
code to use reasonably short names. Namespaces should have unique names based
on the project name, and possibly its path.

Declaring entities in namespace ``std`` is undefined behavior, i.e, not portable.
To declare entities from the standard library, just include the appropriate
header file. Use a ``using`` directive make all names from a namespace available
pollutes the namespace.

.. code-block:: cpp

    // NEVER do it like this. This pollutes the namespace.
    using namespace foo;

Do not use namespace **aliases** at namespace scope in header files except in
explicitly marked internal-only namespaces, because anything imported into a
namespace in a header file becomes part of the public API exported by that file.

Namespaces should be used as follows:

- Just following :ref:`cpp_naming_namespace`.
- Namespaces wrap the entire source file after includes.
- Terminate namespaces with comments as shown in the following example.

.. code-block:: cpp

    ///////////////////////
    // In header file .h //
    ///////////////////////
    //
    // NOTE: the namespace open curly on the same line
    // with the keyword. They are special, ain't they?
    namespace mynamespace {

    // All declarations are within the namespace scope.
    //
    // NOTE: the lack of indentation for code in the namespace make sense.
    class MyClass
    {
    // NOTE: the lack of indentation for public
    public:
        // 4 spaces indent make it more readable.
        ...
        void foo(void);
    };

    // It is clear enough where the namespace ends and which one.
    } // namespace: mynamespace


    ////////////////////////
    // In source file .cc //
    ////////////////////////
    //
    // NOTE: the namespace open curly on the same line
    // with the keyword. They are special, ain't they?
    namespace mynamespace {

    // Definition of functions is within scope of the namespace.
    //
    // NOTE: the lack of indentation makes code not go that right far.
    void MyClass::foo(void)
    {
        do_some_thing();
    }

    } // namespace: mynamespace

.. _cpp_scope_unnamed_namespaces:

Unnamed Namespaces
-------------------------------------------------------------------------------
When definitions in a ``.cc`` file do **not** need to be referenced outside that
file, place them in an unnamed namespace, and do not use them in the header
files. Also see :ref:`cpp_scope_static_variables`.

All declarations can be given internal linkage by placing them in unnamed
namespaces, and functions and variables can be given internal linkage by
declaring them ``static``. This means that anything you're declaring can
not be accessed from another file. If a different file declares something
with the same name, then the two entities are completely independent.

Format of unnamed namespaces like named namespaces. In the terminating
comment, just leave the namespace name empty, e.g.

.. code-block:: cpp

    namespace {

    do_some_thing_here
    ...

    } // namespace:

.. _cpp_scope_static_variables:

Static Variables
-------------------------------------------------------------------------------
When variables definied in a ``.cc`` file do not need to be referenced outside
that file, declare them as ``static``. It is rarely to define ``static``
variables in header files. Also see :ref:`cpp_scope_unnamed_namespaces`.

.. _cpp_scope_scoped_functions:

Scoped Functions
-------------------------------------------------------------------------------
Functions in C++ have 2 type: **nonmember-functions** and **member-functions**.

- Prefer placing nonmember functions in a namespace, and rarely use global functions.
- Prefer grouping functions with a namespace instead of using a class as if it were a namespace.
- If you define a nonmember function and it is only needed in the ``.cc`` file,
  use internal linkage to limit its scope, which is use ``static`` keywords.
- Static member functions of a class should generally be closely related to
  instances of the class or the class's static data.

Nonmember functions and static member functions can be useful in some situations.
Putting nonmember functions in a namespace avoids polluting the global namespace.

Sometimes it is useful to define a function not bound to a class instance.
Such a function can be either a static member or a nonmember function.
Nonmember functions should not depend on external variables, and should
nearly always exist in a namespace. Rather than creating classes only to
group static member functions which do not share static data, use namespaces
instead, for example:

.. code-block:: cpp

    namespace myproject {
    namespace foobar {
    void function_1();
    void function_2();

    } // namespace: foobar
    } // namespace: myproject

Instead of

.. code-block:: cpp

    namespace myproject {
    class FooBar
    {
    public:
        static void function1();
        static void function2();
    };
    } // namespace: myproject

.. _cpp_scope_static_storage_duration:

Static Storage Duration
-------------------------------------------------------------------------------
Objects with static storage duration, including **global** variables,
**static** variables, **static class** member variables, and **function static**
variables, must be Plain Old Data (POD): only for ``int``, ``char``, ``float``,
``double``, or ``pointers``, ``arrays`` or ``structs``.

Variables of class type with static storage duration are forbidden, because
they can cause hard-to-find bugs due to indeterminate order of construction
and destruction. However, such variables are allowed if they are **constexpr**:
they have no dynamic initialization or destruction.

The order in which class constructors and initializers for static variables are
called is only partially specified in C++ and can even change from build to
build, which can cause bugs that are difficult to find. Therefore in addition
to banning globals of class type, we do not allow non-local static variables to
be initialized with the result of a function, unless that function (such as
``getenv()``, or ``getpid()``) does not itself depend on any other globals.
However, a static POD variable within function scope may be initialized with
the result of a function, since its initialization order is well-defined and
does not occur until control passes through its declaration.

Likewise, global and static variables are destroyed when the program terminates,
regardless of whether the termination is by returning from ``main()`` or by
calling ``exit()``. The order in which destructors are called is defined to be
the reverse of the order in which the constructors were called. Since constructor
order is indeterminate, so is destructor order. One way to alleviate the
destructor problem is to terminate the program by calling ``quick_exit()``
instead of ``exit()``.

If you need a static or global variable of a class type, consider initializing
a pointer (which will never be freed), from either your ``main()`` function or
from ``pthread_once()``. Note that this must be a raw pointer, not a **smart**
pointer, since the smart pointer's destructor will have the order-of-destructor
issue that we are trying to avoid.

.. _cpp_scope_global_variables:

Global Variables
-------------------------------------------------------------------------------
Avoid using global variable where possible.

.. _cpp_scope_local_variables:

Locale Variables
-------------------------------------------------------------------------------
Place a function's variables in the narrowest scope, and initialize variables
in the declaration.

- Declare local variables in as local a scope as possible.
- Declare local variables as close to the first use as possible.

This makes it easier for the reader to find the declaration and see what type
the variable is and what it was initialized to. In particular, initialization
should be used instead of declaration and assignment, e.g.

.. code-block:: cpp

    int i;
    i = f(); // Bad -- initialization separate from declaration.

    int j = g(); // Good -- declaration has initialization.

    // Bad - Prefer initializing using brace initialization.
    std::vector<int> v;
    v.push_back(1);
    v.push_back(2);

    // Good - v starts initialized.
    std::vector<int> v = {1, 2};

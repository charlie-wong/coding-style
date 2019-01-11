Formatting
===============================================================================
See the C :ref:`c_format_rules` rules first, following just its supplement or
overwrite for C++ features.

.. _cpp_format_namespace:

Namespace
-------------------------------------------------------------------------------
- The contents of ``namespaces`` are **NOT** indented.
- Put the **open** curly of namespace on the same with the keywords ``namespace``.
- Put the **close** curly of namespace on the line by itself.
- Put comment at the **close** curly of namespace.

  - for named namespace, format is: ``} // namespace: name-of-namespace``
  - for unnamed namespace, format is: ``} // namespace``

.. code-block:: cpp

    namespace foobar {

    void foo()
    {
        // No extra indentation within namespace
    }

    } // namespace: foobar

When declaring nested namespaces, put each namespace on its own line,
also no indent, for example:

.. code-block:: cpp

    namespace foo {
    namespace bar {

    } // namespace: bar
    } // namespace: foo

.. _cpp_format_class_definition:

Class Definition
-------------------------------------------------------------------------------
- Sections in ``public``, ``protected`` and ``private`` order, and each indented 4 space.
- ``public``, ``protected`` and ``private`` keywords line-up to ``class``, no indented.
- ``public:``, ``protected:`` and ``private:`` keywords on the line by itself.
- No spaces between **BaseClassName** and the colon, e.g: ``class MyClass: public XxYyZz``.
- Properly spaces between the colon and access control keywords, e.g: ``class MyClass: public XxYyZz``.
- Base class name should be on the same line as the subclass name, if not fit, break line up.

The basic format for a class definition is as following:

.. code-block:: cpp

    // no spaces after the colon
    class MyClass: public OtherClass
    {
    public: // no spaces after the colon, on the line by itself
        MyClass(); // 4 space indent
        explicit MyClass(int var);
        ~MyClass() {}

        void someFunction();
        void someFunctionThatDoesNothing()
        {
            short_inline_function_do_something();
        }

        void setSomeVar(int var)
        {
            _some_var = var;
        }
        int getSomeVar() const
        {
            return _some_var;
        }

    private:
        bool someInternalFunction();

        int _some_var;
        int _some_other_var;
    };

A ``class`` definition should usually start with a ``public`` section,
followed by ``protected``, then ``private``. Omit sections that would be
empty. Group similar declarations together, placing public parts earlier.

The ordering of declarations within each of these sections generally prefer
grouping similar kinds of declarations together and with the following order:

- types: including ``typedef``, ``using``, and nested ``struct`` and ``class``
- constants
- factory functions
- constructors
- assignment operators
- destructor
- all other methods
- data members.

.. tip::

    Do not put large method definitions ``inline`` in the class definition.
    Usually, only trivial or performance-critical, and very short, methods
    may be defined ``inline``.

.. _cpp_format_constructor_initializer_lists:

Class Constructor Initializer Lists
-------------------------------------------------------------------------------
Constructor initializer lists should be all on one line, if not fit, break line up properly.

.. code-block:: cpp

    // When everything fits on one line
    MyClass::MyClass(int var): _some_var(var)
    {
        DoSomething();
    }

    // If the signature and initializer list are not all on
    // one line, wrap before the colon and indent 4 spaces
    MyClass::MyClass(int var)
        : _some_var(var), _some_other_var(var + 1)
    {
        doSomething();
    }

    // When the list spans multiple lines, put each member on its own line
    // and align them
    MyClass::MyClass(int var)
        : _some_var(var), // 4 space indent
          _some_other_var(var + 1) // lined up
    {
        doSomething();
    }

.. _cpp_format_lambda_expression:

Lambda Expression
-------------------------------------------------------------------------------
- Capture lists like other comma-separated lists.
- Format parameters and bodies as for any other function.


For by-reference captures, do not leave a space between
ampersand (``&``) and variable name.

.. code-block:: cpp

    int x = 0;
    auto plus_n = [&x](int n) -> int { return x + n; }

Short lambdas may be written inline as function arguments.

.. code-block:: cpp

    std::set<int> blacklist = {7, 8, 9};
    std::vector<int> digits = {3, 9, 1, 8, 4, 7, 1};
    digits.erase(std::remove_if(digits.begin(), // per arguments one line
                 digits.end(), // line up the arguments
                 [&blacklist](int i) { return blacklist.find(i) != blacklist.end();}),
                 digits.end());

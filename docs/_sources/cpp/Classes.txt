Classes
===============================================================================
Classes are the fundamental unit of code in C++.

.. _cpp_constructors:

Constructors
-------------------------------------------------------------------------------
It is possible to perform arbitrary initialization in the body of the constructor.

- Avoid virtual method calls in constructors.
- Avoid initialization that can fail if you can't signal an error.
- No need to worry about whether the class has been initialized or not.
- Objects that are fully initialized by constructor call can be const and may also be easier to use
  with standard containers or algorithms.

.. _cpp_implicit_conversions:

Implicit Conversions
-------------------------------------------------------------------------------
Do not define implicit conversions. Use the ``explicit`` keyword for conversion operators and
single-argument constructors.

Implicit conversions allow an object of one type (called the source type) to be used where a
different type (called the destination type) is expected, e.g. when passing an ``int`` argument to a
function that takes a ``double`` parameter.

In addition to the implicit conversions defined by the language, users can define their own, by
adding appropriate members to the class definition of the source or destination type.
An implicit conversion in the source type is defined by a type conversion operator named after the
destination type (e.g. operator bool()).
An implicit conversion in the destination type is defined by a constructor that can take the source
type as its only argument (or only argument with no default value).

The ``explicit`` keyword can be applied to a constructor or (since C++11) a conversion operator, to
ensure that it can only be used when the destination type is explicit at the point of use, e.g. with
a ``cast``. This applies not only to implicit conversions, but to C++11's list initialization syntax.

- Implicit conversions can make a type more usable and expressive by eliminating the need to
  explicitly name a type when it's obvious.
- Implicit conversions can be a simpler alternative to overloading.
- List initialization syntax is a concise and expressive way of initializing objects.
- Implicit conversions can hide type-mismatch bugs, where the destination type does not match the
  user's expectation, or the user is unaware that any conversion will take place.
- Implicit conversions can make code harder to read, particularly in the presence of overloading,
  by making it less obvious what code is actually getting called.
- Constructors that take a single argument may accidentally be usable as implicit type conversions,
  even if they are not intended to do so.
- When a single-argument constructor is not marked explicit, there's no reliable way to tell whether
  it's intended to define an implicit conversion, or the author simply forgot to mark it.
- It's not always clear which type should provide the conversion, and if they both do, the code
  becomes ambiguous.
- List initialization can suffer from the same problems if the destination type is implicit,
  particularly if the list has only a single element.

Type conversion operators, and constructors that are callable with a single argument, must be marked
``explicit`` in the class definition. As an exception, copy and move constructors should not be
explicit, since they do not perform type conversion. Implicit conversions can sometimes be necessary
and appropriate for types that are designed to transparently wrap other types. In that case, contact
your project leads to request a waiver of this rule.

Constructors that cannot be called with a single argument should usually omit explicit. Constructors
that take a single ``std::initializer_list`` parameter should also omit explicit, in order to
support copy-initialization (e.g. ``MyType m = {1, 2};``).

.. _cpp_copyable_and_movable_types:

Copyable and Movable Types
-------------------------------------------------------------------------------
Support copying and/or moving if these operations are clear and meaningful for your type. Otherwise,
disable the implicitly generated special functions that perform copies and moves.

A **copyable** type allows its objects to be initialized or assigned from any other object of the
same type, without changing the value of the source. For user-defined types, the copy behavior is
defined by the copy constructor and the copy-assignment operator. ``string`` is an example of a
copyable type.

A **movable** type is one that can be initialized and assigned from temporaries (all copyable types
are therefore movable). ``std::unique_ptr<int>`` is an example of a movable but not copyable type.
For user-defined types, the move behavior is defined by the move constructor and the move-assignment
operator.

The copy/move constructors can be implicitly invoked by the compiler in some situations,
e.g. when passing objects by value.

Objects of copyable and movable types can be passed and returned by value, which makes APIs simpler,
safer, and more general. Unlike when passing objects by pointer or reference, there's no risk of
confusion over ownership, lifetime, mutability, and similar issues, and no need to specify them in
the contract. It also prevents non-local interactions between the client and the implementation,
which makes them easier to understand, maintain, and optimize by the compiler. Further, such objects
can be used with generic APIs that require pass-by-value, such as most containers, and they allow
for additional flexibility in e.g., type composition.

Copy/move constructors and assignment operators are usually easier to define correctly than
alternatives like ``Clone()``, ``CopyFrom()`` or ``Swap()``, because they can be generated by the
compiler, either implicitly or with ``=`` default. They are concise, and ensure that all data members
are copied. Copy and move constructors are also generally more efficient, because they don't require
heap allocation or separate initialization and assignment steps, and they're eligible for
optimizations such as copy elision.

Move operations allow the implicit and efficient transfer of resources out of rvalue objects. This
allows a plainer coding style in some cases.

Some types do not need to be copyable, and providing copy operations for such types can be
confusing, nonsensical, or outright incorrect. Types representing singleton objects (Registerer),
objects tied to a specific scope (Cleanup), or closely coupled to object identity (Mutex) cannot be
copied meaningfully. Copy operations for base class types that are to be used polymorphically are
hazardous, because use of them can lead to object slicing. Defaulted or carelessly-implemented copy
operations can be incorrect, and the resulting bugs can be confusing and difficult to diagnose.

Copy constructors are invoked implicitly, which makes the invocation easy to miss. This may cause
confusion for programmers used to languages where pass-by-reference is conventional or mandatory.
It may also encourage excessive copying, which can cause performance problems.

Provide the copy and move operations if their meaning is clear to a casual user and the
copying/moving does not incur unexpected costs. If you define a copy or move constructor, define
the corresponding assignment operator, and vice-versa. If your type is copyable, do not define move
operations unless they are significantly more efficient than the corresponding copy operations. If
your type is not copyable, but the correctness of a move is obvious to users of the type, you may
make the type move-only by defining both of the move operations.

If your type provides copy operations, it is recommended that you design your class so that the
default implementation of those operations is correct. Remember to review the correctness of any
defaulted operations as you would any other code, and to document that your class is copyable and/or
cheaply movable if that's an API guarantee.

.. _cpp_structs_vs_classes:

Structs VS. Classes
-------------------------------------------------------------------------------
Use a ``struct`` only for passive objects that carry data, and everything else is a ``class``.

The ``struct`` and ``class`` keywords behave almost identically in C++. We add our own semantic
meanings to each keyword, so you should use the appropriate keyword for the data-type you're defining.

``structs`` should be used for passive objects that carry data, and may have associated constants,
but lack any functionality other than access/setting the data members. The accessing/setting of
fields is done by directly accessing the fields rather than through method invocations. Methods
should not provide behavior but should only be used to set up the data members, e.g., constructor,
destructor, Initialize(), Reset(), Validate().

If more functionality is required, a ``class`` is more appropriate. If in doubt, make it a ``class``.

For consistency with STL, you can use ``struct`` instead of ``class`` for functors and traits.

Note that member variables in ``struct`` and ``class`` have different naming rules. Data members are
all lowercase, with underscores between words, can have digit number if necessary. Data members of
``class`` leading with ``x_``, while data members of ``struct`` have perfix of ``m_``, e.g.

.. code-block:: cpp

    // here we use suffix of _st, because in C++ we can omit struct
    // directly use the struct name, not like C way.
    struct a_struct_type_st
    {
        int m_age;
    };

    class ThisIsClass
    {
        string x_name;
    };

.. _cpp_inheritance:

Inheritance
-------------------------------------------------------------------------------
Composition is often more appropriate than inheritance. When using inheritance, make it public.

.. _cpp_multiple_inheritance:

Multiple Inheritance
-------------------------------------------------------------------------------
Only very rarely is multiple implementation inheritance actually useful.
We allow multiple inheritance only when at most one of the base classes has an implementation;
all other base classes must be pure interface classes tagged with the Interface suffix.

.. _cpp_interfaces:

Interfaces
-------------------------------------------------------------------------------
Classes that satisfy certain conditions are allowed, but not required, to end with an Interface
suffix.

.. _cpp_operator_overloading:

Operator Overloading
-------------------------------------------------------------------------------
Overload operators judiciously. Do not create user-defined literals.

.. _cpp_access_control:

Access Control
-------------------------------------------------------------------------------
Make data members private, unless they are ``static const``.

.. _cpp_declaration_order:

Declaration Order
-------------------------------------------------------------------------------
Group similar declarations together, placing ``public`` parts earlier.

A class definition should usually start with a ``public`` section, followed by ``protected``, then
``private``. Omit sections that would be empty.

Within each section, generally prefer grouping similar kinds of declarations together, and generally
prefer the following order:

    - types (including ``typedef``, ``using``, and nested ``struct`` and ``class``)
    - constants
    - factory functions
    - constructors
    - assignment operators
    - destructor
    - all other methods
    - data members

Do not put large method definitions ``inline`` in the class definition. Usually, only trivial or
performance-critical, and very short, methods may be defined ``inline``.


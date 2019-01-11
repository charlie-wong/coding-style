Naming
===============================================================================
See the C :ref:`c_naming_rules` rules first, following just its supplement or
overwrite for C++ features.

.. _cpp_naming_filename:

File
-------------------------------------------------------------------------------
- The file name part like C :ref:`c_naming_filename`, but with ``.cc`` for source.
- It is alos OK if name part is Camel-Case with ``.cc`` for source and none for header like Qt.

Use underscores to separate words. Examples of acceptable file names:

- **myUsefulFile.cc** and **myUsefulFile**
- **my_useful_file.cc** and **my_useful_file.h**

.. _cpp_naming_namespace:

Namespace
-------------------------------------------------------------------------------
- Top-level namespace names are based on the project name.
- Namespace names are all lower-case, no underscore and digital.
- Avoid collisions between nested namespaces and well-known top-level namespaces.

The name of a top-level namespace should usually be the name of the project or
team. The code in that namespace should usually be in a directory whose basename
matches the namespace name.

Keep in mind that the rule against abbreviated names applies to ``namespace``
just as much as variable names. Code inside namespace seldom needs to mention
the namespace name, so there's usually no particular need for abbreviation of
the namespace name anyway.

Avoid nested namespaces that match well-known top-level namespaces. Collisions
between namespace names can lead to surprising build breaks because of name
lookup rules. In particular, do not create any nested ``std`` namespaces.

For internal namespaces, be wary of other code being added to the same internal
namespace causing a collision. In such a situation, using the filename to make
a unique internal name is helpful, for example: ``foo::helper::message``
for use in ``message.h`` header file.

.. _cpp_naming_type_names:

Type Names
-------------------------------------------------------------------------------
Type names of ``class``, ``struct``, ``typedef``, ``enum``, ``type template parameters``
have the same naming convention, which is start with a capital letter and have a
capital letter for each new word, with no underscores, which is called
`Camel Case <https://en.wikipedia.org/wiki/Camel_case>`_.

.. code-block:: cpp

    class ThisIsClass;
    struct ThisIsStruct;
    enum ThisIsEnum;
    union ThisIsUnion;
    // type aliases
    typedef MyClass ThisIsTypeAliases;
    typedef hash_map<UrlTableProperties *, string> ThisIsTypeAliases;

Also see :ref:`C Type Naming <c_naming_typedef>`.

.. _cpp_naming_data_member:

Data Member
-------------------------------------------------------------------------------
Data members of ``struct``, the same as C :ref:`c_naming_struct_member`, like:

.. code-block:: c

    struct TableInfo
    {
        ...
        static Pool<TableInfo> *pool;

        string table_name;
        string tablename; // OK - no prefix underscore
    };

Data members of ``union``, the same as C :ref:`c_naming_union_member`, like:

.. code-block:: c

    union TableInfo
    {
        void *chunk;
        int count;
        string table_name;
        string tablename; // OK - no prefix underscore
    };


Data members of ``class``, like the C :ref:`c_naming_struct_member`,
but with a prefix underscore, for example:

.. code-block:: cpp

    class TableInfo
    {
        ...
    private:
        static Pool<TableInfo> *_pool; // OK

        string _table_name; // OK
        string _tablename; // OK - prefix underscore
    };

.. _cpp_naming_function_member:

Function Member
-------------------------------------------------------------------------------
Regular member functions names follows `Camel Case <https://en.wikipedia.org/wiki/Camel_case>`_,
with no underscores.

.. _cpp_naming_enum_member:

Enum Member
-------------------------------------------------------------------------------
The same as C :ref:`c_naming_enum_member`.

.. _cpp_naming_global_static:

Global & Static Variable
-------------------------------------------------------------------------------
Objects with `static storage duration <http://en.cppreference.com/w/cpp/language/storage_duration#Storage_duration>`_
are forbidden unless they are
`trivially destructible <http://en.cppreference.com/w/cpp/types/is_destructible>`_.
Informally this means that the destructor does not do anything, even taking
member and base destructors into account. More formally it means that the type
has no user-defined or virtual destructor and that all bases and non-static
members are trivially destructible. Static function-local variables may use
dynamic initialization.

Naming
===============================================================================
Make names fit, they are the heart of programming, seriously.

The most important consistency rules are those that govern naming. The style of a name immediately
informs us what sort of thing the named entity is: a type, a variable, a function, a constant,
a macro, etc., without requiring us to search for the declaration of that entity.
The pattern-matching engine in our brains relies a great deal on these naming rules.

Naming rules are pretty arbitrary, but we feel that consistency is more important than individual
preferences in this area, so regardless of whether you find them sensible or not, the rules are the
rules.

.. _cpp_general_naming_rules:

General Naming Rules
-------------------------------------------------------------------------------
- Use intention-revealing names, names should reveal real intent, avoid disinformation.
- Make names should have meaningful distinctions and try best make them pronounceable.
- Make it clear, easy to read, write and understand, within reason.
- Names should be descriptive, avoid abbreviation.

Give as descriptive a name as possible, within reason. Do not worry about saving horizontal space as
it is far more important to make your code immediately understandable by a new reader.

Do not use abbreviations that are ambiguous or unfamiliar to readers outside your project, and do
NOT abbreviate by deleting letters within a word. Note that certain universally-known abbreviations
are OK, such as i for an iteration variable.

.. code-block:: c

	int price_count_reader;    ///< Good - No abbreviation.
	int num_errors;            ///< Good - "num" is a widespread convention.
	int num_dns_connections;   ///< Good - Most people know what "DNS" stands for.

	int n;                     ///< Bad  - Meaningless.
	int nerr;                  ///< Bad  - Ambiguous abbreviation.
	int n_comp_conns;          ///< Bad  - Ambiguous abbreviation.
	int wgc_connections;       ///< Bad  - Only your group knows what this stands for.
	int pc_reader;             ///< Bad  - Lots of things can be abbreviated "pc".
	int cstmr_id;              ///< Bad  - Deletes internal letters.

.. _cpp_file_naming_rules:

File Naming Rules
-------------------------------------------------------------------------------
Filenames should be all lowercase with underscores between words, if necessary can have digital
numbers. C files should end in ``.cc`` and header files should end in ``.h``.

Use underscores to separate words. Examples of acceptable file names:

	- my_useful_file.c
	- my_useful_file.h

.. tip::
	- Do not use filenames that already exist in ``/usr/include``, such as ``db.h``.
	- In general, make your filenames very specific.
	  For example, use ``http_server_logs.h`` rather than ``logs.h``.

.. _cpp_namespace_naming_rules:

Namespace Names Naming Rules
-------------------------------------------------------------------------------
- Namespace names are all **lower-case**, without underscore and digital number.
- Top-level namespace names are based on the project name.
- Avoid collisions between nested namespaces and well-known top-level namespaces.

The name of a top-level namespace should usually be the name of the project or team. The code in
that namespace should usually be in a directory whose basename matches the namespace name.

Keep in mind that the rule against abbreviated names applies to namespaces just as much as variable
names. Code inside the namespace seldom needs to mention the namespace name, so there's usually no
particular need for abbreviation anyway.

Avoid nested namespaces that match well-known top-level namespaces. Collisions between namespace
names can lead to surprising build breaks because of name lookup rules. In particular, do not create
any nested ``std`` namespaces.

For internal namespaces, be wary of other code being added to the same internal namespace causing a
collision. In such a situation, using the filename to make a unique internal name is helpful, for
example: ``foo::helper::message_internal`` for use in ``message.h`` header file.

.. _cpp_type_naming_rules:

Type Naming Rules
-------------------------------------------------------------------------------
All type names start with capital letter and have capital letter for each new word,
with no underscores, which is called `Camel Case <https://en.wikipedia.org/wiki/Camel_case>`_. 

.. code-block:: cpp

    class ThisIsClassType;
    struct ThisIsStructType;
    enum ThisIsEnumType;
    union ThisIsUnionType;
    // type aliases
    typedef MyClass ThisIsTypeAliasesName;
    typedef hash_map<UrlTableProperties *, string> ThisIsTypeAliasesName;


Also see :ref:`Type Naming Rules of C <c_type_naming_rules>`.

.. _cpp_common_variable_naming_rules:

Common Variable Naming Rules
-------------------------------------------------------------------------------
- All variable names consist of lowercase and underscores, if necessary can have digital numbers.
- NO mixed case.

For example:

.. code-block:: c

	string table_name;  ///< OK  - uses underscore.
	string tablename;   ///< OK  - all lowercase.

	string tableName;   ///< Bad - mixed case.

.. tip::

    - It maybe a good idea to make and use searchable names.

.. _cpp_struct_member_naming_rules:

Struct Member Naming Rules
-------------------------------------------------------------------------------
Members of struct are named like :ref:`common variables <cpp_common_variable_naming_rules>` with prefix
``m_``.

.. _cpp_class_member_naming_rules:

Class Member Naming Rules
-------------------------------------------------------------------------------
Members of class are named like :ref:`common variables <cpp_common_variable_naming_rules>` with prefix
``x_``.

.. _cpp_enum_member_naming_rules:

Enum Member Naming Rules
-------------------------------------------------------------------------------
Members of enum are named like :ref:`common variables <cpp_common_variable_naming_rules>` with prefix
``k_``.

.. tip::

    It maybe a good idea to hava format like, ``k_<id>``, where ``id`` is a short name derived from
    that enumeration.

.. _cpp_union_member_naming_rules:

Union Member Naming Rules
-------------------------------------------------------------------------------
Members of union are named like :ref:`common variables <cpp_common_variable_naming_rules>` with prefix
``m_``.

.. _cpp_global_variable_naming_rules:

Global Variable Naming Rules
-------------------------------------------------------------------------------
Global variable name just like :ref:`common variables <cpp_common_variable_naming_rules>`, but with
prefix ``g_``.

.. _cpp_static_variable_naming_rules:

Static Variable Naming Rules
-------------------------------------------------------------------------------
Static variable name just like :ref:`common variables <cpp_common_variable_naming_rules>`, but with
prefix ``s_``.

.. _cpp_local_variable_naming_rules:

Local Variable Naming Rules
-------------------------------------------------------------------------------
Local variable just following :ref:`Common Variable Naming Rules <cpp_common_variable_naming_rules>`.

Local variable names should be short, and to the point. If you have some random integer loop
counter, it should probably be called ``i``. It is clear enough and there is no chance of it being
mis-understood. Similarly, ``tmp`` can be just about any type of variable that is used to hold a
temporary value.

.. _cpp_const_variable_naming_rules:

Constant Variable Naming Rules
-------------------------------------------------------------------------------
All constant variables, and whose value is fixed for the duration of the program,
following :ref:`Common Variable Naming Rules <cpp_common_variable_naming_rules>`, but with a leading ``k``.
Also see :ref:`Enum Member Naming Rules <cpp_enum_member_naming_rules>`.

.. _cpp_function_naming_rules:

Function Naming Rules
-------------------------------------------------------------------------------
- Global function name see :ref:`Function Naming Rules of C <c_function_naming_rules>`.
- Regular member functions names follows `Camel Case <https://en.wikipedia.org/wiki/Camel_case>`_,
  with no underscores. Also see

  - :ref:`Type Naming Rules <cpp_type_naming_rules>`
  - :ref:`Namespace Names Naming Rules <cpp_namespace_naming_rules>`

.. tip::

    It maybe a good idea to have a perfix for a serial or module of functions.

.. _cpp_macro_naming_rules:

Macro Naming Rules
-------------------------------------------------------------------------------
Macro names consist of uppercase and underscores, if necessary can have digital numbers.

- If macros are resembling functions, then name them in lower case is better.
- If a macros can be empty, then always use capitalized letters, e.g. ``DEBUG_MSG(msg)``.

.. code-block:: c

	/// header file guard macro
	#define <PROJECT>_<PATH>_<FILE>_H

	/// awesome macro defination
	#define AWESOME_MACRO_DEFINATION

	/// constant number value
	#define PI (3.1415926)

	/// constant string value
	#define CONFIG_FILE_NAME "config"

	/// function like macro
	#ifdef SHOW_DEBUG_MESSAGE
	#   define DEBUG_MSG(msg) printf("%s\n", msg);
	#else
	#   define DEBUG_MSG(msg)
	#endif

.. note::

	- General speaking, if not necessary, macros should not be used.

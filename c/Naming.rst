Naming
===============================================================================
The most important consistency rules are those that govern naming. The style of a name immediately
informs us what sort of thing the named entity is: a type, a variable, a function, a constant,
a macro, etc., without requiring us to search for the declaration of that entity.
The pattern-matching engine in our brains relies a great deal on these naming rules.

A name is the result of a long deep thought process about the ecology it lives in. Only a programmer
who understands the system as a whole can create a name that **fits** with the system. If the name
is appropriate everything fits together naturally, relationships are clear, meaning is derivable,
and reasoning from common human expectations works as expected.

Naming rules are pretty arbitrary, but we feel that consistency is more important than individual
preferences in this area, so regardless of whether you find them sensible or not, the rules are the
rules.

.. _c_general_naming_rules:

General Naming Rules
-------------------------------------------------------------------------------
- Use intention-revealing names, names should reveal real intent, avoid disinformation.
- Make names should have meaningful distinctions and try best make them pronounceable.
- Make it clear, easy to read, write and understand, within reason.
- Names should be descriptive, avoid abbreviation.
- Give more context information in the names.

Give as descriptive a name as possible, within reason. Do not worry about saving horizontal space as
it is far more important to make your code immediately understandable by a new reader.

Do not use abbreviations that are ambiguous or unfamiliar to readers outside your project, and do
NOT **abbreviate** by deleting letters within a word. Note that certain universally-known
abbreviations are OK, such as ``i`` for an iteration variable.

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

.. _c_file_naming_rules:

File Naming Rules
-------------------------------------------------------------------------------
Filenames should be all lowercase with underscores between words, if necessary can have digital
numbers. Source files should end in ``.c``, and header files should end in ``.h``.
Examples of acceptable file names are:

	- my_useful_file.c
	- my_useful_file.h

- Do not reuse a `standard <https://www.securecoding.cert.org/confluence/display/c/PRE04-C.+Do+not+reuse+a+standard+header+file+name>`_ header file names, e.g. **locale.h**, **time.h**, etc.
- In general, make your filenames very specific, with more context information.
  For example, use **http_server_logs.h** rather than **logs.h**.

.. _c_type_naming_rules:

Type Naming Rules
-------------------------------------------------------------------------------
Typedef-ed types should be all lowercase with underscores between words, and have one of suffix:

	- suffix ``_st`` for ``typedef struct``
	- suffix ``_et`` for ``typedef enum``
	- suffix ``_ut`` for ``typedef union``
	- suffix ``_bt`` for basic type aliases, e.g. ``typedef int buffer_id_bt;``
	- suffix ``_ft`` for function type, e.g. ``typedef int (*func_ft)(int cnt);``

Non-Typedef-ed ``struct``/``enum``/``union`` for forward necessary declaration, with one of suffix
as following:

	- suffix ``_ST`` for ``struct``
	- suffix ``_ET`` for ``enum``
	- suffix ``_UT`` for ``union``

Use typedefs of non-pointer types only, , and all use typedef version, for convenience.

.. _c_common_variable_naming_rules:

Common Variable Naming Rules
-------------------------------------------------------------------------------
All variable names consist of lowercase and underscores, if necessary can have digital numbers.

For example:

.. code-block:: c

	string table_name;  ///< OK  - uses underscore.
	string tablename;   ///< OK  - all lowercase.

	string tableName;   ///< Bad - mixed case.

.. tip::

    - It is a good idea to make and use searchable names.

.. _c_struct_member_naming_rules:

Struct Member Naming Rules
-------------------------------------------------------------------------------
Members of ``struct`` are named like :ref:`common variables <c_common_variable_naming_rules>`
with prefix ``m_``.

.. _c_enum_member_naming_rules:

Enum Member Naming Rules
-------------------------------------------------------------------------------
Members of ``enum`` are named like :ref:`common variables <c_common_variable_naming_rules>`
with prefix ``k_``.

No comma on the last element of ``enum``, e.g.

.. code-block:: c

    enum my_enum_ET
    {
        k_me_one,
        k_me_two,
        ...
        // no comma on the last element
        k_me_last
    };

.. tip::

    It maybe a good idea to hava format like, ``k_<id>_``, where ``id`` is a short name derived from
    that enumeration.

.. _c_union_member_naming_rules:

Union Member Naming Rules
-------------------------------------------------------------------------------
Members of union are named like :ref:`common variables <c_common_variable_naming_rules>` with prefix
``m_``.

.. _c_global_variable_naming_rules:

Global Variable Naming Rules
-------------------------------------------------------------------------------
Global variable name just like :ref:`common variables <c_common_variable_naming_rules>`, but with
prefix ``g_``.

.. _c_static_variable_naming_rules:

Static Variable Naming Rules
-------------------------------------------------------------------------------
Static variable name just like :ref:`common variables <c_common_variable_naming_rules>`, but with
prefix ``s_``.

.. _c_local_variable_naming_rules:

Local Variable Naming Rules
-------------------------------------------------------------------------------
Local variable just following :ref:`Common Variable Naming Rules <c_common_variable_naming_rules>`.

Local variable names should be short, and to the point. If you have some random integer loop
counter, it should probably be called ``i``. It is clear enough and there is no chance of it being
mis-understood. Similarly, ``tmp`` can be just about any type of variable that is used to hold a
temporary value.

.. _c_const_variable_naming_rules:

Constant Variable Naming Rules
-------------------------------------------------------------------------------
All constant variables, and whose value is fixed for the duration of the program,
following :ref:`Common Variable Naming Rules <c_common_variable_naming_rules>`, but with a leading ``k``.
Also see :ref:`Enum Member Naming Rules <c_enum_member_naming_rules>`.

.. code-block:: c

    const int kweeks_days = 7;
    const int kday_hours  = 24;

.. _c_function_naming_rules:

Function Naming Rules
-------------------------------------------------------------------------------
Function names consist of lowercase and underscores, if necessary can have digital numbers.

Usually every function performs an action, so the name should make clear what it does, for example:
``check_for_errors()`` is better than ``error_check()``, ``dump_data_to_file()`` instead of
``data_file()``. This will also make functions and data objects more distinguishable.

Structs are often nouns. By making function names verbs and following other naming conventions
programs can be read more naturally.

Suffixes & Prefixes are sometimes useful:

- It maybe a good idea to have a perfix for a serial or module of functions.
- ``_max`` - to mean the maximum value something can have.
- ``_cnt`` - the current count of a running count variable.
- ``_ptr`` - the pointer variable.
- ``is_``  - to ask a question about something.
- ``get_`` - get a value.
- ``set_`` - set a value.

.. _c_macro_naming_rules:

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
	- Properly use of inline functions instead of macro functions make sense.


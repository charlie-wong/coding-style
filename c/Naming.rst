Naming
===============================================================================
The most important consistency rules are those that govern naming. The style
of a name immediately informs us what sort of thing the named entity is: a type,
a variable, a function, a constant, a macro, and likes, without requiring us to
search for the declaration of that entity. The pattern-matching engine in our
brains relies a great deal on these naming rules.

A name is the result of a long deep thought process about the ecology it lives in.
Only programmers who understands the system as a whole can create a name that
**fits** with the system. If the name is appropriate everything fits together
naturally, relationships are clear, meaning is derivable, and reasoning from
common human expectations works as expected.

Naming rules are pretty arbitrary, but make it consistency is more important
than individual preferences, so regardless of whether you find them sensible
or not, the rules are the rules.

.. _c_naming_general:

General Rules
-------------------------------------------------------------------------------
- Give more context information in the names.
- Names should be descriptive, avoid abbreviation.
- Make it clear, easy to read, write and understand, within reason.
- Make names should have meaningful distinctions and try best make them pronounceable.
- Use intention-revealing names, names should reveal real intent, avoid disinformation.

Give as descriptive a name as possible, within reason. Do not worry about
saving horizontal space as it is far more important to make your code
immediately understandable by a new reader.

Do not use abbreviations that are ambiguous or unfamiliar to readers outside
your project, and do NOT **abbreviate** by deleting letters within a word.
Note that certain universally-known abbreviations are OK, such as ``i`` for
an iteration variable.

.. code-block:: c

    // The good ones
    int price_count_reader; ///< No abbreviation.
    int num_errors; ///< "num" is a widespread convention.
    int num_dns_connections; ///< Most people know what "DNS" stands for.

    // The bad ones
    int n; ///< Meaningless.
    int nerr; ///< Ambiguous abbreviation.
    int n_comp_conns; ///< Ambiguous abbreviation.
    int wgc_connections; ///< Only your group knows what this stands for.
    int pc_reader; ///< Lots of things can be abbreviated "pc".
    int cstmr_id; ///< Deletes internal letters.

.. _c_naming_filename:

File Name
-------------------------------------------------------------------------------
Filenames should be all lowercase with underscores between words,
if necessary can have digital numbers. Source files should end in ``.c``,
and header files should end in ``.h``.

- Do not reuse a `standard <https://www.securecoding.cert.org/confluence/display/c/PRE04-C.+Do+not+reuse+a+standard+header+file+name>`_ header file names, e.g. **locale.h**, **time.h**, and likes.
- Make it very specific, with more context info, e.g. use
  **http_server_logs.h** rather than **logs.h**.

.. _c_naming_typedef:

Typedef
-------------------------------------------------------------------------------
``typedef`` names just following :ref:`c_naming_common_variable` and with rules:

- The ``enum`` name suffix should be ``_e``, and ``typedef enum`` is ``_et``
- The ``union`` name suffix should be ``_u``, and ``typedef union`` is ``_ut``
- The ``struct`` name suffix should be ``_s``, and ``typedef struct`` is ``_st``
- Basic type aliase ``typedef`` suffix should be ``_kt``, like ``typedef unsigned bits32_kt;``
- Function ``typedef`` suffix should be ``_ft``, prefer no \*, e.g. ``typedef int (cnter_ft)(int cnt);``

.. _c_naming_common_variable:

Common Variable
-------------------------------------------------------------------------------
All variable names consist of lowercase, numbers and underscores.

For example:

.. code-block:: c

    // The good ones
    int table_cnt; ///< uses underscore
    char *tablename; ///< all lowercase

    // The bad ones
    char *tableName; ///< mixed case, use for C++, not C

.. tip::

    - It is a good idea to make and use searchable names.

.. _c_naming_local_variable:

Local Variable
-------------------------------------------------------------------------------
Local variable just following :ref:`c_naming_common_variable`.

Local variable names should be short and to the point. If you have a random
integer loop counter, it should probably be called ``i``. It is clear enough
and there is no chance of mis-understood. Similarly, ``tmp`` can be just
about any type of variable that is used to hold a temporary value.

.. _c_naming_const_variable:

Constant Variable
-------------------------------------------------------------------------------
All constant variables, and whose value is fixed for the duration of the
program, just following :ref:`c_naming_common_variable` with a leading ``k``.
Also see :ref:`c_naming_enum_member` & :ref:`c_naming_macro`.

.. code-block:: c

    // Both OK
    #define WEEK_DAYS   7
    const int kWeek_Days = 7;

    #define DAY_HOURS   24
    const int kDay_Hours = 24;

.. _c_naming_struct_member:

Struct Member
-------------------------------------------------------------------------------
Members of ``struct`` are named like :ref:`c_naming_common_variable`.

.. _c_naming_union_member:

Union Member
-------------------------------------------------------------------------------
Members of ``union`` are named like :ref:`c_naming_common_variable`.

.. _c_naming_enum_member:

Enum Member
-------------------------------------------------------------------------------
Members of ``enum`` are named like :ref:`c_naming_common_variable` with prefix ``k``,
and the second char of the name should be always uppercase, make it clear to read.

.. code-block:: c

    enum my_enum_s // The name can be ignored
    {
        kMe_one,
        kMe_two,
        ...
        kMe_last
    };

.. tip::

    It maybe a good idea to hava format like, ``kId...`` for readability.

.. _c_naming_global_variable:

Global & Static
-------------------------------------------------------------------------------
- Static variable name just like :ref:`c_naming_common_variable` with prefix ``s_``.
- Global variable name just like :ref:`c_naming_common_variable` with prefix ``g_``.

.. _c_naming_function:

Function Name
-------------------------------------------------------------------------------
Function names consist of lowercase, numbers and underscores.

Structs names are often nouns. By making function names verbs and following
other naming conventions programs can be read more naturally.

Usually every function performs some actions, so the name should make clear
what it does, e.g. ``check_error()`` or ``error_check()``, but
``dump_data_to_file()`` is better than ``data_file()``.

.. _c_naming_macro:

Macro Name
-------------------------------------------------------------------------------
Macro names consist of uppercase, numbers and underscores. In general, it is
better to use all capitalized letters, e.g. ``DEBUG_MSG()``, but it maybe
suitable to name it like functions, such as ``max``, ``min``, ``MAX``
and ``MIN``, all looks good and clear enough.

.. code-block:: c

    /// header file guard macro
    #define <PROJECT>_<PATH>_<FILE>_H

    /// awesome macro defination
    #define AWESOME_MACRO_DEFINATION

    /// constant number value
    #define PI  (3.1415926)

    /// constant string value
    #define CONFIG_FILE_NAME    "config"

    /// function like macro
    #ifdef SHOW_DEBUG_MESSAGE
        #define DEBUG_MSG(msg)  printf("%s\n", msg)
    #else
        #define DEBUG_MSG(msg)
    #endif

.. note::

    - General speaking, if not necessary, macros should not be used.
    - Properly use of inline functions instead of macro functions make sense.

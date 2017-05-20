Header Files
===============================================================================

.. _c_self_contained_headers:

Self Contained Headers
-------------------------------------------------------------------------------
- All header files should be self-contained (compile on their own) and end in ``.h``.
- Non-header files that are meant for inclusion should end in ``.inc`` and be used sparingly.

All header files should have :ref:`header guards <c_define_guard>` and include all other header
files it needs. Prefer placing the definition of **inline** functions in the same file as their
declarations. The definitions of these functions must be included into every ``.c`` file that uses
them.

.. _c_define_guard:

The Header Guard
-------------------------------------------------------------------------------
All header files should have ``#define`` guards to prevent multiple inclusion.
The format of the symbol name should be ``<PROJECT>_<PATH>_<FILE>_H``.

The ``#define`` guards should be uniqueness, based on the full path in a project's source tree.
For example, the file ``foo/bar/baz.h`` in project **foo** should have the following guard:

.. code-block:: c

	/// @file
	/// file description

	#ifndef FOO_BAR_BAZ_H
	#define FOO_BAR_BAZ_H
	...
	#endif // FOO_BAR_BAZ_H

.. _c_forward_declarations:

Forward Declarations
-------------------------------------------------------------------------------
Avoid using forward declarations where possible. Just ``#include`` the headers you need.

	- Try to avoid forward declarations of entities defined in another project.
	- When using a function declared in a header file, always ``#include`` that header.

Please see :ref:`Names and Order of Includes <c_names_and_order_of_includes>` for rules about
when and where to ``#include`` a header.

.. _c_names_and_order_of_includes:

Names and Order of Includes
-------------------------------------------------------------------------------
Use standard order for readability and to avoid hidden dependencies, that is:

	- C system headers
	- C++ system headers
	- dependency libraries headers
	- your project headers

All of a project's header files should be listed as descendants of the project's source directory
without use of UNIX directory shortcuts: the current directory (\.) or the parent directory (\.\.)

For example, the file ``foo/bar/baz.h`` in project **foo** should be included as:

.. code-block:: c

	#include "bar/baz.h"

.. tip::

	Sometimes, system-specific code needs conditional includes. Such code can put conditional
	includes after other includes. Of course, keep your system-specific code small and localized.

.. _c_inline_functions:

Inline Functions
-------------------------------------------------------------------------------
Define functions inline only when they are small, say, 10 lines or fewer.

You can declare functions in a way that allows the compiler to expand them inline rather than
calling them through the usual function call mechanism.

- Macros for small functions are ok.
- Use inlines function instead of macros where possible and make sense.
- Inlining a function can generate more efficient code, as long as the inlined function is small.
- Feel free to inline accessors and mutators, and other short, performance-critical functions.
- Overuse of inlining can actually make programs slower.
- Depending on a function's size, it can cause the code size to increase or decrease.
- Inlining a very small accessor function will usually decrease code size while inlining a very
  large function can dramatically increase code size.

.. tip::

	- do not inline a function if it is more than 10 lines long.
	- it's typically not cost effective to inline functions with loops or switch statements.
	- It's important to know that functions are not always inlined even if declared as such.

.. _c_constants_in_header:

Header Constants
-------------------------------------------------------------------------------
Do not use macros to define constants in header files whenever possible.

In general ``enum`` are preferred to ``#define`` as enums are understood by the debugger. Macro
constants in header files cannot be used by unit tests. However, you are allowed to define a macro
that holds the same value as a non-enum constant, if the value of the constant represents the size
of an array.

Be aware enums are not of a **guaranteed** size. So if you have a type that can take a known range
of values and it is transported in a message you can not use an ``enum`` as the type. Use the
correct integer size and use constants or ``#define``. Casting between integers and enums is very
error prone as you could cast a value not in the ``enum``.


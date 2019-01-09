Header
===============================================================================

- All header files should be self-contained (compile on their own) and end in ``.h``.
- Non-header files meant for inclusion should end in ``.inc`` and be used sparingly.

All header files should have :ref:`c_header_define_guard` and include all other
header files it needs. Prefer placing the definition of **inline** functions in
the same file as their declarations. The definitions of these functions must be
included into every ``.c`` file that uses them.

.. _c_header_define_guard:

Header Guard
-------------------------------------------------------------------------------
All header files should have ``#define`` guards to prevent multiple inclusion.
The format of the symbol name should be ``<PROJECT>_<PATH>_<FILE>_H``.

The ``#define`` guards should be uniqueness, based on the full path of the
project source tree. For example, the file ``bar/baz.h`` in the project named
**foo** should have the following guard:

.. code-block:: c

	/// @file
	/// file description

	#ifndef FOO_BAR_BAZ_H
	#define FOO_BAR_BAZ_H
	...
	#endif // FOO_BAR_BAZ_H

.. _c_header_forward_declarations:

Forward Declarations
-------------------------------------------------------------------------------
Avoid using forward declarations where possible. Just ``#include`` all the
headers you need.

Pros
    - Save `compile time`, as ``#include`` force
      compiler to open and process more files.
    - Save on `unnecessary recompilation`, as ``#include`` can force code
      to be recompiled more often, due to unrelated changes in the header.

Cons
    - Hide dependency, can skip necessary recompilation when headers change.
    - May be broken by subsequent changes to the library, like the header
      owners making otherwise-compatible changes to the APIs.

Decision
    - Try to avoid forward declarations of entities defined in another project.
    - When using function declaration in header file, always ``#include`` that header.
    - static functions in ``.c`` should well ordered, thus no need of forward declarations.

See :ref:`c_header_order_of_includes` for rules
about when and where to ``#include`` a header.

.. _c_header_order_of_includes:

Includes Order
-------------------------------------------------------------------------------
Use standard order for readability and to avoid hidden dependencies.
All project headers should be listed as descendants of project source
tree without use of UNIX directory shortcuts: ``.`` or ``..``

- Related headers
- **A-BLANK-LINE**
- C system headers
- **A-BLANK-LINE**
- C++ system headers
- **A-BLANK-LINE**
- Libraries headers
- **A-BLANK-LINE**
- Project headers

Note
    - Any adjacent blank lines should be collapsed for readability.
    - Within each section the includes should be ordered alphabetically.

For example, the file ``foo/bar/baz.h`` in project **foo** should be included
into ``bar/baz.c`` as following:

.. code-block:: c

    #include "bar/baz.h"

    #include <system/headers.h>

    #include "local/deps/header.h"

    #include "project/other/header.h"

Thus, if ``bar/baz.h`` omits any necessary includes, build of ``bar/baz.c`` will
break up as soon as possible with showing related error message in ``bar/baz.h``.

Sometimes, system-specific code needs conditional includes. Such code can put
conditional includes after other includes. Of course, keep the system-specific
code small, for example:

.. code-block:: c

    #include "bar/baz.h"

    #include "local/header.h"

    #ifdef UNIX
        #include <unistd.h>
    #endif

.. _c_header_inline_functions:

Inline Functions
-------------------------------------------------------------------------------
Define functions inline only when they are small, say, 10 lines or fewer.
Should declare functions in a way that allows the compiler to expand them
inline rather than calling them through the usual function call mechanism.

Pros
    - Inlining a function can generate more efficient code, as long as the
      inlined function is small.
    - Feel free to inline accessors and mutators, and other short,
      performance-critical functions.

Cons
    - Overuse of inlining can actually make programs slower.
    - Depending on the function size, it can cause the code size to increase or decrease.
    - Inlining a very small function will usually decrease the code size,
      while inlining a very large one can dramatically increase the code size.
    - For modern processors, smaller code usually runs faster due to better
      use of the instruction cache.

Decision
    - Usually recursive functions should not be inline.
    - Macros for small functions are ok if it make sense.
    - Use inlines function instead of macros where possible.
    - The thumb rule is do not inline if more than 10 lines long.

.. tip::

	- It is typically not cost effective to inline functions
	  with loops or switch statements.
	- It is important to know that functions are not always
	  inlined even if declared as such.

.. _c_header_constants:

Header Constants
-------------------------------------------------------------------------------
Do not use macros to define constants in header files whenever possible.

In general ``enum`` are preferred to ``#define`` as enums are understood by
the debugger. Macro constants in header files can not be used by unit tests.
However, you are allowed to define a macro that holds the same value as a
non-enum constant, if the value of the constant represents the size of an array.

Be aware enums are not of a **guaranteed** size. So if you have a type that can
take a known range of values and it is transported in a message you can not use
an ``enum`` as the type. Use the correct integer size and use constants or
``#define``. Casting between integers and enums is very error prone as you could
cast a value not in the ``enum``.

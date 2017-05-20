Header Files
===============================================================================
In general, every ``.cc`` file should have an associated ``.h`` file, but common exceptions are for
**unittests** and small ``.cc`` files containing just a ``main()`` function.

Correct use of header files can make a huge difference to the readability, size and performance of
your code.

.. _cpp_self-contained-headers:

Self Contained Headers
-------------------------------------------------------------------------------
Header files should be self-contained (compile on their own) and end in ``.h``.

All header files should be self-contained. Specifically, a header should have :ref:`header guards
<cpp_define-guard>` and include all other headers it needs.

Non-header files that are meant for inclusion should end in ``.inc`` and be used sparingly.
These are typically intended to be included at unusual locations, such as the middle of another file.
They might not use :ref:`header guards <cpp_define-guard>`, and might not include their prerequisites.
So, prefer self-contained headers when possible.

Prefer placing the definitions for **template** and **inline** functions in the same file as their
declarations. The definitions of these constructs must be included into every ``.cc`` file that uses
them, or the program may fail to link in some build configurations. If declarations and definitions
are in different files, including the former should transitively include the latter. Do not move
these definitions to separately included header files will make it simple.

As an exception, a template that is explicitly instantiated for all relevant sets of template
arguments, or that is a private implementation detail of a class, is allowed to be defined in the
one and only ``.cc`` file that instantiates the template.

.. _cpp_define-guard:

The Header Guard
-------------------------------------------------------------------------------
All header files should have ``#define`` guards to prevent multiple inclusion.
The format of the symbol name should be ``<PROJECT>_<PATH>_<FILE>_H``.

The ``#define`` guards should be uniqueness, based on the full path in a project's source tree.
For example, the file ``foo/bar/baz.h`` in project ``foo`` should have the following guard:

.. code-block:: cpp

	/// @file
	/// file description

	#ifndef FOO_BAR_BAZ_H
	#define FOO_BAR_BAZ_H
	...
	#endif // FOO_BAR_BAZ_H

.. _cpp_forward-declarations:

Forward Declarations
-------------------------------------------------------------------------------
Avoid using forward declarations where possible. Just ``#include`` the headers you need.

	- Try to avoid forward declarations of entities defined in another project.
	- When using a function declared in a header file, always ``#include`` that header.

Please see :ref:`Names and Order of Includes <cpp_names_and_order_of_includes>` for rules about
when and where to ``include`` a header.

.. _cpp_names_and_order_of_includes:

Names and Order of Includes
-------------------------------------------------------------------------------
Use standard order for readability and to avoid hidden dependencies:

	- C system headers
	- C++ system headers
	- dependency libraries headers
	- your project headers

All of a project's header files should be listed as descendants of the project's source directory
without use of UNIX directory shortcuts: the current directory(\.) or the parent directory(\.\.)

For example, the file ``foo/bar/baz.h`` in project ``foo`` should be include as:

.. code-block:: cpp

	#include "bar/baz.h"

.. tip::

	Sometimes, system-specific code needs conditional includes. Such code can put conditional
	includes after other includes. Of course, keep your system-specific code small and localized.

.. _cpp_inline-functions:

Inline Functions
-------------------------------------------------------------------------------
Define functions inline only when they are small, say, 10 lines or fewer.

Defination:

	You can declare functions in a way that allows the compiler to expand them inline rather than
	calling them through the usual function call mechanism.

Pros:

	- Inlining a function can generate more efficient object code, as long as the inlined function
	  is small.
	- Feel free to inline accessors and mutators, and other short, performance-critical functions.

Cons:

	- Overuse of inlining can actually make programs slower.
	- Depending on a function's size, inlining it can cause the code size to increase or decrease.
	- Inlining a very small accessor function will usually decrease code size while inlining a very
	  large function can dramatically increase code size.

.. tip::

	- not inline a function if it is more than 10 lines long.
	- it's typically not cost effective to inline functions with loops or switch statements.
	- It's important to know that functions are not always inlined even if declared as such.

.. _cpp_constants_in_header:

Header Constants
-------------------------------------------------------------------------------
Do not use macros to define constants in headers, use enum instead if possible.

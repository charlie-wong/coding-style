Header
===============================================================================
In general, every ``.cc`` file should have an associated ``.h`` file, but common
exceptions are for **unittests** and **small** ``.cc`` files containing just a
``main()`` function. Correct use of header files can make a huge difference to
the readability, size and performance of your code.

.. _cpp_header_self_contained:

Self Contained Headers
-------------------------------------------------------------------------------
Header files should be self-contained (compile on their own) and end in ``.h``.

All header files should be self-contained. Specifically, a header should have
:ref:`cpp_header_define_guard` and include all other headers it needs.

Non-header files that are meant for inclusion should end in ``.inc`` and be
used sparingly. These are typically intended to be included at unusual locations,
such as the middle of another file. They might not use :ref:`cpp_header_define_guard`,
and might not include their prerequisites. So, prefer self-contained headers
when possible.

Prefer placing the definitions for **template** and **inline** functions in the
same file as their declarations. The definitions of these constructs must be
included into every ``.cc`` file that uses them, or the program may fail to
link in some build configurations. If declarations and definitions are in
different files, including the former should transitively include the latter.
Do not move these definitions to separately included header files will make it simple.

As an exception, a template that is explicitly instantiated for all relevant
sets of template arguments, or that is a private implementation detail of a
class, is allowed to be defined in the one and only ``.cc`` file that
instantiates the template.

.. _cpp_header_define_guard:

Header Guard
-------------------------------------------------------------------------------
The same as :ref:`c_header_define_guard` of C.

.. _cpp_header_forward_declarations:

Forward Declarations
-------------------------------------------------------------------------------
The same as :ref:`c_header_forward_declarations` of C.

.. _cpp_header_order_of_includes:

Includes Order
-------------------------------------------------------------------------------
The same as :ref:`c_header_order_of_includes` of C.

.. _cpp_header_inline_functions:

Inline Functions
-------------------------------------------------------------------------------
The same as :ref:`c_header_inline_functions` of C.

.. _cpp_header_constants:

Header Constants
-------------------------------------------------------------------------------
The same as :ref:`c_header_constants` of C.


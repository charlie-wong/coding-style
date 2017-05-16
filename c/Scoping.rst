Scoping
===============================================================================

.. _c_global_variables:

Global Variables
-------------------------------------------------------------------------------
Avoid using global variable where possible.
Also see :ref:`Global Variable Naming Rules <c_global_variable_naming_rules>`.

.. _c_static_variables:

Static Variables
-------------------------------------------------------------------------------
When variables definied in a ``.c`` file do not need to be referenced outside that file, declare
them as ``static``. It is rarely to define ``static`` variables in header files.
Also see :ref:`Static Variable Naming Rules <c_static_variable_naming_rules>`.

.. _c_local_variables:

Locale Variables
-------------------------------------------------------------------------------
Place a function's variables in the narrowest scope, and initialize variables in the declaration.

	- Declare local variables in as local a scope as possible.
	- Declare local variables as close to the first use as possible.

This makes it easier for the reader to find the declaration and see what type the variable is and
what it was initialized to. In particular, initialization should be used instead of declaration
and assignment, e.g.

.. code-block:: c

	int i;
	i = get_value();     // Bad  -- initialization separate from declaration.

	int j = get_value(); // Good -- declaration has initialization.

Naming Conventions
===============================================================================

.. _sh_function_names:

Function Names
-------------------------------------------------------------------------------
- Lower-case, with underscores to separate words

  - If writing single functions, use lowercase and separate words with underscore

- Separate libraries with ``::``

  - If writing a package, separate package names with ``::``

- Parentheses are required after the function name

  - Braces must be on the same line as the function name
  - No space between the function name and the parenthesis

- The keyword ``function`` is optional, but must be used consistently throughout a project.

.. code-block:: sh

    # Single function
    my_func()
    {
        do_some_thing()
        ...
    }

    # Part of a package
    mypackage::my_func()
    {
        do_some_thing()
        ...
    }

.. note::

    The ``function`` keyword is extraneous when ``()`` is present after the function name,
    but enhances quick identification of functions.

.. _sh_variable_names:

Variable Names
-------------------------------------------------------------------------------
As for :ref:`function names <sh_function_names>`.

Variables names for loops should be similarly named for any variable you're looping through.

.. code-block:: sh

    for zone in ${zones}; do
        something_with "${zone}"
    done

.. _sh_constants_and_environment_variable_names:

Constants and Environment Variable Names
-------------------------------------------------------------------------------
All caps, separated with underscores, declared at the top of the file.

- Constants and anything exported to the environment should be capitalized.

.. code-block:: sh

    # Constant
    readonly PATH_TO_FILES='/some/path'

    # Both constant and environment
    declare -xr ORACLE_SID='PROD'

Some things become constant at their first setting (for example, via ``getopts``). Thus, it's OK
to set a constant in getopts or based on a condition, but it should be made readonly immediately
afterwards. Note that declare doesn't operate on global variables within functions, so readonly or
export is recommended instead.

.. code-block:: sh

    VERBOSE='false'
    while getopts 'v' flag; do
        case "${flag}" in
            v) VERBOSE='true' ;;
        esac
    done
    readonly VERBOSE

.. _sh_source_file_names:

Source File Names
-------------------------------------------------------------------------------
Filenames should be all lowercase with hyphens between words, if necessary can have digital numbers.

.. _sh_read_only_variables:

Read-only Variables
-------------------------------------------------------------------------------
Use ``readonly`` or ``declare -r`` to ensure they're read only.

As globals are widely used in shell, it's important to catch errors when working with them. When you
declare a variable that is meant to be read-only, make this explicit.

.. code-block:: sh

    zip_version="$(dpkg --status zip | grep Version: | cut -d ' ' -f 2)"
    if [[ -z "${zip_version}" ]]; then
        error_message
    else
        readonly zip_version
    fi

.. _sh_use_local_variables:

Use Local Variables
-------------------------------------------------------------------------------
- Declare function-specific variables with ``local``.
- Declaration and assignment should be on different lines.

Ensure that local variables are only seen inside a function and its children by using ``local``
when declaring them. This avoids polluting the global name space and inadvertently setting
variables that may have significance outside the function.

Declaration and assignment must be separate statements when the assignment value is provided by
a command substitution; as the ``local`` builtin does not propagate the exit code from the command
substitution.

.. code-block:: sh

    my_func2()
    {
        local name="$1"

        # Separate lines for declaration and assignment:
        local my_var
        my_var="$(my_func)" || return

        # DO NOT do this: $? contains the exit code of 'local', not my_func
        local my_var="$(my_func)"
        [[ $? -eq 0 ]] || return

        ...
    }

.. _sh_function_location:

Function Location
-------------------------------------------------------------------------------
- Put all functions together in the file just below constants

  - If you've got functions, put them all together near the top of the file
  - Only includes, set statements and setting constants may be done before declaring functions
- Don't hide executable code between functions

  - Don't hide executable code between functions. Doing so makes the code difficult to follow
    and results in nasty surprises when debugging

.. _sh_main_function:

main Function
-------------------------------------------------------------------------------
A function called **main** is required for scripts long enough to contain at least one other function.

In order to easily find the start of the program, put the main program in a function called **main**
as the bottom most function. This provides consistency with the rest of the code base as well as
allowing you to define more variables as ``local``, which can't be done if the main code is not
a function. The last non-comment line in the file should be a call to **main**:

.. code-block:: sh

    main "$@"

.. note::

    Obviously, for short scripts where it's just a linear flow, **main** is overkill
    and so is not required.


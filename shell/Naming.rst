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


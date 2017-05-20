Shell Features
===============================================================================
.. _sh_command_substitution:

Command Substitution
-------------------------------------------------------------------------------
Use ``$(command)`` instead of backticks(```command```).

- Nested backticks require escaping the inner ones with ``\``
- The ``$(command)`` format doesn't change when nested and is easier to read

.. code-block:: sh

    # This is preferred:
    var="$(command "$(command1)")"

    # This is not:
    var="`command \`command1\``"

.. _sh_math_and_integer_manipulation:

Math and Integer Manipulation
-------------------------------------------------------------------------------
Use ``((...))`` and ``$((...))``.

.. code-block:: sh

    a=5
    b=4

    # wrong
    if [[ $a -gt $b ]]; then
        ...
    fi

    # right
    if ((a > b)); then
        ...
    fi

.. _sh_test_testsign:

Test, [ and [[
-------------------------------------------------------------------------------
``[[ ... ]]`` is preferred over ``[``, ``test`` and ``/usr/bin/[``,
see `BashFAQ <http://mywiki.wooledge.org/BashFAQ/031>`_ for more information.

- ``[[ ... ]]`` reduces errors as no pathname expansion or word splitting takes place
- ``[[ ... ]]`` allows for regular expression matching where ``[ ... ]`` does not

.. code-block:: sh

    # This ensures the string on the left is made up of characters in the
    # alnum character class followed by the string name.
    # Note that the RHS should not be quoted here.
    # For the gory details, see
    # E14 at https://tiswww.case.edu/php/chet/bash/FAQ
    if [[ "filename" =~ ^[[:alnum:]]+name ]]; then
        echo "Match"
    fi

    # This matches the exact pattern "f*" (Does not match in this case)
    if [[ "filename" == "f*" ]]; then
        echo "Match"
    fi

    # This gives a "too many arguments" error as f* is expanded to the
    # contents of the current directory
    if [ "filename" == f* ]; then
        echo "Match"
    fi

.. _sh_testing_strings:

Testing Strings
-------------------------------------------------------------------------------
Use quotes rather than filler characters where possible.

Bash is smart enough to deal with an empty string in a test. So, given that the code is much easier
to read, use tests for **non-empty** strings or **empty** strings rather than **filler** characters.

.. code-block:: sh

    # Do this:
    if [[ "${my_var}" = "some_string" ]]; then
        do_something
    fi

    # -z (string length is zero) and -n (string length is not zero) are
    # preferred over testing for an empty string
    if [[ -z "${my_var}" ]]; then
        do_something
    fi

    # This is OK (ensure quotes on the empty side), but not preferred:
    if [[ "${my_var}" = "" ]]; then
        do_something
    fi

    # Not this:
    if [[ "${my_var}X" = "some_stringX" ]]; then
        do_something
    fi

To avoid confusion about what you're testing for, explicitly use ``-z`` or ``-n``.

.. code-block:: sh

    # Use this
    if [[ -n "${my_var}" ]]; then
        do_something
    fi

    # Instead of this as errors can occur if ${my_var} expands to a test
    # flag
    if [[ "${my_var}" ]]; then
        do_something
    fi

.. _sh_wildcard_expansion_of_filenames:

Wildcard Expansion of Filenames
-------------------------------------------------------------------------------
Use an explicit path when doing wildcard expansion of filenames.

As filenames can begin with a ``-``, it's a lot safer to expand wildcards with ``./*``
instead of ``*``.

.. code-block:: sh

    # Here's the contents of the directory:
    # -f  -r  somedir  somefile

    # This deletes almost everything in the directory by force
    psa@bilby$ rm -v *
    removed directory: `somedir'
    removed `somefile'

    # As opposed to:
    psa@bilby$ rm -v ./*
    removed `./-f'
    removed `./-r'
    rm: cannot remove `./somedir': Is a directory
    removed `./somefile'

.. _sh_eval:

Eval
-------------------------------------------------------------------------------
``eval`` should be avoided.

Eval munges the input when used for assignment to variables and can set variables without making it
possible to check what those variables were.

.. code-block:: sh

    # What does this set?
    # Did it succeed? In part or whole?
    eval $(set_my_variables)

    # What happens if one of the returned values has a space in it?
    variable="$(eval some_function)"

.. _sh_pipes_to_while:

Pipes to While
-------------------------------------------------------------------------------
Use process substitution or for loops in preference to piping to while. Variables modified in a
while loop do not propagate to the parent because the loop's commands run in a subshell.

The implicit subshell in a pipe to while can make it difficult to track down bugs.

.. code-block:: sh

    last_line='NULL'
    your_command | while read line; do
        last_line="${line}"
    done

    # This will output 'NULL'
    echo "${last_line}"

Use a for loop if you are confident that the input will not contain spaces or special characters,
usually, this means not user input.

.. code-block:: sh

    total=0
    # Only do this if there are no spaces in return values.
    for value in $(command); do
        total+="${value}"
    done

Using process substitution allows redirecting output but puts the commands in an explicit subshell
rather than the implicit subshell that bash creates for the while loop.

.. code-block:: sh

    total=0
    last_file=
    while read count filename; do
        total+="${count}"
        last_file="${filename}"
    done < <(your_command | uniq -c)

    # This will output the second field of the last line of output from
    # the command.
    echo "Total = ${total}"
    echo "Last one = ${last_file}"

Use while loops where it is not necessary to pass complex results to the parent shell. This is
typically where some more complex **parsing** is required. Beware that simple examples are probably
more easily done with a tool such as awk. This may also be useful where you specifically don't want
to change the parent scope variables.

.. code-block:: sh

    # Trivial implementation of awk expression:
    #   awk '$3 == "nfs" { print $2 " maps to " $1 }' /proc/mounts
    cat /proc/mounts | while read src dest type opts rest; do
        if [[ ${type} == "nfs" ]]; then
            echo "NFS ${dest} maps to ${src}"
        fi
    done

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


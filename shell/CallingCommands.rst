Calling Commands
===============================================================================

.. _sh_checking_return_values:

Checking Return Values
-------------------------------------------------------------------------------
- Always check return values and give informative return values.

For unpiped commands, use ``$?`` or check directly via an ``if`` statement to keep it simple.

.. code-block:: sh

    if ! mv "${file_list}" "${dest_dir}/" ; then
        echo "Unable to move ${file_list} to ${dest_dir}" >&2
        exit "${E_BAD_MOVE}"
    fi

    # Or
    mv "${file_list}" "${dest_dir}/"
    if [[ "$?" -ne 0 ]]; then
        echo "Unable to move ${file_list} to ${dest_dir}" >&2
        exit "${E_BAD_MOVE}"
    fi

Bash also has the ``PIPESTATUS`` variable that allows checking of the return code from all parts
of a pipe. If it's only necessary to check success or failure of the whole pipe,
then the following is acceptable:

.. code-block:: sh

    tar -cf - ./* | ( cd "${dir}" && tar -xf - )
    if [[ "${PIPESTATUS[0]}" -ne 0 || "${PIPESTATUS[1]}" -ne 0 ]]; then
        echo "Unable to tar files to ${dir}" >&2
    fi

However, as ``PIPESTATUS`` will be overwritten as soon as you do any other command, if you need to
act differently on errors based on where it happened in the pipe, you'll need to assign PIPESTATUS
to another variable immediately after running the command, don't forget that ``[`` is a command and
will wipe out ``PIPESTATUS``.

.. code-block:: sh

    tar -cf - ./* | ( cd "${DIR}" && tar -xf - )
    return_codes=(${PIPESTATUS[*]})
    if [[ "${return_codes[0]}" -ne 0 ]]; then
        do_something
    fi
    if [[ "${return_codes[1]}" -ne 0 ]]; then
        do_something_else
    fi

.. _sh_builtin_commands_vs_external_commands:

Builtin Commands vs. External Commands
-------------------------------------------------------------------------------
Given the choice between invoking a shell **builtin** command and invoking a **external** command,
choose the **builtin**. We prefer the use of **builtins** as it's more robust and portable,
especially when compared to things like ``sed``.

.. code-block:: sh

    # Prefer this:
    addition=$((${X} + ${Y}))
    substitution="${string/#foo/bar}"

    # Instead of this:
    addition="$(expr ${X} + ${Y})"
    substitution="$(echo "${string}" | sed -e 's/^foo/bar/')"


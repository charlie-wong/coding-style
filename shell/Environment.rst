Environment
===============================================================================

.. _sh_stdout_vs_stderr:

stdout VS stderr
-------------------------------------------------------------------------------
All error messages should go to ``stderr``. This makes it easier to separate normal status from
actual issues.

A function to print out error messages along with other status information is recommended, e.g.

.. code-block:: sh

    err()
    {
        echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
    }

    if ! do_something; then
        err "Unable to do_something"
        exit "${E_DID_NOTHING}"
    fi


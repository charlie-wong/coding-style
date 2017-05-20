Background
===============================================================================

.. _sh_which_shell_to_use:

Which Shell to Use
-------------------------------------------------------------------------------
``Bash`` is the only shell scripting language permitted for executables.

Executables must start with ``#!/bin/bash`` and a minimum number of flags. Use ``set`` to set shell
options so that calling your script as ``bash script_name`` does not break its functionality.

Restricting all executable shell scripts to ``bash`` gives us a consistent shell language that's
installed on all our machines.

The only exception to this is where you're forced to by whatever you're coding for.

.. _sh_when_to_use_shell:

When to use Shell
-------------------------------------------------------------------------------
Shell should only be used for small utilities or simple wrapper scripts.

While shell scripting isn't a development language, it is used for writing various utility scripts.
This style guide is more a recognition of its use rather than a suggestion that it be used for
widespread deployment.

- If you're mostly calling other utilities and are doing relatively little data manipulation,
  shell is an acceptable choice for the task.
- If performance matters, use something other than shell.
- If you find you need to use arrays for anything more than assignment of ``${PIPESTATUS}``, you
  should use Python.
- If you are writing a script that is more than 100 lines long, you should probably be writing it in
  Python instead. Bear in mind that scripts grow. Rewrite your script in another language early to
  avoid a time-consuming rewrite at a later date.

.. _sh_file_extensions:

File Extensions
-------------------------------------------------------------------------------
Executables should have no extension (strongly preferred) or a ``.sh`` extension.
Libraries must have a ``.sh`` extension and should not be executable.

It is not necessary to know what language a program is written in when executing it and shell does
not require an extension so we prefer not to use one for executables.

However, for libraries it's important to know what language it is and sometimes there's a need to
have similar libraries in different languages. This allows library files with identical purposes
but different languages to be identically named except for the language-specific suffix.

.. _sh_suid_and_sgid:

SUID and SGID
-------------------------------------------------------------------------------
SUID and SGID are **forbidden** on shell scripts.

There are too many security issues with shell that make it nearly impossible to secure sufficiently
to allow SUID/SGID.  While bash does make it difficult to run SUID, it's still possible on some
platforms which is why we're being explicit about banning it.

Use ``sudo``  to provide elevated access if you need it.

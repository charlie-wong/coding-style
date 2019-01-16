Comments
===============================================================================

.. _sh_file_header:

File Header
-------------------------------------------------------------------------------
Start each file with a description of its contents.

Every file must have a top-level comment including a brief overview of its
contents. A copyright notice and author information are optional, for example:

.. code-block:: sh

    #!/bin/bash
    #
    # Perform hot backups of Oracle databases.
    ...
    the_body_of_scripts
    ...

.. _sh_function_comments:

Function Comments
-------------------------------------------------------------------------------
- Any function that is not both obvious and short must be commented.
- Any function in a library must be commented regardless of length or complexity.

It should be possible for someone else to learn how to use your program or to
use a function in your library by reading the comments (and self-help, if
provided) without reading the code. All function comments should contain:

- Description of the function
- Global variables used and modified
- Arguments taken
- Returned values other than the default exit status of the last command run

For example:

.. code-block:: sh

    #!/bin/bash
    #
    # File description information

    export PATH='/usr/xpg4/bin:/usr/bin:/opt/csw/bin:/opt/goog/bin'

    # Cleanup files from the backup dir
    # Globals:
    #     BACKUP_DIR
    #     ORACLE_SID
    # Arguments:
    #     None
    # Returns:
    #     None
    cleanup()
    {
        ...
        function_body
        ...
    }

.. _sh_implementation_comments:

Implementation Comments
-------------------------------------------------------------------------------
Comment tricky, non-obvious, interesting or important parts of your code.

This follows general Google coding comment practice. Don't comment everything.
If there's a complex algorithm or you're doing something out of the ordinary,
put a short comment in.

.. _sh_todo_comments:

TODO Comments
-------------------------------------------------------------------------------
Use ``TODO`` comments for code that is temporary, a short-term solution,
or good-enough but not perfect.

TODOs should include the string TODO in all caps, followed by your
username in parentheses. A colon is optional. It's preferable to put
a bug/ticket number next to the TODO item as well.

For examples:

.. code-block:: sh

    # TODO(mrmonkey): Handle the unlikely edge cases (bug ####)

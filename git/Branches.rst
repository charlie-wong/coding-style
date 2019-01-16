Branches
===============================================================================
- Choose short and descriptive names, and use dashes to separate words:

.. code-block:: sh

    # good and clear enough
    $ git checkout -b oauth-migration

    # bad - it is not that clear
    $ git checkout -b login_fix

- Identifiers from corresponding tickets in an external service are
  also good candidates, e.g.

.. code-block:: sh

    # GitHub issue #15
    $ git checkout -b issue-15

- When several people are working on the same feature, it might be
  convenient to have personal feature branches and a team-wide feature
  branch. Use the following naming convention:

.. code-block:: sh

    $ git checkout -b feature-a/master # team-wide branch
    $ git checkout -b feature-a/maria  # Maria's personal branch
    $ git checkout -b feature-a/nick   # Nick's personal branch

Merge at will the personal branches to the team-wide branch.
Eventually, the team-wide branch will be merged to **master**.

- Delete your branch from the upstream repository after it's merged,
  unless there is a specific reason not to.

.. code-block:: sh

    # Use the following command while being on "master", to list merged branches:
    $ git branch --merged | grep -v "\*"

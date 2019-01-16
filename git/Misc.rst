Misc
===============================================================================
- Test before you push. Do not push half-done work.
- There are various workflows and each one has its strengths and weaknesses.
- Use `annotated tags <http://git-scm.com/book/en/v2/Git-Basics-Tagging#Annotated-Tags>`_ for
  marking releases or other important points in the history.
- Prefer `lightweight <http://git-scm.com/book/en/v2/Git-Basics-Tagging#Lightweight-Tags>`_ tags
  for personal use, such as to bookmark commits for future reference.
- Keep your repositories at a good shape by performing maintenance tasks occasionally.

  - `git-gc <https://git-scm.com/docs/git-gc>`_ Cleanup unnecessary files
    and optimize the local repository
  - `git-prune <https://git-scm.com/docs/git-prune>`_ Prune all unreachable
    objects from the object database
  - `git-fsck <https://git-scm.com/docs/git-fsck>`_ Verifies the connectivity
    and validity of the objects in the database

.. tip::

    Be consistent.
    This is related to the workflow but also expands to things like commit
    messages, branch names and tags. Having a consistent style throughout the
    repository makes it easy to understand what is going on by looking at the
    log, a commit message etc.

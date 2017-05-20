Commits
===============================================================================
Each commit should be a single logical change.

- Do not make several logical changes in one commit.
  For example, if a patch fixes a bug and optimizes the performance of a feature,
  split it into two separate commits.
  
- Do not split a single logical change into several commits.
  For example, the implementation of a feature and the corresponding tests should be in the same
  commit.

  Use ``git add -p`` to interactively stage specific portions of the modified files.

Commit early and often.

- Small, self-contained commits are easier to understand and revert when something goes wrong.

Commits should be ordered logically.

- For example, if commit X depends on changes done in commit Y, then commit Y should come before commit X.

.. note::

    While working alone on a local branch that has not yet been pushed, it's fine to use commits
    as temporary snapshots of your work. However, it still holds true that you should apply all
    of the above before pushing it.

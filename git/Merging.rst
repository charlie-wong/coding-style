Merging
===============================================================================
- Do not rewrite published history.

    The repository's history is **valuable** in its own right and it is very important to be able to
    tell what actually happened. Altering published history is a common source of problems for
    anyone working on the project. However, there are cases where rewriting history is legitimate.
    These are when:

    - You are the only one working on the branch and it is not being reviewed.
    - You want to tidy up your branch or rebase it onto the **master** in order to merge it later.

- Keep the history clean and simple.

    - Make sure it conforms to the style guide and perform any needed actions if it doesn't
    - Rebase it onto the branch it's going to be merged to

.. code-block:: sh

    [my-branch] $ git fetch
    [my-branch] $ git rebase origin/master
    # then merge

- If your branch includes more than one commit, do not merge with a fast-forward.

.. code-block:: sh

    # good - ensures that a merge commit is created
    $ git merge --no-ff my-branch

    # bad
    $ git merge my-branch

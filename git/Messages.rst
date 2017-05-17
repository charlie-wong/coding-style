Messages
===============================================================================
- Use the editor, not the terminal, when writing a commit message.

.. code-block:: sh

    # good
    $ git commit

    # bad
    $ git commit -m "Quick fix"

- The summary line should be descriptive yet succinct.

  - Ideally, it should be no longer than 50 characters.
  - It should be capitalized and written in imperative present tense.

.. code-block:: sh

    # good - imperative present tense, capitalized, fewer than 50 characters
    Mark huge records as obsolete when clearing hinting faults

- After that should come a blank line followed by a more thorough description.

    - It should be wrapped to 96 characters and explain why the change is needed,
      how it addresses the issue and what side-effects it might have.
    - It should also provide any pointers to related resources
      (eg. link to the corresponding issue in a bug tracker).
    - when writing a commit message, think about what you would need to know if you run
      across the commit in a year from now.

.. code-block:: sh

    Short (50 chars or fewer) summary of changes

    More detailed explanatory text, if necessary. Wrap it to 96 characters. In some contexts,
    the first line is treated as the subject of an email and the rest of the text as the body.
    The blank line separating the summary from the body is critical, unless you omit the body
    entirely, tools like rebase can get confused if you run the two together.

    Further paragraphs come after blank lines.

    - Bullet points are okay, too

    - Use a hyphen or an asterisk for the bullet, followed by a single space, with blank lines
      between each one of them.

    Source http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html


- If a commit A depends on commit B, the dependency should be stated in the message
  of commit A. Use the SHA1 when referring to commits.

  Similarly, if commit A solves a bug introduced by commit B, it should also be stated
  in the message of commit A.

- If a commit is going to be squashed to another commit use the ``--squash`` and ``--fixup`` flags
  respectively, in order to make the intention clear:

.. code-block:: sh

    # Use the --autosquash flag when rebasing.
    # The marked commits will be squashed automatically.
    $ git commit --squash f387cab2

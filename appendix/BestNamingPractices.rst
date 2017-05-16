.. _appendix_best_naming_practices:

Best Naming Practices
===============================================================================
- Use short enough and long enough variable names in different scope of code. Generally:

  - ``1`` char length for ``loop`` counter name.
  - ``1`` word for ``condition`` or ``loop`` variable name.
  - ``1``/``2`` words for ``function`` name.
  - ``2``/``3`` words for ``class``, ``struct``, ``enum`` or ``union`` name.
  - ``3``/``4`` words for ``global`` variable name.

- Do not use too long variable names (e.g. 50 chars).

  - long names will bring ugly and hard-to-read code.
  - may not work on some compilers because of character limit.

- Use specific names for variables.

  - ``value``, ``equals``, ``temp`` or ``data`` are not valid names for any case.

- Decide and use one natural language for naming.

  - e.g. mixed using English and German names will be inconsistent and unreadable.

- Use meaningful names.

  - specify the exact action(what to do) or information, e.g. createPasswordHash.


- Use meaningful names for variables.

  - Variable name must define the exact explanation of its content.

- Do not use the same variable in the different contexts or for different purposes.

  - make it more simplicity for understandability and maintainability.

- Do not use reverse-name-meaning.

  - e.g. ``bool is_enable;`` is good then ``bool is_not_enable;``.

- Do not use non-ASCII chars in variable names.

- Use meaningful names for function parameters.

- BE CONSISTENT.

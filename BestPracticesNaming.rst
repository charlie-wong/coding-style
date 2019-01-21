Best Naming Practices
===============================================================================
BE CONSISTENT, AGAIN!

Do not use non-ASCII chars in all kinds of names.

Do not use reverse-name-meaning.

- ``bool is_enable;`` is good then ``bool is_not_enable;``.

Do not use too long variable names (e.g. 50-chars long).

- Long names will bring ugly and hard-to-read code.
- It may not work on some compilers because of character limit.

Use meaningful names.

- Meaningful names for function parameters.
- Specify the exact action(what to do) for function name, e.g. ``createPasswordHash``.
- Variables like ``value``, ``equals``, ``temp`` or ``data`` should be limited usage.
- Variable name must has the exact explanation of its content.

Decide and use one natural language for naming.

- Mixed using English and German names will be inconsistent and unreadable.

Do not use the same variable in the different contexts or for different purposes.

- Make it more simplicity for understandability and maintainability.

Use short enough and long enough variable names in different scope. Generally:

- **1-char** length for ``loop`` counter name.
- **1-word** for ``condition`` or ``loop`` variable name.
- **1-word ** or **2-words** for ``function`` name.
- **2-words ** or **3-words** for ``class``, ``struct``, ``enum`` or ``union`` name.
- **3-words ** or **4-words** for ``global`` variable name.

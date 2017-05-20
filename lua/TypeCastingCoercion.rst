Type Casting & Coercion
===============================================================================
- Perform type coercion at the beginning of the statement. Use the built-in functions.

  - built-in functions: ``tostring``, ``tonumber``, etc.

- Use ``tostring`` for strings if you need to cast without string concatenation.

.. code-block:: lua

    -- bad
    local totalScore = reviewScore .. ''

    -- good
    local totalScore = tostring(reviewScore)

- Use ``tonumber`` for Numbers.

.. code-block:: lua

    local inputValue = '4'

    -- bad
    local val = inputValue * 1

    -- good
    local val = tonumber(inputValue)

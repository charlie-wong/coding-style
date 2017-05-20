Strings
===============================================================================
- Use single quotes ``''`` for strings.

.. code-block:: lua

    -- bad
    local name = "Bob Parr"

    -- good
    local name = 'Bob Parr'

    -- bad
    local fullName = "Bob " .. self.lastName

    -- good
    local fullName = 'Bob ' .. self.lastName


- Strings longer than 100 characters should be written across multiple lines using **concatenation**.

.. code-block:: lua

    -- good, more readable
    local errorMessage = 'This is a super long '        ..
                         'error message line. This is ' ..
                         'a super long error message line.'

    -- good, more readable
    local errorMessage =
        'This is a super long '        ..
        'error message line. This is ' ..
        'a super long error message line.'

    -- bad
    local errorMessage = [[This is a super long error that
        was thrown because of Batman.
        When you stop to think about
        how Batman had anything to do
        with this, you would get nowhere
        fast.]]





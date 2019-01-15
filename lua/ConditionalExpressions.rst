Conditional Expressions & Equality
===============================================================================
``false`` and ``nil`` are **falsy** in conditional
expressions. All else is **true**.

.. code-block:: lua

    local str = ''

    if str then
        -- true
    end

Use shortcuts when you can, unless you need to know the
difference between ``false`` and ``nil``.

.. code-block:: lua

    -- bad
    if name ~= nil then
        -- ...stuff...
    end

    -- good
    if name then
        -- ...stuff...
    end

Prefer **true** statements over **false** statements where it makes sense.
Prioritize truthy conditions when writing multiple conditions.

.. code-block:: lua

    --bad
    if not thing then
        -- ...stuff...
    else
        -- ...stuff...
    end

    --good
    if thing then
        -- ...stuff...
    else
        -- ...stuff...
    end

Prefer defaults to ``else`` statements where it makes sense.
This results in less complex and safer code at the expense of
variable reassignment, so situations may differ.

.. code-block:: lua

    -- bad
    local function full_name(first, last)
        local name

        if first and last then
            name = first .. ' ' .. last
        else
            name = 'John Smith'
        end

        return name
    end

    -- good
    local function full_name(first, last)
        local name = 'John Smith'

        if first and last then
            name = first .. ' ' .. last
        end

        return name
    end

Short ternaries are okay.

.. code-block:: lua

    local function default_name(name)
        -- return the default 'Waldo' if name is nil
        return name or 'Waldo'
    end

    local function brew_coffee(machine)
        return machine and machine.is_loaded and 'coffee brewing' or 'fill your water'
    end

Naming Conventions
===============================================================================
- Avoid single letter names.
- Be descriptive with your naming.
- You can get away with single-letter names when they are variables in loops.

.. code-block:: lua

    -- bad
    local function q()
        -- ...stuff...
    end

    -- good
    local function query()
        -- ..stuff..
    end

Use underscores for ignored variables in loops.

.. code-block:: lua

    --good
    for _, name in pairs(names) do
        -- ...stuff...
    end

Use **snake case** when naming objects, functions, and instances.
Tend towards verbosity if unsure about naming.

.. code-block:: lua

    -- bad
    local OBJEcttsssss = {}
    local thisIsMyObject = {}
    local this-is-my-object = {}

    local c = function()
        -- ...stuff...
    end

    -- good
    local this_is_my_object = {}

    local function do_that_thing()
        -- ...stuff...
    end

Use **PascalCase** for factories.

.. code-block:: lua

    -- bad
    local player = require('player')

    -- good
    local Player = require('player')
    local me = Player({ name = 'Jack' })

Use **is** or **has** prefix for boolean-returning functions that are part of tables.

.. code-block:: lua

    --bad
    local function evil(alignment)
        return alignment < 100
    end

    --good
    local function is_evil(alignment)
        return alignment < 100
    end

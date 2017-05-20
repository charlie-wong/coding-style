Variables
===============================================================================
- Always use ``local`` to declare variables. Not doing so will result in global variables to avoid
  polluting the global namespace.

.. code-block:: lua

    -- bad
    superPower = SuperPower()

    -- good
    local superPower = SuperPower()

- Assign variables at the top of their scope where possible. This makes it easier to check for
  existing variables.

.. code-block:: lua

    -- bad
    local bad = function()
        test()
        print('doing stuff..')

        //..other stuff..

        local name = getName()

        if name == 'test' then
            return false
        end

        return name
    end

    -- good
    local function good()
        local name = getName()

        test()
        print('doing stuff..')

        //..other stuff..

        if name == 'test' then
            return false
        end

        return name
    end


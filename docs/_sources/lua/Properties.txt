Properties
===============================================================================
- Use dot notation when accessing known properties.

.. code-block:: lua

    local luke =
    {
        jedi = true,
        age  = 28
    }

    -- bad
    local isJedi = luke['jedi']

    -- good
    local isJedi = luke.jedi

- Use subscript notation ``[]`` when accessing properties with a variable or
  if using a table as a list.

.. code-block:: lua

    local luke =
    {
        jedi = true,
        age  = 28
    }

    local function getProp(prop) 
        return luke[prop]
    end

    local isJedi = getProp('jedi')

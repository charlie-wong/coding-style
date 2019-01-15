Tables
===============================================================================
Use the constructor syntax for table property creation where possible.

.. code-block:: lua

    -- bad
    local player = {}
    player.name  = 'Jack'
    player.class = 'Rogue'

    -- good
    local player =
    {
        name = 'Jack',
        class = 'Rogue'
    }

Define functions externally to table definition.

.. code-block:: lua

    -- bad
    local player =
    {
        attack = function() 
            -- ...stuff...
        end
    }

    -- good
    local function attack()
    end

    local player =
    {
        attack = attack
    }


Consider ``nil`` properties when selecting lengths.
A good idea is to store an ``n`` property on lists that contain the length
(as noted in `Storing Nils in Tables <http://lua-users.org/wiki/StoringNilsInTables>`_)

.. code-block:: lua

    -- nils don't count
    local list = {}
    list[0] = nil
    list[1] = 'item'

    print(#list) -- 0
    print(select('#', list)) -- 1


When tables have functions, use ``self`` when referring to itself.

.. code-block:: lua

    -- bad
    local me =
    {
        fullname = function(this)
            return this.first_name + ' ' + this.last_name
        end
    }

    -- good
    local me =
    {
        fullname = function(self)
            return self.first_name + ' ' + self.last_name
        end
    }

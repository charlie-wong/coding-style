Modules
===============================================================================
- The module should return a table or function.
- The module should not use the global namespace for anything ever.
- The module should be a closure.
- The file should be named like the module.

.. code-block:: lua

    -- thing.lua
    local thing = { }

    local meta =
    {
        __call = function(self, key, vars)
        print key
        end
    }


    return setmetatable(thing, meta)

- Note that modules are `loaded as singletons <http://lua-users.org/wiki/TheEssenceOfLoadingCode>`_
  and therefore should usually be factories (a function returning a new instance of a table)
  unless static (like utility libraries.)


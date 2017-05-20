Functions
===============================================================================
- Prefer lots of **small** functions to large, complex functions.
  `Smalls Functions Are Good <http://kiki.to/blog/2012/03/16/small-functions-are-good-for-the-universe/>`_.

- Prefer function syntax over variable syntax. This helps differentiate between named and anonymous
  functions.

.. code-block:: lua

    -- bad
    local nope = function(name, options)
        -- ...stuff...
    end

    -- good
    local function yup(name, options)
        -- ...stuff...
    end

- Never name a parameter ``arg``, this will take precendence over the ``arg`` object that is given
  to every function scope in older versions of Lua.

.. code-block:: lua

    -- bad
    local function nope(name, options, arg) 
        -- ...stuff...
    end

    -- good
    local function yup(name, options, ...)
        -- ...stuff...
    end

- Perform validation early and return as early as possible.

.. code-block:: lua

    -- bad
    local is_good_name = function(name, options, arg)
        local is_good = #name > 3
        is_good = is_good and #name < 30

        -- ...stuff...

        return is_bad
    end

    -- good
    local is_good_name = function(name, options, args)
        if #name < 3 or #name > 30 then return false end

        -- ...stuff...

        return true
    end


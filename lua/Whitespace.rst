Whitespace
===============================================================================
Tabs are 4 characters, and thus indentations are also 4 characters, and use spaces only.

.. code-block:: lua

    -- bad  - 1 space indentations
    function() 
     local name
    end

    -- bad  - 2 space indentations
    function() 
      local name
    end

    -- bad  - 3 space indentations
    function() 
       local name
    end

    -- Good - 4 space indentations
    function() 
        local name
    end

Place 1 space before opening and closing braces.
Place no spaces around parens.

.. code-block:: lua

    -- bad
    local test = {one=1}

    -- good
    local test = { one = 1 }

    -- bad
    dog.set('attr',{
        age = '1 year',
        breed = 'Bernese Mountain Dog'
    })

    -- good
    dog.set('attr', {
        age = '1 year',
        breed = 'Bernese Mountain Dog'
    })

Surround operators with spaces.

.. code-block:: lua

    -- bad
    local thing=1
    thing = thing-1
    thing = thing*1
    thing = 'string'..'s'

    -- good
    local thing = 1
    thing = thing - 1
    thing = thing * 1
    thing = 'string' .. 's'


Use one space after commas.

.. code-block:: lua

    --bad
    local thing = {1,2,3}
    thing = {1 , 2 , 3}
    thing = {1 ,2 ,3}

    --good
    local thing = {1, 2, 3}


Add a line break after multiline blocks.

.. code-block:: lua

    --bad
    if thing then
        -- ...stuff...
    end
    function derp()
        -- ...stuff...
    end
    local wat = 7

    --good
    if thing then
        -- ...stuff...
    end

    function derp()
        -- ...stuff...
    end

    local wat = 7

Place an empty newline at the end of the file.
Delete unnecessary whitespace at the end of lines.
No spaces should be used immediately before or inside a bracketing character.

  - ``[``, ``(``, ``{`` and their matches.

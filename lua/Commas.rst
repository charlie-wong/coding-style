Commas
===============================================================================
Leading commas aren't okay. An ending comma on the
last item is okay but discouraged.

.. code-block:: lua

    -- bad, why do you want write it like this?
    local thing =
    {
        once = 1
        , upon = 2
        , aTime = 3
    }

    -- good
    local thing =
    {
        once = 1,
        upon = 2,
        aTime = 3
    }

    -- okay
    local thing =
    {
        once = 1,
        upon = 2,
        aTime = 3,
    }

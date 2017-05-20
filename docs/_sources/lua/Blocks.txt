Blocks
===============================================================================
- Single line blocks are okay for **small** statements.
- Try to keep lines length to 100 characters.
- Indent lines if they overflow past the limit.
- Putting multiple statements on one line is discouraged, unless the expression is very short.

.. code-block:: lua

    -- good
    if test then return false end

    -- good
    if test then
        return false
    end

    -- bad, the line too long
    if test < 1 and do_complicated_function(test) == false or seven == 8 and nine == 10 then do_other_complicated_function()end

    -- good
    if test < 1 and do_complicated_function(test) == false or
       seven == 8 and nine == 10 then

        do_other_complicated_function() 
        return false 
    end


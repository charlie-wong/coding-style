File Structure
===============================================================================
- Files should be named in all lowercase.
- Lua files should be in a top-level **src** folder.
- The main library file should be called ``module_name.lua``.
- **LICENSE**, **README**, etc should be in the top level.
- Tests should be in a top-level **test** folder.
- Executables should be in a top-level **bin** folder.

.. code-block:: lua

    -- File Structure of lua project or module
    --
    -- ./a_lua_module
    --      bin/
    --          script.sh

    --      test/
    --          test_module.lua
    --          test_some_file.lua

    --      src/
    --          module.lua
    --          some_file.lua

    --      README.md
    --      LICENSE.md

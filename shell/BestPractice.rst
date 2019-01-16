Best Practice
===============================================================================
- Always set local function variables ``local``.

- Clearly document code parts that are not easily understood.

- Use the builtin ``readonly`` when declaring constants and immutable variable.

- Stick to the ``pushd``, ``popd``, and ``dirs`` builtins for
  `directory stack manipulation <https://www.gnu.org/software/bash/manual/html_node/Directory-Stack-Builtins.html#Directory-Stack-Builtins>`_
  where sensible.

- `Silence is golden <http://www.linfo.org/rule_of_silence.html>`_, like in
  any UNIX programm, avoid cluttering the terminal with useless output.

- If a project gets bigger, split it up into smaller files with clear
  and obvious naming scheme.

- Write clear code.

  - never obfuscate what the script is trying to do
  - never shorten uncessesarily with a lot of commands
    per LoC chained with a semicolon

- Bash does not have a concept of public and private functions, thus;

  - public functions get generic names, whereas
  - private functions are prepended by two underscores (RedHat convention)

- Write generic small check functions instead of large init and clean-up code.

  .. code-block:: sh

      # both functions return non-zero on error
      function is_valid_string?()
      {
          [[ $@ =~ ^[A-Za-z0-9]*$ ]]
      }

      function is_integer?()
      {
          [[ $@ =~ ^-?[0-9]+$ ]]
      }

- Try to stick to `restricted <http://www.tldp.org/LDP/abs/html/restricted-sh.html>`_
  mode where sensible and possible to use ``set -r``.

  **Use with caution**. While this flag is very useful for security sensitive
  environments, scripts have to be written with the flag in mind. Adding
  restricted mode to an existing script will most likely break it.

- Scripts should somewhat reflect the following general layout, e.g.

  .. code-block:: sh

      #!/usr/bin/env bash
      #
      # AUTHORS, LICENSE and DOCUMENTATION
      #
      set -eu -o pipefail

      # Readonly Variables
      # Global Variables

      # Import ("source scriptname") of external source code

      # Functions
      # - function local variables
      # - clearly describe interfaces: return either a code or string

      # Main
      # - option parsing
      # - log file and syslog handling
      # - temp file and named pipe handling
      # - signal traps

      # ------------------------------------------------------------------------
      # To keep in mind:
      # - quoting of all variables passed when executing sub-shells or cli tools.
      # - testing of functions, conditionals and flow.
      # - makes restricted mode ("set -r") for security sense.

- Overusing ``grep`` and ``grep -v``, e.g.

  .. code-block:: sh

      ps ax | grep ${processname} | grep -v grep

  versus using appropriate userland utilities:

  .. code-block:: sh

      pgrep ${processname}

- Please use ``printf`` instead of ``echo``.

  The bash builtin ``printf`` should be preferred to ``echo`` where possible.
  It does work like printf in C or any other high-level language,
  also see `builtin printf <http://wiki.bash-hackers.org/commands/builtin/printf>`_.

- Anonymous Functions, which is also called Lambdas.

  Yup, it's possible. But you'll probably never need them,
  in case you really do, here's how:

  .. code-block:: sh

      function lambda()
      {
          _f=${1};
          shift
          function _l
          {
              eval ${_f};
          }
          _l ${*};
          unset _l
      }

- Never forget that you cannot put a space/blank around ``=`` during an assignment.

  .. code-block:: sh

      # This is not work
      ret = false

      # This works fine
                var_1=1
           a_long_var=2
      a_very_long_var=3

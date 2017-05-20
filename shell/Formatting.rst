Formatting
===============================================================================

.. _sh_indentation:

Indentation
-------------------------------------------------------------------------------
Indent 4 spaces for each level. No tabs and only spaces.

- Use blank lines between blocks to improve readability.
- Indentation is 4 spaces for each level.
- Whatever you do, don't use tabs, and always use spaces.

.. _sh_line_length_and_long_strings:

Line Length and Long Strings
-------------------------------------------------------------------------------
Maximum line length is 100 characters.

If you have to write strings that are longer than 100 characters, this should be done with a here
document or an embedded newline if possible. Literal strings that have to be longer than 100 chars
and can't sensibly be split are ok, but it's strongly preferred to find a way to make it shorter. e.g.

.. code-block:: sh

    # DO use 'here documention'
    cat <<END
    I am an exceptionally long
    string.
    END

    # Embedded newlines are ok too
    long_string="I am an exceptionally
                 long string."

.. _sh_pipelines:

Pipelines
-------------------------------------------------------------------------------
Pipelines should be split one per line if they don't all fit on one line.

If a pipeline all fits on one line, it should be on one line. If not, it should be split at one pipe
segment per line with the pipe on the end of the line, and align the new line to the first item.
This applies to a chain of commands combined using ``|`` as well as to logical compounds using ``||``
and ``&&``, e.g.

.. code-block:: sh

    # All fits on one line of pipline
    ls ${long_list_of_parameters} | grep ${foo} | grep -v grep | pgrep | wc -l | sort | uniq

    # Long commands of pipline, far more readable, isn't it?
    ls ${long_list_of_parameters}	  \
       grep ${foo}                  | \
       grep -v grep                 | \
       pgrep                        | \
       wc -l                        | \
       sort                         | \
       uniq

.. _sh_loops_condition:

Loops and Conditions
-------------------------------------------------------------------------------
Put ``; do`` and ``; then`` on the same line as the ``while``, ``for`` or ``if``.

Loops in shell are a bit different, but we follow the same principles as with braces when declaring
functions. That is: ``; then`` and ``; do`` should be on the same line as the ``if``, ``for`` and
``while``. while ``else`` should be on its own line and closing statements should be on their own line
vertically aligned with the opening statement, For example:

.. code-block:: sh

    if ${event}; then
        ...
    fi

    while ${event}; do
        ...
    done

    for v in ${list[@]}; do
        ...
    done

    for dir in ${dirs_to_cleanup}; do
        if [[ -d "${dir}/${ORACLE_SID}" ]]; then
            log_date "Cleaning up old files in ${dir}/${ORACLE_SID}"
            rm "${dir}/${ORACLE_SID}/"*
            if [[ "$?" -ne 0 ]]; then
                error_message
            fi
        else
            mkdir -p "${dir}/${ORACLE_SID}"
            if [[ "$?" -ne 0 ]]; then
                error_message
            fi
        fi
    done

.. _sh_case_statement:

Case Statement
-------------------------------------------------------------------------------
- Indent by 4 spaces.
- A one-line needs a space after the close parenthesis of the pattern and before the ``;;``
- Long or multi-command should be split over multiple lines with the pattern, actions, and ``;;``
  on separate lines.

The matching expressions are indented one level from the ``case`` and ``esac``. Multiline actions
are indented another level.  In general, there is no need to quote match expressions. Pattern
expressions should not be preceded by an open parenthesis. Avoid the ``&`` and ``;;&`` notations.

For example:

.. code-block:: sh

    case "${expression}"; in
        a)
            variable="..."
            some_command "${variable}" "${other_expr}" ...
            ;;
        absolute)
            actions="relative"
            another_command "${actions}" "${other_expr}" ...
            ;;
        *)
            error "Unexpected expression '${expression}'"
        ;;
    esac

Simple commands may be put on the same line as the pattern and ``;;`` as long as the expression
remains readable. This is often appropriate for single-letter option processing. When the actions
don't fit on a single line, put the pattern on a line on its own, then the actions, then ``;;`` also
on a line of its own. When on the same line as the actions, use a space after the close parenthesis
of the pattern and another before the ``;;``.

.. code-block:: sh

    verbose='false'
    aflag=''
    bflag=''
    files=''
    while getopts 'abf:v' flag; do
        case "${flag}" in
            a) aflag='true' ;;
            b) bflag='true' ;;
            f) files="${OPTARG}" ;;
            v) verbose='true' ;;
            *) error "Unexpected option ${flag}" ;;
        esac
    done

.. _sh_variable_expansion:

Variable expansion
-------------------------------------------------------------------------------
In order of precedence:

- stay consistent with what you find, quote your variables
- prefer ``${var}`` over ``$var``

These are meant to be guidelines, as the topic seems too controversial for a mandatory regulation.

They are listed in order of precedence.

- Stay consistent with what you find for existing code
- :ref:`Quote variables <sh_quoting>`
- Don't brace-quote single character shell **specials**/**positional** parameters, unless
  strictly necessary or avoiding deep confusion. Prefer brace-quoting all other variables

.. code-block:: sh

    # Preferred style for 'special' variables:
    echo "Positional: $1" "$5" "$3"
    echo "Specials: !=$!, -=$-, _=$_. ?=$?, #=$# *=$* @=$@ \$=$$ ..."

    # Braces necessary:
    echo "many parameters: ${10}"

    # Braces avoiding confusion:
    # Output is "a0b0c0"
    set -- a b c
    echo "${1}0${2}0${3}0"

    # Preferred style for other variables:
    echo "PATH=${PATH}, PWD=${PWD}, mine=${some_var}"
    while read f; do
        echo "file=${f}"
    done < <(ls -l /tmp)

    # Section of discouraged cases

    # Unquoted vars, unbraced vars, brace-quoted single letter
    # shell specials.
    echo a=$avar "b=$bvar" "PID=${$}" "${1}"

    # Confusing use: this is expanded as "${1}0${2}0${3}0",
    # not "${10}${20}${30}
    set -- a b c
    echo "$10$20$30"

.. _sh_quoting:

Quoting
-------------------------------------------------------------------------------
- Use double quotes for strings that require variable expansion or command substitution
  interpolation and single quotes for all others.
- Be aware of the quoting rules for pattern matches.

  - Single quotes indicate that no substitution is desired.
  - Double quotes indicate that substitution is required/tolerated.

.. code-block:: sh

    # right
    foo='Hello World'
    bar="You are $USER"

    # wrong
    foo="hello world"

    # possibly wrong, depending on intent
    bar='You are $USER'



- Always quote strings containing variables, command substitutions, spaces or shell meta characters,
  unless careful unquoted expansion is required.
- Never quote **literal** integers.

- Use ``$@`` unless you have a specific reason to use ``$*``.

.. code-block:: sh

    # Simple examples
    #
    # quote command substitutions
    flag="$(some_command and its args "$@" 'quoted separately')"
    #
    # quote variables
    echo "${flag}"
    #
    # never quote literal integers
    value=32
    #
    # quote command substitutions, even when you expect integers
    number="$(generate_number)"
    #
    # prefer quoting words, not compulsory
    readonly USE_INTEGER='true'
    #
    # quote shell meta characters
    echo 'Hello stranger, and well met. Earn lots of $$$'
    echo "Process $$: Done making \$\$\$."
    #
    # command options or path names
    # $1 is assumed to contain a value here
    grep -li Hugo /dev/null "$1"
    #
    # Less simple examples
    # quote variables, unless proven false: ccs might be empty
    git send-email --to "${reviewers}" ${ccs:+"--cc" "${ccs}"}
    #
    # Positional parameter precautions: $1 might be unset
    # Single quotes leave regex as-is.
    grep -cP '([Ss]pecial|\|?characters*)$' ${1:+"$1"}
    #
    # For passing on arguments,
    # "$@" is right almost everytime, and $* is wrong almost everytime:
    #
    # > $* and $@ will split on spaces, clobbering up arguments
    #   that contain spaces and dropping empty strings;
    # > "$@" will retain arguments as-is, so no args
    #   provided will result in no args being passed on;
    #   This is in most cases what you want to use for passing
    #   on arguments.
    # > "$*" expands to one argument, with all args joined
    #   by (usually) spaces,
    #   so no args provided will result in one empty string
    #   being passed on.
    #
    #   Consult 'man bash' for the nit-grits ;-)
    #
    set -- 1 "2 two" "3 three tres"; echo $# ; set -- "$*"; echo "$#, $@")
    set -- 1 "2 two" "3 three tres"; echo $# ; set -- "$@"; echo "$#, $@")

When in doubt however, `quote all expansions <http://mywiki.wooledge.org/Quotes>`_.


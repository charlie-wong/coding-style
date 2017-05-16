Formatting
===============================================================================
Coding style and formatting are pretty arbitrary, but a project is much easier to follow if everyone
uses the same style. Individuals may not agree with every aspect of the formatting rules, and some
of the rules may take some getting used to, but it is important that all project contributors follow
the style rules so that they can all read and understand everyone's code easily.

.. _c_line_length:

Line Length
-------------------------------------------------------------------------------
Each line of text in your code should be at most 100 characters long.

.. note::

    - Maybe you are not agree with 100 as maxlength of lines, exactly is 99 visiable characters with
      one invisiable character(new line sign), and prefer to 80, 120 or others. Thus, regardless of
      whether you find them sensible or not, the rules are the rules.
    - If you are writing for print using A4, changing this back to 80 maybe more reasonable,
      because the max character length of A4 is 80.

    - Comment lines can be longer than 100 characters if it is not feasible to split them without
      harming readability.
      e.g. if a line contains an example command or a literal URL longer than 100 characters.
    - A raw-string literal may have content that exceeds 100 characters.
    - An ``#include`` statement with a long path may exceed 100 columns.

.. _c_indentation:

Indentation
-------------------------------------------------------------------------------
Tabs are 4 characters, and thus indentations are also 4 characters, and use spaces only.

The whole idea behind indentation is to clearly define where a block of control starts and ends.
Especially when you’ve been looking at your screen for 20 straight hours, you’ll find it a lot
easier to see how the indentation works if you have large indentations.

If having 4-character indentations makes the code move too far to the right, and makes it hard to
read on the screen, then it maybe a warning that your logical have problems and you need to find
an easy way to fix your problem.

.. tip::

    - Don’t put multiple statements on a single line unless you have something to hide.
    - Don’t put multiple assignments on a single line either.
    - Avoid complicated expressions.

.. _c_spaces_vs_tabs:

Spaces VS. Tabs
-------------------------------------------------------------------------------
Use only spaces, and indent 4 spaces at a time. Do not use tabs in your code.

.. tip::

    - You should set your editor to emit spaces when you hit the tab key.
    - Put it this way will make the code format always correct with all text editors.

.. warning::

    Use tabs when it is necessary, such as the Makefile rules.

.. _c_non_ascii_characters:

Non-ASCII Characters
-------------------------------------------------------------------------------
Non-ASCII characters should be rare, and must use UTF-8 formatting.

You shouldn't hard-code user-facing text in source, even English, so use of non-ASCII characters
should be rare. However, in certain cases it is appropriate to include such words in your code.
For example, if your code parses data files from foreign sources, it may be appropriate to hard-code
the non-ASCII string(s) used in those data files as delimiters. More commonly, unittest code (which
does not need to be localized) might contain non-ASCII strings. In such cases, you should use UTF-8,
since that is an encoding understood by most tools able to handle more than just ASCII.

Hex encoding is also OK, and encouraged where it enhances readability,
for example, ``\uFEFF``, is the Unicode zero-width no-break space character,
which would be invisible if included in the source as straight UTF-8.

.. _c_breaking_long_lines_and_strings:

Breaking Long Lines and Strings
-------------------------------------------------------------------------------
Coding style is all about readability and maintainability using commonly available tools.

Statements longer than 100 columns will be broken into sensible chunks, unless exceeding 100 columns
significantly increases readability and does not hide information. Descendants are always
substantially shorter than the parent and are placed substantially to the right. However, never
break user-visible strings messages, because that breaks the ability to ``grep`` for them.

.. _c_the_usage_of_braces:

The Usage of Braces
-------------------------------------------------------------------------------
Put the opening and closing brace on the line just by itself, for all statement blocks, thusly:

.. code-block:: c

    if(is_true)
    {
        do_it_like_this();
        // decrease the code density, make the start/end more clear
    }
    else if(is_good)
    {
        do_some_thing();
    }
    else
    {
        do_other_thing();
    }
    
    struct this_is_good
    {
        bool m_good;
        ...
    }

Note that the closing brace is empty on a line of its own, the only exception is it followed by
by a continuation, that is a do-statement, e.g.

.. code-block:: c

    do
    {
        do_it_like_this();
    }while(is_true);

Prefer curly brace where a single statement is enough, make it clear enough, e.g:

.. code-block:: c

    if(condition)
    {
        action();
    }

    if(condition)
    {
        do_something();
    }
    else
    {
        do_another();
    }

Adding short comment to closing braces properly may help when you are reading code because you don't
have to find the begin brace to know what is going on especially for *big* and *long* code.

.. tip::

    - clearness and readability is much more important.
    - do not worried about saving lines.

.. _c_the_usage_of_spaces:

The Usage of Spaces
-------------------------------------------------------------------------------
- NO spaces after the keywords, the notable exceptions of C and the function names.
- NO spaces after-the-open and before-the-close parentheses.
- NO space around the ``.`` and ``->`` structure member operators.

.. code-block:: c

    // Keywords of C
    if, switch, case, for, do, while

    // Notable exceptions of C
    sizeof, typeof, alignof, __attribute__

.. code-block:: c

    // do not need to emphasis the keywords, it is clear enough
    while (condition)
    {
        do_something();
    }
    
    // do not need to emphasis the condition, it is clear enough
    if( condition )
    {
        do_something();
    }
    
    s = sizeof( struct file ); // This is not good.
    s = sizeof( struct file ); // This is good enough.

- Use one space around (on each side of) most binary and ternary operators, such as any of these:

.. code-block:: c

    =  +  -  <  >  *  /  %  |  &  ^  <=  >=  ==  !=  ?  :

- NO space after unary operators, such as any of these:

.. code-block:: c

    &  *  +  -  ~  !  sizeof  typeof  alignof  __attribute__  defined

- NO space before the postfix increment and decrement unary operators:

.. code-block:: c

    ++  --

- NO space after the prefix increment and decrement unary operators:

.. code-block:: c

    ++  --

.. note::

    Although, for notable exceptions, the parentheses are not required in the language, for example,
    ``sizeof info;`` is the same as ``sizeof(info);`` after ``struct fileinfo info;`` is declared,
    it will make things simple by using parentheses all the time.
    
.. _c_the_usage_of_stars:

The Usage of Stars
-------------------------------------------------------------------------------
When declaring pointer variable or a function that returns a pointer type, the preferred use of
``*`` is adjacent to the variable name or function name and not adjacent to the type name, e.g:

.. code-block:: c

    char *linux_banner;
    unsigned long long memparse(char *ptr, char **retptr);
    char *match_strdup(substring_t *s);

.. _c_function_declarations_and_definitions:

Function Declarations and Definitions
-------------------------------------------------------------------------------
Return type on the same line as function name, parameters on the same line if they fit.
Wrap parameter lists which do not fit on a single line.

Function on the same line, for example:

.. code-block:: c

    return_type function_name(type arg_name_1, type arg_name_2)
    {
        do_something();
        ...
    }

Function on more then one line, too much text to fit on one line, for example:

.. code-block:: c

    return_type function_name_1(type arg_name_1, type arg_name_2, type arg_name_3,
                                type arg_name_4)
    {
        do_something();
        ...
    }

    return_type function_name_2(type arg_name_1, type arg_name_2, type arg_name_3,
                                type arg_name_4, type arg_name_5, type arg_name_6)
    {
        do_something();
        ...
    }

.. note::

    - Choose good parameter names.

    - The open parenthesis is always on the same line as the function name.
    - There is never a space between the function name and the open parenthesis.
    - There is never a space between the open parentheses and the first parameters.

    - The open curly brace is always on the next line by itself.
    - The close curly brace is always on the last line by itself.

    - All parameters should be named, with identical name in declaration and implementation.
    - All parameters should be aligned if possible.

    - Default indentation is 4 spaces.
    - Wrapped parameters should indent to the function's first arguments.

.. tip::

     Maybe it is time to rewrite the function interface by group the arguments into a struct if it
     has too much text to fit on one line.

.. _c_function_calls:

Function Calls
-------------------------------------------------------------------------------
Write the call all on a single line if it fits, function calls have the following format:

.. code-block:: c

    bool retval = do_something(arg_1, arg_2, arg_3);

If the arguments do not fit on one line, they should be broken up onto multiple lines, with each
subsequent line aligned with the first argument. Do not add spaces after the open paren or before
the close paren:

.. code-block:: c

    bool retval = do_something(a_very_very_very_very_long_arg_1,
                               arg_2, arg_3);


If the function has many arguments, consider having one per line if this makes the code more
readable:

.. code-block:: c

    bool retval = do_something(arg_1,
                               arg_2,
                               arg_3,
                               arg_4);

If the function has many arguments, consider having minimum number of lines by breaking up onto
multiple lines, with each subsequent line aligned with the functions's first argument:

.. code-block:: c

    bool retval = do_something(arg_1, arg_2, arg_3, arg_4
                               arg_5, arg_6, arg_7, arg_8);

Arguments may optionally all be placed on subsequent lines, with one line per argument:

.. code-block:: c

    if(...)
    {
        do_something(arg_1,
                     arg_2,
                     arg_3,
                     arg_4);
    }

.. _c_braced_initializer_list:

Braced Initializer List
-------------------------------------------------------------------------------
Format a braced list exactly like you would format a function call in its place.

If the braced list follows a name (e.g. a type or variable name), format as if the { } were the
parentheses of a function call with that name. If there is no name, assume a zero-length name.

.. code-block:: c

    struct my_struct_ST m =
    {
        superlongvariablename_1,
        superlongvariablename_2,
        { short, interior, list },
        {
            interiorwrappinglist_1,
            interiorwrappinglist_2,
        }
    };

.. _c_conditionals:

Conditionals
-------------------------------------------------------------------------------
- Prefer no spaces inside parentheses.
- The ``if``, ``else`` and ``if else`` keywords belong on separate lines by itself, no curly.
- Always use curly braces, even if the body is only one sentence.
- Make 4 space indent, make sure no use tabs.
- Make sure there is no space between ``if``/``else``/``if else`` keywords and the open parentheses.

.. code-block:: c

    // Good - no spaces inside parentheses
    // Good - no spaces between if and the open parentheses
    // Good - if just on the line by itself
    if(condition)
    {        // Good - open curly on the next line by itself
        ...  // Good - 4 space indent
    }        // Good - close curly on the last line by itself
    else if(...)
    {
        ...
    }
    else
    {
        ...
    }
    
    if( condition ) // Bad - have two spaces inside parentheses
    {
      do_some();    // Bad - not 4 space indent
      ...
    }
    else if(...) {  // Bad - open curly and else-if not on the line just by itself
        ...
    }
    else {          // Bad - else/open curly not on the line just by itself
        ...
    }

Even if the body is only one sentence, the curly can still not be omitted. Never use a single
sentence or empty curly as the body, so the single semicolon.

.. code-block:: c

    if(x == foo) { return foo(); } // Good - this will be fine.
    if(x == foo) 
    {
        return foo();              // Good - clear enough.   
    }
    
    if(x == bar) bar();            // Bad  - this is not good, easy misreading
    do_another_thing(); 
    
    if(x == bar) return bar();     // Bad  - no curly.
    if(x == bar) {}                // Bad  - do you realy need this?

.. _c_loops_and_switch_statements:

Loops and Switch Statements
-------------------------------------------------------------------------------
Empty loop bodies should only use an ``continue`` inside curly. Never use a single
sentence or empty curly as the body, so the single semicolon.

.. code-block:: c

    while(condition) { continue; }          // Good - continue indicates no logic.
    while(condition)
    {
        continue;                           // Good - clear enough.
    }

    while(condition) {}                     // Bad  - is this part finished?
    for(int i = 0; i < some_number; i++) {} // Bad  - why not do it in the body?
    while(condition);                       // Bad  - looks like part of do/while loop.

-  Single-statement loops should always have braces.

.. code-block:: c

    for(int i = 0; i < some_number; ++i)
    {
        printf("I take it back\n");  // Good - 4 space indent
    }
    
    while(condition)
    {
        do_something();              // Good - 4 space indent
    }
    
    for(int i = 0; i < some_number; ++i)
        printf("I love you\n");     // Bad   - no braces

    for(int i = 0; i < some_number; ++i)
    {
      printf("I take it back\n");   // Bad  - not 4 space indent
    }

- ``case`` blocks in ``switch`` statements should always have curly braces.
-  align the subordinate ``case`` labels in the same column with ``switch``.
- ``switch`` statements should always have a ``default`` case, no exception.
- No space before the colon of ``case``.
- If the ``default`` case should never execute, simply ``assert``.

.. code-block:: c

    switch(var)
    {           // open curly braces must on the next line by itself
    case 0:     // each case must 4 space indent
    {
        ...
        break;  // 4 space indent
    }
    case 1:     // no space before the colon
    {
        ...
        break;
    }
    default:
    {
        assert(false);
    }
    }
    
    switch(var)
    {
    // for readability, this is also good
    case 0:  do_some_thing_short(); break;
    case 1:  another_thing_short(); break;
    default: assert(false);
    }

.. tip::

    The space around the operator in loop condition is optional and feel free to insert extra
    parentheses judiciously for readability.

.. _c_pointer_expressions:

Pointer Expressions
-------------------------------------------------------------------------------
- No spaces around period or arrow.
- Pointer operators do not have trailing spaces.
- Pointer operators have no space after the * or &.

Examples of correctly-formatted pointer:

.. code-block:: c

    int  x = *p;
    int *z = &x;
    int  z = g.y;
    int  h = r->y;

- When declaring a pointer variable or argument, place the asterisk adjacent to the variable name.

.. code-block:: c

    char *c;   // Good - variable name just following *, no spaces between them.
    
    char * c;  // Bad  - spaces on both sides of *.
    char* c;   // Bad  - space between * and the variable name.

- It is not allowed to declare multiple variables in the same declaration.

.. code-block:: c

    int x, y;  // Bad  - no multiple variables on a declaration.
    int a, *b; // Bad  - such declarations are easily misread.

    int  x = 2;    // Good - only one variable on a declaration.
    int  y = 0;    // Good - easily initiallize it, no misreading.
    int  a = 1;
    int *b = NULL; // Good - such declaration clear enough.

- It is a bad idea to have multiple sentences on the same line.

.. code-block:: c

    // Bad  - why do you want to do like this?
    int x=foo(); char c = get_char();
    int a=1; char *str="good";

    // Good - why do you make it clear?
    int  x = foo();
    char c = get_char();
    int  a = 1;
    char *str = "good";


.. _c_boolean_expressions:

Boolean Expressions
-------------------------------------------------------------------------------
When a boolean expression that is longer than the standard :ref:`line length <c_line_length>`, break
it up by:

- keep operators at the end of the line, and align them for readability and emphasis.
- make all items indent to the first item of the boolean expression.

.. code-block:: c

    // use minimal lines
    if(this_one_thing > this_other_thing && a_third_thing == a_fourth_thing &&
       yet_another_thing && the_last_thing)
    {
        // 'yet_another_thing' align to 'this_one_thing'
        ...
    }
    
    // each on a single line, make the operator indented
    if(this_one_thing > this_other_thing &&
       a_third_thing == a_fourth_thing   &&
       yet_another_thing                 &&
       the_last_thing)
    {
        // all items align to 'this_one_thing'
        ...
    }

.. note::

    - Be consistent in how breaking up the lines with the codes around.
    - Feel free to insert extra parentheses judiciously because they can be very helpful in
      increasing readability when used appropriately.
    - Always use the punctuation operators, such as ``&&`` and ``~``, rather than the word
      operators, such as ``and`` and ``compl``.

.. _c_return_values:

Return Values
-------------------------------------------------------------------------------
- Do not needlessly surround the return expression with parentheses.
- Use parentheses in return **expr** only where you would use them in ``x = expr;`` like format.

.. code-block:: c

    return result;                // Good - No parentheses in the simple case.
    return (ret == true);         // Good - return boolean value.
    return (sec : opt_1 ? opt_2); // Good - select one as the return value.
    
    // Good - Parentheses OK to make a complex expression more readable.
    return (some_long_condition && another_condition);
    return (some_long_condition &&
            another_condition   &&
            yes_the_last_one);
    
    return (value);    // Bad - You would never write 'var = (value);', would you ?
    return(result);    // Bad - return is not a function!

.. tip::

    - Feel free to insert extra parentheses judiciously because they can be very helpful in
      increasing readability when used appropriately.

.. _c_preprocessor_directive_indentation:

Preprocessor Directives
-------------------------------------------------------------------------------
- The hash mark that starts a preprocessor directive should always be at the beginning of the line.
- Nested directives should add 3 spaces after the hash mark for each level of indentation.
- If preprocessor directives are within the body of indented code, make judiciously indent to
  increase the readability.

.. code-block:: c

    if(lopsided_score)
    {
    #if DISASTER_PENDING
        drop_every_thing();
        // judiciously indent, more readable
        #if NOTIFY
        notify_client();
        #endif
    #endif
        BackToNormal();
    }
    
    #ifdef DEBUG_LOG_ENABLE
    #   define DEBUG_MSG(msg) printf("%s\n", (msg)); // add 3 spaces before 'define'
    #else
    #   define DEBUG_MSG(msg)                        // make it more readable
    #endif

.. _c_general_horizontal_whitespace:

General Horizontal Whitespace
-------------------------------------------------------------------------------
- Use of horizontal whitespace depends on location.
- Never put trailing whitespace at the end of a line.

.. code-block:: c

    int i = 0;        // Semicolons usually have no space before them.
    int x[] = { 0 };  // Spaces inside braces for braced-init-list on both sides.

.. note::

    Some editors with ``smart`` indentation will insert whitespace at the beginning of new lines as
    appropriate, so you can start typing the next line of code right away. However, if some such
    editors do not remove the whitespace when you end up not putting a line of code there, such as
    if you leave a blank line. As a result, you end up with lines containing trailing whitespace.

.. warning::

    Adding trailing whitespace can cause extra work for others editing the same file when they
    merge, as they can removing existing trailing whitespace, they are invisiable, are't they.
    
    Thus, do NOT introduce trailing whitespace. Remove it if you're already changing that line, or
    do it in a separate clean-up operation(preferably when no-one else is working on the file.

.. _c_blocks_horizontal_whitespace:

Blocks Horizontal Whitespace
-------------------------------------------------------------------------------
.. code-block:: c

    // no space after the keyword in conditions and loops
    if(b)
    {
        ...
        do_some_thing(); // 4 space indent
    }

    // usually no space inside parentheses
    // no space after the keywords: while
    while(test) { continue; }
    
    // no space after the keywords: for
    // for loops always have a space after the semicolon
    // for loops usually no space before the semicolon
    for(int i = 0; i < 5; ++i)
    {
        // one space before the semicolon
        for( ; ; )
        {
            ...
            if(condition) break; // 4 space indent
        }
    }
    
    // no space after the keywords: switch
    switch(i)
    {
    case 1:  // No space before colon in a switch case.
    { ... }
    case 2:
    { ... }
    default: // Always have default
    { ... }
    }

    // the same goes for union and enum
    struct my_struct_ST
    {   // open curly brace on the next line by itself
        // 4 space indent
        const char *m_name;  ///< name of people, max len is 100
        const char *m_addr;  ///< home address, max len is 512
        // make properly align of members
        // make properly align of members comments if have
        bool  m_boy;         ///< boy: @b true; girl: @b false
        int   m_age;         ///< age, [1, 150]
    };// no space between close curly brace and semicolon
    
    // the same goes for union and enum
    typedef struct
    {
        const char *m_name;  ///< name of people, max len is 100
        const char *m_addr;  ///< home address, max len is 512
        bool  m_boy;         ///< boy: @b true; girl: @b false
        int   m_age;         ///< age, [1, 150]
    } my_struct_st;
    // no space between the name and semicolon
    // one space between close curly brace and the name

.. _c_operators_horizontal_whitespace:

Operators Horizontal Whitespace
-------------------------------------------------------------------------------
.. code-block:: c

    
    x = 0;             // assignment operators always have spaces around them.
    v = w * x + y / z; // binary operators usually have spaces around them.
    v = w*x + y/z;     // it's OK to remove spaces around factors, if still clear enough.
    v = w * (x + z);   // parentheses should have no internal padding.
    
    // no spaces separating unary operators and their arguments.
    x = -5;
    ++x;
    if(x && !y)
    {
        ...
    }

.. tip::

    - Feel free to insert extra parentheses judiciously because they can be very helpful in
      increasing readability when used appropriately.

.. _c_variables_horizontal_whitespace:

Variables Horizontal Whitespace
-------------------------------------------------------------------------------
.. code-block:: c

    int long_variable = 0;  // NEVER align assignments like this.
    int i             = 1;
    
    int i = 1;              // this will be clear and good enough.
    int a_var = 0;
    int an_var = 1;
    int yes_anox = 5;
    int long_variable = 0;

    struct my_struct_ST
    {
        const char *m_name;
        const char *m_addr;  // make properly align of members
        bool  m_boy;         // make properly align of members
        int   m_age;
    } my_variable[] =        // one space between close curly brace and variable
    {   // open curly brace on the next line by itself
        // make properly align, increasing the readability
        // make sure no space before the comma
        // 4 space indent
        { "Mia",       "Address",        true,  8  },
        { "Elizabeth", "AnotherAddress", false, 10 },
    };

.. _c_macros_horizontal_whitespace:

Macros Horizontal Whitespace
-------------------------------------------------------------------------------
.. code-block:: c

    // Align \'s in macro definitions like this, increasing readability
    #define __KHASH_TYPE(name, khkey_st, khval_st) \
        typedef struct                             \
        {                                          \
            khint_st    m_buckets;  /* comments */ \
            khint_st    m_size;     /* comments */ \
            khint_st    m_occupied;                \
            khint_st    m_upper_bound;             \
            khint32_st *m_flags;    /* comments */ \
            khkey_st   *m_keys;                    \
            khval_st   *m_vals;                    \
	    } kh_##name##_st;
	    
    // VS.

    #define __KHASH_TYPE(name, khkey_st, khval_st) \
        typedef struct \
        { \
            khint_st    m_buckets; \
            khint_st    m_size; \
            khint_st    m_occupied; \
            khint_st    m_upper_bound; \
            khint32_st *m_flags; \
            khkey_st   *m_keys; \
            khval_st   *m_vals; \
	    } kh_##name##_st;

    // for readability, this is also make sense
    #define A_MACRO         something
    #define ANOTHER_MACRO   another_thing
    #define YET_ALSO_MACRO  yet_also_something

    // if it is to long to fit one line, breaking up like this
    #define A_VERY_LONG_MACRO_NAME \
        a_good_idea_to_have_this_macro_so_long

.. tip::

    Feel free to insert extra parentheses or braces judiciously
    
    - Maybe it is necessarily to make sure the code work correctly
    - Maybe it will very helpful in increasing readability

.. warning::

    If you can avoid using macros, just do not use them.

.. _c_vertical_whitespace:

Vertical Whitespace
-------------------------------------------------------------------------------
- Minimize use of vertical whitespace.
- Do not end functions with blank lines.
- Do not start functions with blank lines.
- Do not use blank lines when you do not have to.
- Do not put more than one or two blank lines between functions.
- Blank lines inside a chain of if-else blocks may well help readability.
- Blank lines at the beginning or end of a function very rarely help readability.

.. tip::

    The more code that fits on one screen, the easier it is to follow and
    understand the control flow of the program. Of course, readability can suffer from code being
    too dense as well as too spread out, so use your judgment. But in general, minimize use of
    vertical whitespace.


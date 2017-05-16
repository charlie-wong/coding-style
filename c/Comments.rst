Comments
===============================================================================
Though a pain to write, comments are absolutely vital to keeping our code readable.
The following rules describe what you should comment and where.

If we make a step further, just do little work while writing comments, then we can use the
doc-tools out there to automatically generating perfect documentation.
Here we use the well known documentation tool `Doxygen <http://www.doxygen.nl/>`_.

When writing comments, write for your audience:
the next contributor who will need to understand your code.

Be generous - the next one may be you!

.. tip::

    - While comments are very important, the best code is self-documenting.
      Giving sensible names to types and variables is much better than using obscure names that
      you must then explain through comments.
    - do not abuse comments.
      Comments are good, but there is also a danger of over-comment. NEVER try to explain **HOW**
      your code works in a comment: it’s much better to write the code so that the working is
      obvious, and it’s a waste of time to explain badly written code.

.. _c_comment_style:

Comment Style
-------------------------------------------------------------------------------
Prefer using the ``//`` style syntax only, much more easier to type.

.. code-block:: c

    // This is a comment spanning
    // multiple lines
    func();

.. tip::

    - Use either the // or /* \*/ syntax, as long as you are consistent.
    - ``//`` style syntax is not for extracting comments, use ``///`` syntax if you want to do that.

.. _c_file_comments:

File Comments
-------------------------------------------------------------------------------
Every file should have a comment at the top describing its contents. For example:

.. code-block:: c

    /// @file
    /// A brief description of this file.
    ///
    /// A longer description of this file.
    /// Be very generous here.


Generally speaking:

- Comments in ``.h`` file will describe the variables and functions that are declared in the
  file with an overview of what they are for and how they are used.
- Comments in ``.c`` file should contain more information about implementation details or
  discussions of tricky algorithms. If you feel the implementation details or a discussion of
  the algorithms would be useful for someone reading the ``.h``, feel free to put it there
  instead, but mention in the ``.c`` that the documentation is in the ``.h`` file.

.. warning::

    Do not duplicate comments in both the ``.h`` and the ``.c``. Duplicated comments diverge.

.. _c_structured_data_comments:

Structured Data Comments
-------------------------------------------------------------------------------
Every ``struct``, ``enum`` and ``union`` definition should have accompanying comments that describes
what it is for and how it should be used.

If the field comments are short, you can put them next to the field, for example:

.. code-block:: c

    /// Structure used for growing arrays.
    ///
    /// This is used to store information that only grows, and deleted all at once,
    /// and needs to be accessed by index. Also see @ref ga_clear() and @ref ga_grow().
    typedef struct growarray
    {
       	int   m_ga_size;       ///< current number of items used
       	int   m_ga_maxsize;    ///< maximum number of items possible
       	int   m_ga_itemsize;   ///< sizeof(item)
       	int   m_ga_growsize;   ///< number of items to grow each time
       	void *m_ga_data;       ///< pointer to the first item
    }garray_st;

If the field comments are long, you can put them previous to the field, for example:

.. code-block:: c

    /// ...
    typedef struct growarray
    {
        /// current number of items used
        int   m_ga_size;
        /// maximum number of items possible
        int   m_ga_maxsize;
        /// sizeof(item), item size in bytes
        int   m_ga_itemsize;
        /// number of items to grow each time
        int   m_ga_growsize;
        /// pointer to the first item
        void *m_ga_data;
    }garray_st;

.. _c_function_declaration_comments:

Function Declarations Comments
-------------------------------------------------------------------------------
Comments at the declaration of a function describe the **usage** of the function.
Every function declaration should have comments immediately preceding it that describe what the
function does and how to use it. In general, these comments do not describe how the function
performs its task which should be left to comments in the function definition.

Types of things to mention in comments at the function declaration:

    - Whether the function allocates memory that the caller must free.
    - Whether any of the arguments can be a null pointer.
    - Whether there are any performance implications of how a function is used.
    - Whether the function is re-entrant.
    - What are its synchronization assumptions.

.. code-block:: c

    /// Brief description of the function.
    ///
    /// Detailed description.
    /// May span multiple paragraphs.
    ///
    /// @param[in] arg1 Description of arg1
    /// @param[in] arg2 Description of arg2. May span
    ///                 multiple lines.
    ///
    /// @return Description of the return value.
    iterator_st *get_iterator(void *arg1, void *arg2);

.. _c_function_definition_comments:

Function Definition Comments
-------------------------------------------------------------------------------
Comments at the definition of a function describe **operation** of the function.
If there is anything tricky about how a function does its job, the function definition should have
an explanatory comment. For example, in the definition comment you might describe any coding tricks
you use, give an overview of the steps you go through, or explain why you chose to implement the
function in the way you did rather than using a viable alternative. For instance, you might mention
why it must acquire a lock for the first half of the function but why it is not needed for the
second half.

.. code-block:: c

    // Note that do not use Doxygen comments here. They are not for Doxygen.
    iterator_st *get_iterator(void *arg1, void *arg2)
    {
    ...
    }

.. note::

    Do not just repeat the comments given with the function declaration, in the ``.h`` file or
    wherever. It's okay to recapitulate briefly what the function does, but the focus of the
    comments should be on how it does it.

.. _c_variable_comments:

Variable Comments
-------------------------------------------------------------------------------
In general the actual name of the variable should be descriptive enough to give a good idea of what
the variable is used for. In certain cases, more comments are required.

.. code-block:: c

    /// The total number of tests cases that we run through in this regression test.
    const int g_test_cases_num = 6;

- All global variables should have comments describing what they are and what they are used for.

.. _c_implementation_comments:

Implementation Comments
-------------------------------------------------------------------------------
In your implementation, you should have comments in tricky, non-obvious, interesting, or important
parts of your code.

**Explanatory Comments**:
tricky or complicated code blocks should have comments before them.

.. code-block:: c

    // Divide result by two, taking into account that x contains the carry from the add.
    for(int i = 0; i < result->m_size; i++)
    {
        x = (x << 8) + (*result)[i];
        (*result)[i] = x >> 1;
        x &= 1;
    }

**Line Comments**:
lines that are non-obvious should get a comment at the end of the line. These end-of-line comments
should be separated from the code using spaces.

.. code-block:: c

    // If we have enough memory, mmap the data portion too.
    mmap_budget = max<int64>(0, mmap_budget - index->m_length);
    if(mmap_budget >= data_size && !map_data(mmap_chunk_bytes, mlock))
    {
        return;  // Error already logged.
    }


**Line Up Comments**:
if you have several comments on subsequent lines, it can often be more readable to line them up:

.. code-block:: c

    do_something();                      // Comment here so the comments line up.
    do_something_else_that_is_longer();  // Comment here so there are two spaces between
                                         // the code and the comment.
    {
        do_something_else();             // Comment here so the comments line up.
    }

**No Magic Arguments**:
when you pass in a null pointer, boolean, or literal integer values to functions, you should
consider adding a comment about what they are, or make your code self-documenting by using
constants. For example, compare:

.. code-block:: c

    bool success = calculate_something(interesting_value,
                                       10,     // What is this ?
                                       false,  // What is this ?
                                       NULL);  // What is this ?

versus:

.. code-block:: c

    bool success = calculate_something(interesting_value,
                                       10,     // Default base value.
                                       false,  // Not the first time we're calling this.
                                       NULL);  // No callback.

Or alternatively, constants or self-describing variables:

.. code-block:: c

    // line them up make more readable, both definition and comments
    const int    default_base_value = 10;     // Default base value.
    const bool   first_time_calling = false;  // Not the first time calling this.
    callback_ft  null_callback = NULL;        // No callback
    
    bool success = calculate_something(interesting_value,
                                       default_base_value,
                                       first_time_calling,
                                       null_callback);
.. tip::

    - Never describe the code itself, just assume the reader knows C better than you.
    - Never abuse comment, do not state the obvious.
    - Provide higher level comments that describe why the code does what it does.

.. _c_punctuation_pelling_grammar:

Punctuation, Spelling and Grammar
-------------------------------------------------------------------------------
Pay attention to punctuation, spelling, and grammar. It is easier to read well-written comments than
badly written ones.

Comments should be as readable as narrative text, with proper capitalization and punctuation.
In many cases, complete sentences are more readable than sentence fragments. Shorter comments, such
as comments at the end of a line of code, can sometimes be less formal, but you should be consistent
with your style.

Although it can be frustrating to have a code reviewer point out that you are using a comma when you
should be using a semicolon, it is very important that source code maintain a high level of clarity
and readability. Proper punctuation, spelling, and grammar help with that goal.

.. _c_todo_comments:

TODO Comments
-------------------------------------------------------------------------------
Use TODO comment for code that is temporary, short-term solution, or good-enough but not perfect.

TODO comment should include the string **TODO** or **todo**, followed by the name, e-mail address,
bug ID, or other identifier(person or issue), which can provide best context about the problem
referenced by the TODO  Comment. The main purpose is to have a consistent TODO comment format that
can be searched to find out how to get more details upon request. A TODO comment is not a commitment
that the person referenced will fix the problem. Thus when you create a TODO comment with a name,
it is almost always your name that is given.

.. code-block:: c

    /// @todo (kl@gmail.com): Use a "*" here for concatenation operator.
    /// @todo (Zeke): change this to use relations.
    /// @todo (bug 12345): remove the "Last visitors" feature.
    
    //  TODO (kl@gmail.com): Use a "*" here for concatenation operator.
    //  TODO (Zeke): change this to use relations.
    //  TODO (bug 12345): remove the "Last visitors" feature.

.. _c_deprecation_comments:

Deprecation Comments
-------------------------------------------------------------------------------
Use Deprecation Comment for the interface API that is deprecated.

You can mark an interface as deprecated by writing a comment containing the word **DEPRECATED** or
**deprecated**, followed by your name, e-mail address, or other identifier in parentheses.
The comment goes either before the declaration of the interface or on the same line as the
declaration.

A deprecation comment must include simple, clear directions for people to fix their callsites.
In C, you can implement a deprecated function as an inline function that calls the new
interface point.

Marking an interface point deprecated will not magically cause any callsites to change. If you want
people to actually stop using the deprecated facility, you will have to fix the callsites yourself
or recruit a crew to help you.

New code should not contain calls to deprecated interface points. Use the new interface point
instead. If you cannot understand the directions, find the person who created the deprecation
and ask them for help using the new interface point.

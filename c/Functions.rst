Functions
===============================================================================

.. _c_parameter_ordering:

Parameter Ordering
-------------------------------------------------------------------------------
When defining a function, parameter order is: ``inputs``, then ``outputs``.

Parameters to C functions are either input to the function, output from the function, or both.
Input parameters are usually values or const pointers, while output and input/output parameters will
be pointers to non-const. When ordering function parameters, put all input-only parameters before
any output parameters. In particular, do not add new parameters to the end of the function just
because they are new; place new input-only parameters before the output parameters.

This is not a hard-and-fast rule. Parameters that are both input and output muddy the waters, and,
as always, consistency with related functions may require you to bend the rule.

.. _c_write_short_functions:

Write Short Functions
-------------------------------------------------------------------------------
Prefer small and focused functions, it is more readable and more manageable.

We recognize that long functions are sometimes appropriate, so no hard limit is placed on functions
length. If a function exceeds about 40 lines, think about whether it can be broken up without
harming the structure of the program.

Another measure of the function is the number of local variables. They shouldn’t exceed 5-10.
If not, then re-think the function, and split it into smaller pieces. A human brain can generally
easily keep track of about 7 different things, anything more and it gets confused. You know you’re
brilliant, but maybe you’d like to understand what you did 2 weeks from now.

Even if your long function works perfectly now, someone modifying it in a few months may add new
behavior. This could result in bugs that are hard to find. Keeping your functions short and simple
makes it easier for other people to read and modify your code.

You could find long and complicated functions when working with some code. Do not be intimidated by
modifying existing code: if working with such a function proves to be difficult, you find that
errors are hard to debug, or you want to use a piece of it in several different contexts, consider
breaking up the function into smaller and more manageable pieces.

.. _c_static_functions:

Static Functions
-------------------------------------------------------------------------------
When functions defined in a ``.c`` file, and will never be used outside of that file, then just
declare them as ``static``.

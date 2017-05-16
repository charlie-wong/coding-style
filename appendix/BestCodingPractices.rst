.. _appendix_best_coding_practices:

Best Coding Practices
===============================================================================

.. _appendix_usage_of_layering:

Usage of Layering
-------------------------------------------------------------------------------
Layering is the primary technique for reducing complexity in a system. A system should be divided
into layers. Layers should communicate between adjacent layers using well defined interfaces. When
a layer uses a non-adjacent layer then a layering violation has occurred.

A layering violation simply means we have dependency between layers that is not controlled by a well
defined interface. When one of the layers changes code could break. We don't want code to break so
we want layers to work only with other adjacent layers.

Sometimes we need to jump layers for performance reasons. This is fine, but we should know what we
are doing and document it appropriately.

.. _appendix_coding_tips:

Coding Tips
-------------------------------------------------------------------------------
.. code-block:: c

    // this is better
    if(f())
    {
        do_some_thing();
    }
    
    // this is not good
    if(FAIL != f())
    {
        do_other_thing();
        ...
    }

- Usually Avoid Embedded Assignments

.. code-block:: c

    d = (a = b + c) + r; // do you realy need to do it like this?
    a = b + c;
    d = a + r;           // This will be good and clear enough

    // there is no other way, and this is good enough
    while(EOF != (c = getchar()))
    {
        do_some_thing();
    }

.. _appendix_miscellaneous:

Miscellaneous
-------------------------------------------------------------------------------
- No **magic** numbers, use ``enum``, ``const`` or macros.
- Notice the difference of ``#if XX``, ``#ifdef XX`` and ``#if defined(XX)``.
- The easiest way commenting out large code blocks is using ``#if 0``.
- Don't use floating-point variables where discrete values are needed.
- Using a float for a loop counter is a great way to shoot yourself in the foot.
- Always test floating-point numbers as ``<=`` or ``>=``, never use an exact comparison ``==`` or ``!=``.

Background
===============================================================================
As every C++ programmer knows, the language has many powerful features, but this
power brings with it complexity, which in turn can make code more bug-prone and
harder to read and maintain.

The goal of this guide is to manage this complexity by describing in detail the
dos and don'ts of writing C++ code. These rules exist to keep the code base
manageable while still allowing coders to use C++ language features productively.
And if you following the `C part <../c/index.html>`_, then all will be consistent
when you have to use C in C++, and no collision.

Style, also known as readability, is what called the conventions that govern
the C++ code. The term style is a bit of a misnomer, since these conventions
cover far more than just source formatting.

.. _cpp_versions:

`C++ Version <https://isocpp.org/std/the-standard>`_
===============================================================================
Now, code should target ``C++11``, should not use ``C++14`` or ``C++17``
features. The C++ version targeted will advance aggressively over time.

``C++ 11`` was published as
`ISO/IEC 14882:2011 <http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=50372>`_
in September 2011 and is available for a fee. The working draft most similar to
the published C++11 standard is `N3337 <http://www.open-std.org/jtc1/sc22/wg21/docs/papers/2012/n3337.pdf>`_,
dated at 16 January 2012 and it has only editorial corrections from the C++11 standard.

Code should avoid features that have been removed from the latest language
version ``C++17``, as well as the rare cases where code has a different
meaning in that latest version. Use of some C++ features is restricted or
disallowed.

- [1] The WIP LaTeX source of `C++ 20 <https://github.com/cplusplus/draft>`_
  standard are maintained on GitHub.
- [2] The latest C++ standard is ``C++ 17``, here are the
  `current status <https://isocpp.org/std/status>`_ and
  `working drafts <http://www.open-std.org/jtc1/sc22/wg21/docs/standards>`_.

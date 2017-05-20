.. _appendix_change_log:

`Change Log <https://github.com/olivierlacan/keep-a-changelog>`_
===============================================================================
**What is a change log?**

A change log is a file which contains a curated, chronologically ordered list of notable changes
for each version of a project.

**What is the point of a change log?**

To make it easier for users and contributors to see precisely what notable changes have been made
between each version of the project.

**Why should I care?**

Because software tools are for people. If you don’t care, why are you contributing to open source?
Surely, there must be a kernel of care somewhere in that lovely little brain of yours.


**What should the change-log file be named?**

- ``LICENSE`` is the best convention so far.
- ``README.md`` is the best convention so far.
- ``CHANGELOG.md`` is the best convention so far.
- ``CONTRIBUTING.md`` is the best convention so far.

**What makes a good change log?**

A good `CHANGELOG.md <../CHANGELOG.md>`_ file sticks to the following principles:

- It's made for humans, not machines, so legibility is crucial.
- Easy to link to any section, hence Markdown over plain text.
- One sub-section per version.
- List releases in reverse-chronological order, which is newest on top.
- Write all dates in `YYYY-MM-DD <https://www.iso.org/iso-8601-date-and-time-format.html>`_ format,
  e.g. ``2012-06-02`` for ``June 2nd, 2012``.
- Explicitly mention whether the project follows `Semantic Versioning <http://semver.org/>`_.

For each version in change log should following:

- List its release date in ``YYYY-MM-DD`` format.
- Group changes to describe their impact on the project, as follows:

  - **[Fixed]** for any bug fixes.
  - **[Added]** for new features.
  - **[Removed]** for deprecated features removed in this release.
  - **[Changed]** for changes in existing functionality.
  - **[Security]** to invite users to upgrade in case of vulnerabilities.
  - **[Deprecated]** for once-stable features removed in upcoming releases.

**How can I minimize the effort required?**

Always have an ``Unreleased`` section at the top for keeping track of any changes.

This serves two purposes:

- People can see what changes they might expect in upcoming releases.
- Simplification the release process, change ``Unreleased`` to version and add new ``Unreleased``.


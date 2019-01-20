# Change Log Example
ALL NOTABLE CHANGES WILL BE DOCUMENTED HERE.

- The project version adheres to [semantic versioning](http://semver.org).
- The repo commits adheres to [conventional commits](https://conventionalcommits.org).

## [Unreleased]

### Features
- Version navigation.
- Simplified and Traditional Chinese translations from [@tianshuo](https://github.com/olivierlacan/keep-a-changelog).
- **config:** mutil-language supported.
- **cli:** add format option for report output ([1ecf097](https://github.com/gkide/coding-style/commit/1ecf097)).
- **load:** add formatter option with default value ([b0e63d9](https://github.com/gkide/coding-style/commit/b0e63d9)).

### Security
- Do not keep password locally.

### Fixed
- Fix line ends initialization when no line end has been read.
- Fix boundary conditions and other errors discovered by fuzzing.
- Fix recognition of a uniform class initializer in a base class initialization (#441).
- Fix utf8LengthFromUtf16() calculation being less than the acutal length.([450b2f8](https://github.com/gkide/coding-style/commit/450b2f8))

### Changed
- **Config:** The default language changed to English if not set([450b2de](https://github.com/gkide/coding-style/commit/450b2de)).

### Preview
- **Chinese:** Simplified and Traditional Chinese supporting.

### Deprecated
- **API:** libmake_it_fly()
  * Accidentally, it becomes a public API.
- **API:** get_system_type()
  * Do not use it any more.

- **UI:** command-line arguments
  * The defails descriptions blah, blah, blah ...

### Incompatible
- Drop python 2.7 and 3.4 support

### Dependencies
- Update dependency tkit to v3.5.1.


## 2015-10-06 Release [v0.1.0-rc.0](https://github.com/gkide/coding-style/releases/tag/v0.1.0-rc.0) compare to [v0.0.1](https://github.com/gkide/coding-style/compare/v0.0.1...v0.1.0-rc.0)

### Features
- New added functionality, configurations or features related to the end user.

### Security
- Anything related with vulnerabilities and security.

### Fixed
- Any bug fixes.

### Changed
- Something notable changes related to the end user.

### Preview
- Some thing preview, like new feature working in process but not stable.

### Deprecated
- Something is deprecated, like the API, UI, Configuration, etc.

### Incompatible
- Changes incompatible with previous releases, blah, blah, blah ...

### Dependencies
- Update dependency XXX to v3.5.1 and do releated changes.

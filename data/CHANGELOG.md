# Change Log

- ALL NOTABLE CHANGES WILL BE DOCUMENTED HERE.
- PROJECT VERSIONS ADHERE TO [SEMANTIC VERSIONING](http://semver.org).
- REPOSITORY COMMITS ADHERE TO [CONVENTIONAL COMMITS](https://conventionalcommits.org).


## [Unreleased]
### ☠ Security
- Do not keep password locally.

### ⚠ Deprecated
- **API:** libmake_it_fly()
  * Accidentally, it becomes a public API.
- **API:** get_system_type()
  * Do not use it any more.

- **UI:** command-line arguments
  * The defails descriptions blah, blah, blah ...

### ☣ Incompatible
- Drop python 2.7 and 3.4 support

### ☕ Features
- Version navigation.
- Simplified and Traditional Chinese translations from [@tianshuo](https://github.com/olivierlacan/keep-a-changelog).
- **config:** mutil-language supported.
- **cli:** add format option for report output ([1ecf097](https://github.com/gkide/coding-style/commit/1ecf097)).
- **load:** add formatter option with default value ([b0e63d9](https://github.com/gkide/coding-style/commit/b0e63d9)).

### ☀ Fixed
- Fix line ends initialization when no line end has been read.
- Fix boundary conditions and other errors discovered by fuzzing.
- Fix recognition of a uniform class initializer in a base class initialization (#441).
- Fix utf8LengthFromUtf16() calculation being less than the acutal length.([450b2f8](https://github.com/gkide/coding-style/commit/450b2f8))

### ⛭ Changed
- **Config:** The default language changed to English if not set([450b2de](https://github.com/gkide/coding-style/commit/450b2de)).

### ⚑ Preview
- **Chinese:** Simplified and Traditional Chinese supporting.

### ☂ Dependencies
- Update dependency tkit to v3.5.1.


## 2015-10-06 20:03:10 +0800  Release [v0.1.0-rc.0](https://github.com/gkide/coding-style/releases/tag/v0.1.0-rc.0)

[[☠](#v_Security_201902170357580800)]
[[⚠](#v_Deprecated_201902170357580800)]
[[☣](#v_Incompatible_201902170357580800)]
[[☕](#v_Features_201902170357580800)]
[[☀](#v_Fixed_201902170357580800)]
[[⛭](#v_Changed_201902170357580800)]
[[⚑](#v_Preview_201902170357580800)]
[[☂](#v_Dependencies_201902170357580800)]
comparing with [v0.0.1](https://github.com/gkide/coding-style/compare/v0.0.1...v0.1.0-rc.0)

<span id = "v_Security_201902170357580800"></span>
### ☠ Security
- Anything related with vulnerabilities and security.

<span id = "v_Deprecated_201902170357580800"></span>
### ⚠ Deprecated
- Something is deprecated, like the API, UI, Configuration, etc.

<span id = "v_Incompatible_201902170357580800"></span>
### ☣ Incompatible
- Changes incompatible with previous releases, blah, blah, blah ...

<span id = "v_Features_201902170357580800"></span>
### ☕ Features
- New added functionality, configurations or features related to the end user.

<span id = "v_Fixed_201902170357580800"></span>
### ☀ Fixed
- Any bug fixes.

<span id = "v_Changed_201902170357580800"></span>
### ⛭ Changed
- Something notable changes related to the end user.

<span id = "v_Preview_201902170357580800"></span>
### ⚑ Preview
- Some thing preview, like new feature working in process but not stable.

<span id = "v_Dependencies_201902170357580800"></span>
### ☂ Dependencies
- Update dependency XXX to v3.5.1 and do releated changes.

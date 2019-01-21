# Change Log Example
ALL NOTABLE CHANGES WILL BE DOCUMENTED HERE.

- The project version adheres to [semantic versioning](http://semver.org).
- The repo commits adheres to [conventional commits](https://conventionalcommits.org).

## [Unreleased]

[[☕](#_v_Features)] [[☠](#_v_Security)]
[[⛨](#_v_Fixed)] [[⚒](#_v_Changed)] [[⚑](#_v_Preview)]
[[⚠](#_v_Deprecated)] [[⛔](#_v_Incompatible)] [[☂](#_v_Dependencies)]

<span id = "_v_Features"></span>
### ☕ Features
- Version navigation.
- Simplified and Traditional Chinese translations from [@tianshuo](https://github.com/olivierlacan/keep-a-changelog).
- **config:** mutil-language supported.
- **cli:** add format option for report output ([1ecf097](https://github.com/gkide/coding-style/commit/1ecf097)).
- **load:** add formatter option with default value ([b0e63d9](https://github.com/gkide/coding-style/commit/b0e63d9)).

<span id = "_v_Security"></span>
### ☠ Security
- Do not keep password locally.

<span id = "_v_Fixed"></span>
### ⛨ Fixed
- Fix line ends initialization when no line end has been read.
- Fix boundary conditions and other errors discovered by fuzzing.
- Fix recognition of a uniform class initializer in a base class initialization (#441).
- Fix utf8LengthFromUtf16() calculation being less than the acutal length.([450b2f8](https://github.com/gkide/coding-style/commit/450b2f8))

<span id = "_v_Changed"></span>
### ⚒ Changed
- **Config:** The default language changed to English if not set([450b2de](https://github.com/gkide/coding-style/commit/450b2de)).

<span id = "_v_Preview"></span>
### ⚑ Preview
- **Chinese:** Simplified and Traditional Chinese supporting.

<span id = "_v_Deprecated"></span>
### ⚠ Deprecated
- **API:** libmake_it_fly()
  * Accidentally, it becomes a public API.
- **API:** get_system_type()
  * Do not use it any more.

- **UI:** command-line arguments
  * The defails descriptions blah, blah, blah ...

<span id = "_v_Incompatible"></span>
### ⛔ Incompatible
- Drop python 2.7 and 3.4 support

<span id = "_v_Dependencies"></span>
### ☂ Dependencies
- Update dependency tkit to v3.5.1.


## 2015-10-06 Release [v0.1.0-rc.0](https://github.com/gkide/coding-style/releases/tag/v0.1.0-rc.0) compare to [v0.0.1](https://github.com/gkide/coding-style/compare/v0.0.1...v0.1.0-rc.0)

[[☕](#_v_Features_20151006)] [[☠](#_v_Security_20151006)]
[[⛨](#_v_Fixed_20151006)] [[⚒](#_v_Changed_20151006)] [[⚑](#_v_Preview_20151006)]
[[⚠](#_v_Deprecated_20151006)] [[⛔](#_v_Incompatible_20151006)] [[☂](#_v_Dependencies_20151006)]

<span id = "_v_Features_20151006"></span>
### ☕ Features
- New added functionality, configurations or features related to the end user.

<span id = "_v_Security_20151006"></span>
### ☠ Security
- Anything related with vulnerabilities and security.

<span id = "_v_Fixed_20151006"></span>
### ⛨ Fixed
- Any bug fixes.

<span id = "_v_Changed_20151006"></span>
### ⚒ Changed
- Something notable changes related to the end user.

<span id = "_v_Preview_20151006"></span>
### ⚑ Preview
- Some thing preview, like new feature working in process but not stable.

<span id = "_v_Deprecated_20151006"></span>
### ⚠ Deprecated
- Something is deprecated, like the API, UI, Configuration, etc.

<span id = "_v_Incompatible_20151006"></span>
### ⛔ Incompatible
- Changes incompatible with previous releases, blah, blah, blah ...

<span id = "_v_Dependencies_20151006"></span>
### ☂ Dependencies
- Update dependency XXX to v3.5.1 and do releated changes.

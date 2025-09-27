# monkestation codebase

<<<<<<< HEAD
[![Build Status](https://github.com/monkestation/monkestation2.0/workflows/CI%20Suite/badge.svg)](https://github.com/monkestation/monkestation2.0/actions?query=workflow%3A%22CI+Suite%22)
[![Percentage of issues still open](https://isitmaintained.com/badge/open/monkestation/monkestation2.0.svg)](https://isitmaintained.com/project/monkestation/monkestation2.0 "Percentage of issues still open")
[![Average time to resolve an issue](https://isitmaintained.com/badge/resolution/monkestation/monkestation2.0.svg)](https://isitmaintained.com/project/monkestation/monkestation2.0 "Average time to resolve an issue")
![Coverage](https://img.shields.io/badge/coverage---3%25-red.svg)

[![forthebadge](monkestation/badges/fueled-by-potassium.svg)](https://forthebadge.com) [![resentment](https://forthebadge.com/images/badges/built-with-resentment.svg)](https://www.monkeyuser.com/assets/images/2019/131-bug-free.png) [![resentment](https://forthebadge.com/images/badges/contains-technical-debt.svg)](https://user-images.githubusercontent.com/8171642/50290880-ffef5500-043a-11e9-8270-a2e5b697c86c.png) [![forinfinityandbyond](https://user-images.githubusercontent.com/5211576/29499758-4efff304-85e6-11e7-8267-62919c3688a9.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a)

| Website              | Link                                                                                               |
| -------------------- | -------------------------------------------------------------------------------------------------- |
| Website              | [https://monkestation.com/](https://monkestation.com/)                                             |
| Code                 | [https://github.com/Monkestation/Monkestation2.0](https://github.com/Monkestation/Monkestation2.0) |
| Wiki                 | [https://wiki.monkestation.com/](https://wiki.monkestation.com/)                                   |
| Codedocs             | [https://codedocs.tgstation13.org/](https://codedocs.tgstation13.org/)                             |
| monkestation Discord | [https://discord.com/invite/monkestation](https://discord.com/invite/monkestation)                 |
=======
[![Build Status](https://github.com/tgstation/tgstation/workflows/CI%20Suite/badge.svg)](https://github.com/tgstation/tgstation/actions?query=workflow%3A%22CI+Suite%22)
[![Percentage of issues still open](https://isitmaintained.com/badge/open/tgstation/tgstation.svg)](https://isitmaintained.com/project/tgstation/tgstation "Percentage of issues still open")
[![Average time to resolve an issue](https://isitmaintained.com/badge/resolution/tgstation/tgstation.svg)](https://isitmaintained.com/project/tgstation/tgstation "Average time to resolve an issue")
![Coverage](https://img.shields.io/badge/coverage---4%25-red.svg)

[![resentment](.github/images/badges/built-with-resentment.svg)](.github/images/comics/131-bug-free.png) [![technical debt](.github/images/badges/contains-technical-debt.svg)](.github/images/comics/106-tech-debt-modified.png) [![forinfinityandbyond](.github/images/badges/made-in-byond.gif)](https://www.reddit.com/r/SS13/comments/5oplxp/what_is_the_main_problem_with_byond_as_an_engine/dclbu1a)

| Website                   | Link                                           |
|---------------------------|------------------------------------------------|
| Website                   | [https://www.tgstation13.org](https://www.tgstation13.org)          |
| Code                      | [https://github.com/tgstation/tgstation](https://github.com/tgstation/tgstation)    |
| Wiki                      | [https://tgstation13.org/wiki/Main_Page](https://tgstation13.org/wiki/Main_Page)   |
| Codedocs                  | [https://codedocs.tgstation13.org/](https://codedocs.tgstation13.org/)       |
| /tg/station Discord       | [https://tgstation13.org/phpBB/viewforum.php?f=60](https://tgstation13.org/phpBB/viewforum.php?f=60) |
| Coderbus Discord          | [https://discord.gg/Vh8TJp9](https://discord.gg/Vh8TJp9)               |
>>>>>>> tg-pr-88929

This is the codebase for the monkestation-flavored fork of Space Station 13.

Space Station 13 is a paranoia-laden, round-based roleplaying game set against the backdrop of a nonsensical, metal death trap masquerading as a space station, with charming spritework designed to represent the sci-fi setting and its dangerous undertones. Have fun, and survive!

*All github inquiries (such as moderation actions) may be handled via the /tg/station discord [#coding-general](https://discord.com/channels/326822144233439242/326831214667235328). Simply ping the `@Maintainer` role, following the guide on asking questions located in the channel description, with your issue!*

## DOWNLOADING

[Downloading](.github/guides/DOWNLOADING.md)

[Running a server](.github/guides/RUNNING_A_SERVER.md)

[Maps and Away Missions](.github/guides/MAPS_AND_AWAY_MISSIONS.md)

<<<<<<< HEAD
## :exclamation: How to compile :exclamation:

On **2021-01-04** we changed the way to compile the codebase.
=======
## Compilation
>>>>>>> tg-pr-88929

**The quick way**. Find `bin/server.cmd` in this folder and double-click it to automatically build and host the server on port 1337.

**The long way**. Find `bin/build.cmd` in this folder, and double-click it to initiate the build. It consists of multiple steps and might take around 1-5 minutes to compile. If it closes, it means it has finished its job. You can then [setup the server](.github/guides/RUNNING_A_SERVER.md) normally by opening `tgstation.dmb` in DreamDaemon.

**Building tgstation in DreamMaker directly is deprecated and might produce errors**, such as `'tgui.bundle.js': cannot find file`.

**[How to compile in VSCode and other build options](tools/build/README.md).**

<<<<<<< HEAD
## Contributors

[Guides for Contributors](.github/CONTRIBUTING.md)
=======
## Getting started
>>>>>>> tg-pr-88929

For contribution guidelines refer to the [Guides for Contributors](.github/CONTRIBUTING.md).

For getting started (dev env, compilation) see the HackMD document [here](https://hackmd.io/@tgstation/HJ8OdjNBc#tgstation-Development-Guide).

For overall design documentation see [HackMD](https://hackmd.io/@tgstation).

For lore, [see Common Core](https://github.com/tgstation/common_core).

[Coding guidelines](https://hackmd.io/@MonkestationPooba/code_guidelines) - How and how not to code for Monkestation

## LICENSE

[![license-badge](https://www.gnu.org/graphics/agplv3-155x51.png)](https://www.gnu.org/licenses/agpl-3.0.html)

All code after [commit 333c566b88108de218d882840e61928a9b759d8f on 2014-12-31 at 16:38 PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU AGPL v3](https://www.gnu.org/licenses/agpl-3.0.html).

---

[![license-badge](https://www.gnu.org/graphics/gplv3-127x51.png)](https://www.gnu.org/licenses/gpl-3.0.html)

All code before [commit 333c566b88108de218d882840e61928a9b759d8f on 2014-12-31 at 16:38 PST](https://github.com/tgstation/tgstation/commit/333c566b88108de218d882840e61928a9b759d8f) is licensed under [GNU GPL v3](https://www.gnu.org/licenses/gpl-3.0.html).
(Including tools unless their readme specifies otherwise.)

See [LICENSE](LICENSE) and [GPLv3.txt](GPLv3.txt) for more details.

---

[![forthebadge](https://forthebadge.com/images/badges/license-mit.svg)](https://forthebadge.com)

The TGS DMAPI is licensed as a subproject under the MIT license.

See the footer of [code/\_\_DEFINES/tgs.dm](./code/__DEFINES/tgs.dm) and [code/modules/tgs/LICENSE](./code/modules/tgs/LICENSE) for the MIT license.

---

[![forthebadge](https://forthebadge.com/images/badges/cc-by-sa.svg)](https://forthebadge.com)

All assets, including icons and sound, are under a [Creative Commons 3.0 BY-SA license](https://creativecommons.org/licenses/by-sa/3.0/) unless otherwise indicated.

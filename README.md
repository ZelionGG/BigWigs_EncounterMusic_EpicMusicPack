<!-- Improved compatibility of back to top link: See: https://github.com/othneildrew/Best-README-Template/pull/73 -->
<a name="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![Discord][discord-shield]][discord-url]
[![License][license-shield]][license-url]

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <kbd><img src="https://raw.githubusercontent.com/ZelionGG/BigWigs_EncounterMusic/refs/heads/main/logo.png" alt="BigWigs Encounter Music Logo" width="130" height="130"></kbd>
  <br />
  <h3 align="center">BigWigs Encounter Music: Epic Music Pack</h3>

  <p align="center">
    `BigWigs_EncounterMusic_EpicMusicPack` is a companion addon for `BigWigs_EncounterMusic` that registers epic music tracks into the shared BigWigs Encounter Music track registry.
    <br />
    <br />
    <a href="https://github.com/ZelionGG/BigWigs_EncounterMusic/issues">Report Bug</a>
    ·
    <a href="https://github.com/ZelionGG/BigWigs_EncounterMusic/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a></li>
    <li><a href="#features">Features</a></li>
    <li><a href="#requirements">Requirements</a></li>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#how-it-works">How it works</a></li>
    <li><a href="#custom-track-workflow">Custom track workflow</a></li>
    <li><a href="#music-naming-conventions">Music naming conventions</a></li>
    <li><a href="#architecture">Architecture</a></li>
    <li><a href="#notes-for-development">Notes for development</a></li>
    <li><a href="#troubleshooting">Troubleshooting</a></li>
    <li><a href="#project-structure">Project structure</a></li>
    <li><a href="#rights-and-content-notice">Rights and content notice</a></li>
  </ol>
</details>

## About The Project

This addon is an external music pack for `BigWigs_EncounterMusic`.

It is designed to stay simple and maintainable:

- It registers bundled epic tracks into the shared track registry.
- It supports user-added custom tracks through a generated Lua file.
- It keeps official tracks and custom tracks separated.
- It provides a lightweight Windows generation workflow for contributors and personal pack maintenance.

**DMCA/Content notice:** only include audio you are allowed to distribute or use. You are responsible for the rights to any custom audio added to this pack.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Features

- Registers Epic Music Pack tracks into `BigWigs_EncounterMusic`
- Load-on-demand companion addon
- Auto-generated `CustomTracks.lua` for user tracks
- `GenerateMusicAutoList.bat` launcher for Windows
- `GenerateMusicAutoList.ps1` generator for scanning `Music/custom/`
- Optional `music_overrides.csv` for exact display names
- Optional `artist_map.csv` for artist code mapping

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Requirements

- `BigWigs`
- `BigWigs_EncounterMusic`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Installation

Install the addon into your WoW AddOns folder:

```text
World of Warcraft/_retail_/Interface/AddOns/BigWigs_EncounterMusic_EpicMusicPack
```

Make sure the core addon is also installed:

```text
World of Warcraft/_retail_/Interface/AddOns/BigWigs_EncounterMusic
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## How it works

When this pack loads:

- `CustomTracks.lua` is loaded first
- `Tracks.lua` registers the official Epic Music Pack tracks
- `Tracks.lua` also registers generated custom tracks from `BWGSEMP_CUSTOM_TRACKS`
- all tracks become available in the `BigWigs_EncounterMusic` selector

This addon does not provide its own UI. Configuration happens through the main `BigWigs_EncounterMusic` addon.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Custom track workflow

To add custom tracks:

1. Put your `.mp3` files inside `Music/custom/`
2. Run `GenerateMusicAutoList.bat`
3. Choose whether you want auto-guess enabled
4. If auto-guess is disabled, the script can prompt for `Artist` and `Title`
5. `CustomTracks.lua` is regenerated automatically
6. Launch the game or use `/reload`
7. Select the generated tracks in `BigWigs Encounter Music`

Related files:

- `GenerateMusicAutoList.bat`
- `GenerateMusicAutoList.ps1`
- `CustomTracks.lua`
- `music_overrides.csv`
- `artist_map.csv`
- `MUSIC_ADDING_GUIDE.md`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Music naming conventions

Recommended format:

```text
EMP_<ArtistCodeOrName>_<Title_With_Underscores>.mp3
```

Also supported for better manual prompting and auto parsing:

```text
Artist - Title.mp3
Artist_Name - Title.mp3
```

Notes:

- `music_overrides.csv` takes priority over auto-guess
- `artist_map.csv` is used when parsing artist codes such as `RSM` or `ES`
- for the `Artist - Title` format, artist underscores can be preserved

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Architecture

### Runtime files

- `BigWigs_EncounterMusic_EpicMusicPack.toc`
  - addon metadata
  - dependency declaration
  - load order for `CustomTracks.lua` and `Tracks.lua`
- `Tracks.lua`
  - official bundled tracks
  - registration helper
  - registration of generated custom tracks
- `CustomTracks.lua`
  - generated track table used at load time

### Generation files

- `GenerateMusicAutoList.ps1`
  - scans `Music/custom/`
  - generates `CustomTracks.lua`
  - handles auto-guess, manual prompts, overrides, and artist mapping
- `GenerateMusicAutoList.bat`
  - convenience launcher for Windows
- `music_overrides.csv`
  - exact label overrides by filename key
- `artist_map.csv`
  - mappings for artist codes used by filename parsing

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Notes for development

- Official pack tracks should stay in `Tracks.lua`
- Custom user tracks should live in `Music/custom/`
- `CustomTracks.lua` should be treated as generated output
- If you edit `CustomTracks.lua` manually, the generator may overwrite it
- The pack depends on `BigWigs_EncounterMusic` and should not duplicate core logic from the main addon

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Troubleshooting

### The tracks do not appear in game

Check that:

- `BigWigs_EncounterMusic` is installed and enabled
- `BigWigs_EncounterMusic_EpicMusicPack` is enabled
- the generated `CustomTracks.lua` file exists
- the audio files are present in the expected folder

### Custom tracks are missing

Check that:

- your files are in `Music/custom/`
- you ran `GenerateMusicAutoList.bat`
- your filenames match the expected conventions
- your `music_overrides.csv` keys match the filename without extension

### A track name is wrong

Check that:

- `music_overrides.csv` contains the correct key and label
- `artist_map.csv` contains the expected code mapping
- your filename uses either `EMP_<Code>_<Title>` or `Artist - Title`

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Project structure

```text
BigWigs_EncounterMusic_EpicMusicPack/
  BigWigs_EncounterMusic_EpicMusicPack.toc
  Tracks.lua
  CustomTracks.lua
  GenerateMusicAutoList.bat
  GenerateMusicAutoList.ps1
  MUSIC_ADDING_GUIDE.md
  artist_map.csv
  music_overrides.csv
  Music/
    custom/
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Rights and content notice

Only use music you are legally allowed to include.

This addon is not affiliated with, endorsed by, or officially maintained by the BigWigs team.

All rights related to BigWigs, including its name, branding, and associated assets, belong to their respective owners.

If you distribute this pack publicly:

- verify the license of every bundled track
- keep attribution when required
- do not assume that user-added music is safe to redistribute

<p align="right">(<a href="#readme-top">back to top</a>)</p>

[contributors-shield]: https://img.shields.io/github/contributors/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack.svg?style=for-the-badge
[contributors-url]: https://github.com/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack.svg?style=for-the-badge
[forks-url]: https://github.com/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack/network/members
[stars-shield]: https://img.shields.io/github/stars/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack.svg?style=for-the-badge
[stars-url]: https://github.com/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack/stargazers
[issues-shield]: https://img.shields.io/github/issues/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack.svg?style=for-the-badge
[issues-url]: https://github.com/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack/issues
[discord-shield]: https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white
[discord-url]: https://discord.gg/g7JZNGSU32
[license-shield]: https://img.shields.io/github/license/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack.svg?style=for-the-badge
[license-url]: https://github.com/ZelionGG/BigWigs_EncounterMusic_EpicMusicPack/blob/main/LICENSE

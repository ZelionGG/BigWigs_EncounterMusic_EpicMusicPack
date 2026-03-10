# Music Adding Guide (BigWigs_EncounterMusic_EpicMusicPack)

This guide explains how to add custom music tracks to `BigWigs_EncounterMusic_EpicMusicPack` and generate the custom track list automatically.

## Important files

- `Music/custom/` — Put your `.mp3` files here.
- `GenerateMusicAutoList.bat` — Windows launcher for the generator.
- `GenerateMusicAutoList.ps1` — PowerShell generator that scans `Music/custom/`.
- `CustomTracks.lua` — Auto-generated Lua file loaded by the addon.
- `music_overrides.csv` — Optional file to force exact display labels.
- `artist_map.csv` — Optional artist code mapping used by auto-guess.

## Quick steps

1. Put your `.mp3` files in `BigWigs_EncounterMusic_EpicMusicPack/Music/custom/`.
2. Run `GenerateMusicAutoList.bat`.
3. Answer whether you want auto-guess enabled.
4. If you answer `No`, the script can ask you for the artist and title manually for each track.
5. The script generates or updates `CustomTracks.lua`.
6. Launch the game or `/reload`.
7. Open BigWigs Encounter Music and select your new tracks.

## Recommended file naming format

```text
EMP_<ArtistCodeOrName>_<Title_With_Underscores>.mp3
```

Examples:
- `EMP_RSM_ThunderFist.mp3` -> `EMP - Really Slow Motion - Thunder Fist`
- `EMP_Onlap_CrawlingInTheDark.mp3` -> `EMP - Onlap - CrawlingInTheDark`

## Auto-guess behavior

- If enabled, the script tries to parse `EMP_<ArtistCode>_<Title>`.
- It maps known artist codes using `artist_map.csv` when available.
- If disabled, the script offers manual prompts for artist/title on each track.
- Manual prompts prefill `Artist` and `Title` with auto-guessed values when available.
- If you skip manual entry, it falls back to a readable label generated from the filename.

## Overrides

Use `music_overrides.csv` if you want an exact display label.

Format:

```text
KEY,Display Label
```

Example:

```text
EMP_Onlap_CrawlingInTheDark,EMP - Onlap - Crawling In The Dark
```

Overrides take priority over auto-guess.

## Generated file

`CustomTracks.lua` contains a table named `BWGSEMP_CUSTOM_TRACKS`.

It is loaded before `Tracks.lua`, and `Tracks.lua` registers the generated custom tracks automatically.

Do not edit `CustomTracks.lua` manually unless you know it will be overwritten by the generator.

## Official vs custom tracks

- Official pack tracks stay declared in `Tracks.lua`.
- Custom user tracks live in `Music/custom/` and are generated into `CustomTracks.lua`.

## Rights and content notice

Only add music you are allowed to use. You are responsible for the rights to any custom audio you include in your pack.

local api = rawget(_G, "BigWigsEncounterMusicAPI")
if type(api) ~= "table" or type(api.RegisterTrack) ~= "function" then
	return
end

local basePath = "Interface\\AddOns\\BigWigs_EncounterMusic_EpicMusicPack\\Music\\"
local customPath = "Interface\\AddOns\\BigWigs_EncounterMusic_EpicMusicPack\\Music\\custom\\"

local function registerTracks(trackList, pathPrefix)
	if type(trackList) ~= "table" then
		return
	end

	for i = 1, #trackList do
		local track = trackList[i]
		api.RegisterTrack(track.id, {
			name = track.name,
			path = pathPrefix .. track.file,
			source = "BigWigs_EncounterMusic_EpicMusicPack",
			channel = track.channel or "Music",
		})
	end
end

local tracks = {
	{
		id = "epic_quantum_sonata",
		name = "EMP - FormantX - Quantum Sonata",
		file = "EMP_ES_QuantumSonata.mp3",
	},
	{
		id = "epic_alec_koff_epic_fight",
		name = "EMP - Alec_Koff - Epic Fight",
		file = "EMP_AKOFF_EpicFight.mp3",
	},
}

registerTracks(tracks, basePath)
registerTracks(rawget(_G, "BWGSEMP_CUSTOM_TRACKS"), customPath)

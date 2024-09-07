{
	home.file.".config/waylyrics/config.toml" = {
		text = ''
# the interval waylyrics updates position/metadata from player
player-sync-interval = "2s"

# the interval waylyrics refreshes lyric labels
lyric-update-interval = "20ms"

# waylyrics matches lyrics with `weights`
# if `(length-lyric_len).abs() < length_toleration`,
# waylyrics set it's weight as zero, mark it a best choice
length-toleration = "2s"

# whether to cache lyrics
# note: persistenced lyric offset depends on this
cache-lyrics = true

# theme to load (<name>.css)
theme = "trans"

# if enabled, lyrics match one or more `filter_regex` will be hidden
enable-filter-regex = false

# if enabled, when waylyrics find `xesam:url`
# starts with `file://` and no any other hint was matched,
# waylyrics will try to read the `.lrc` file has same filename
enable-local-lyric = true

# hide lyric if it matches any of these regexies
# inspired by LyricX's filter list
filter-regexies = ["^作词", "^作詞", "^作曲", "^編曲", "^编曲", "^収録", "^收录", "^演唱", "^歌手", "^歌曲", "^制作", "^製作", "^歌词", "^歌詞", "^翻譯", "^翻译", "^插曲", "^插入歌", "^主题歌", "^主題歌", "^片頭曲", "^片头曲", "^片尾曲", "^SoundTrack", "^アニメ"]

# avaliable options: 网易云音乐, QQ音乐
lyric-search-source = ["网易云音乐"]

# if enabled, waylyrics will set `DEFAULT_TEXT` on idle,
# otherwise it just show nothing
show-default-text-on-idle = false

# if enabled, waylyrics will show lyric on `Pause`
show-lyric-on-pause = false

# whether to run tray-icon service
show-tray-icon = true

# player with these name will be ignored
player-name-blacklist = ["firefox"]

# player with these identity will be ignored
player-identity-blacklist = []

[triggers]
# shortcuts when focusing on waylyrics
# for global ones, please install the `.desktop` file
# also check trigger format at https://docs.gtk.org/gtk4/ctor.ShortcutTrigger.parse_string.html
switch_decoration = "<Control>d"
reload_theme = "<Control><Shift>t"
search_lyric = "<Control>s"
refetch_lyric = "<Alt><Shift>l"
switch_passthrough = "<Alt>p"
		'';
	};
}

config.load_autoconfig()

c.url.start_pages = ["https://search.brave.com"]
c.url.default_page = "https://search.brave.com"
c.url.searchengines = { 'DEFAULT': 'https://search.brave.com/search?q={}&source=desktop',
                        'p' :'https://search.brave.com/goggles?q={}&goggles_id=https%253A%252F%252Fgist.githubusercontent.com%252FDAFF0D11%252F48d42a4ee055b39bf453fd8dfe785e6a%252Fraw&nav=site',
                        'v' :'https://vid.puffyan.us/search?q={}',
                        'e': 'https://www.ebay.com/sch/i.html?_nkw={}'
                       }

c.content.user_stylesheets = ['~/.config/qutebrowser/css/global.css']

c.content.geolocation = False
c.content.media.audio_video_capture = False
c.content.media.audio_capture = False
c.content.media.video_capture = False
c.content.notifications.enabled = False
c.content.javascript.can_access_clipboard = False
c.content.javascript.enabled = False
c.content.cookies.accept = 'never'

# Privacy Settings
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")

config.set('content.cookies.accept', 'no-3rdparty', 'https://search.brave.com/*')
config.set('content.cookies.accept', 'no-3rdparty', 'http://127.0.0.1:8384/*') # Syncthing
config.set('content.cookies.accept', 'no-3rdparty', 'https://libreddit.spike.codes/*')
config.set('content.cookies.accept', 'no-3rdparty', 'https://vid.puffyan.us/*')
config.set('content.cookies.accept', 'no-3rdparty', 'https://github.com/*')
config.set('content.cookies.accept', 'no-3rdparty', 'https://gitlab.com/*')
config.set('content.cookies.accept', 'all', 'https://imgur.com/*')
config.set('content.cookies.accept', 'all', 'https://mailbox.org/*')
config.set('content.cookies.accept', 'all', 'https://libredd.it/*')
config.set('content.cookies.accept', 'all', 'https://wallhaven.cc/*')
config.set('content.cookies.accept', 'all', 'https://office.mailbox.org/*')
config.set('content.cookies.accept', 'all', 'https://meta.sr.ht/register/*')
config.set('content.cookies.accept', 'all', 'https://word.tips/word-generator/*')

c.window.title_format = '{perc}{current_title}'
# c.fonts.default_family = ["Monospace"]
c.fonts.default_family = ["Fira Code"]
# c.fonts.default_family = ["Terminus"]
c.fonts.default_size = "11pt"
c.zoom.default = "110%"
# config.set("statusbar.show","never")
# c.content.blocking.whitelist = ['thepiratebay.org']
c.editor.command = ['emacsclient', '-e', '(find-file "{file}")', '-e', '(goto-line {line})', '-e', '(move-to-column {column0})']

# Unbound keys
config.unbind('f', mode='normal')
config.unbind('d', mode='normal')
# config.unbind('<Ctrl-[>' 'fake-key <Escape>', mode='normal')

# Background white
config.bind('<F12>', 'config-cycle -p -t colors.webpage.bg white black')

# Navigation
config.bind('<Ctrl-j>', 'tab-prev', mode='normal')
config.bind('<Ctrl-j>', 'tab-prev', mode='insert')
config.bind('<Ctrl-k>', 'tab-next', mode='normal')
config.bind('<Ctrl-k>', 'tab-next', mode='insert')

## Vertical Tabs
# config.bind('<Ctrl-k>', 'tab-prev', mode='normal')
# config.bind('<Ctrl-k>', 'tab-prev', mode='insert')
# config.bind('<Ctrl-j>', 'tab-next', mode='normal')
# config.bind('<Ctrl-j>', 'tab-next', mode='insert')

config.bind('<Ctrl-e>', 'tab-focus last', mode='normal')

config.bind('<Ctrl-,>', 'tab-move -', mode='normal')
config.bind('<Ctrl-.>', 'tab-move +', mode='normal')
config.bind('<Ctrl-j>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-k>', 'completion-item-focus prev', mode='command')
config.bind('s', 'scroll-page 0 0.5', mode='normal')
config.bind('t', 'scroll-page 0 -0.5', mode='normal')
# config.bind('s', 'fake-key <PageDown>', mode='normal')
# config.bind('t', 'fake-key <PageUp>', mode='normal')

# config.bind('<Ctrl-j>', 'tab-prev', mode='normal')

config.bind('<Ctrl-[>', 'back')
config.bind('<Ctrl-]>', 'forward')


# Readline
config.bind('<Ctrl-j>', 'fake-key <Down>', mode='insert')
config.bind('<Ctrl-k>', 'fake-key <Up>', mode='insert')
# config.bind("<Ctrl-k>", "fake-key <Shift-End><Delete>", "insert")
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")

config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")
# config.bind("<Ctrl-x><Ctrl-e>", "open-editor", "insert")
# config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "command")
# alt-hjkl
config.bind("<Mod1-h>", "fake-key <Left>", "insert")
config.bind("<Mod1-j>", "fake-key <Down>", "insert")
config.bind("<Mod1-k>", "fake-key <Up>", "insert")
config.bind("<Mod1-l>", "fake-key <Right>", "insert")

# Open links
config.bind(';', 'hint links', mode='normal') # link current ;
config.bind('\'', 'hint links tab-fg', mode='normal') # link new tab \'
config.bind('"', 'hint links tab-bg', mode='normal') # link new tab background "

# Utility
config.bind('<Ctrl-p>', 'tab-pin;;tab-move', mode='normal')
config.bind('D', 'bookmark-del', mode='normal')
config.bind('<space>e', 'set-cmd-text :open {url:pretty}', mode='normal')
config.bind('<Ctrl-l>', 'set-cmd-text :open {url:pretty}', mode='normal')
config.bind('<space>;', 'set-cmd-text -s :tab-select', mode='normal')
config.bind('<space>mm', 'set-cmd-text -s :bookmark-load', mode='normal')
config.bind('<space>x', 'tab-close', mode='normal')
config.bind('<space><space>', 'fake-key <space>', mode='normal') # space to play-pause videos
config.bind('<Ctrl-r>', 'reload', mode='normal')
config.bind('i', 'hint inputs --first', mode='normal')
config.bind('I', 'mode-enter insert', mode='normal')
config.bind('cc', 'open -t {primary}', mode='normal')
config.bind('f', 'set-cmd-text -s :quickmark-load', mode='normal')
config.bind('F', 'set-cmd-text -s :quickmark-load -t', mode='normal')

# Bookmarks
config.bind('<space>b', 'spawn -d em book "{url}" "{title}"', mode='normal') # Download highest quality
# config.bind('<space>B', 'spawn -d em booknote "{url}" "{title}"', mode='normal') # Download highest quality

config.bind('<Ctrl-i>', 'hint inputs', mode='normal')
config.bind('<Ctrl-i>', 'hint inputs', mode='insert')
# config.bind('<Ctrl-u>', 'fake-key <Down>', mode='normal')

# Privacy Toggles
config.bind('<space>cj', 'config-cycle -p -u *://{url:host}/* content.javascript.enabled;;reload', mode='normal')
config.bind('<space>cc', 'config-cycle -p -t -u {url} content.cookies.accept no-3rdparty never;;reload', mode='normal')
config.bind('<space>cC', 'config-cycle -p -t -u {url} content.cookies.accept no-3rdparty all;;reload', mode='normal')
config.bind('<space>cg', 'config-cycle -p -t content.geolocation True False;;reload', mode='normal')
config.bind('<space>cs', 'config-source', mode='normal')
config.bind('<space>cS', 'open -t qute://settings/', mode='normal')

# Download
config.bind('<space>dH', 'spawn -d download-ytdlp high {url}', mode='normal') # Download highest quality
config.bind('<space>dL', 'spawn -d download-ytdlp low {url}', mode='normal') # Download low quality
config.bind('<space>dh', 'hint links spawn -d download-ytdlp high {hint-url}', mode='normal') # Download highest quality hint
config.bind('<space>dl', 'hint links spawn -d download-ytdlp low {hint-url}', mode='normal') # Download low quality hint
config.bind('<space>dA', 'spawn -d download-ytdlp audio {url}', mode='normal') # Download audio (best)
config.bind('<space>da', 'hint links spawn -d download-ytdlp audio {hint-url}', mode='normal') # Download audio (best) hint

# Play
config.bind('<space>pp', 'hint links spawn -d play pause low {hint-url}', mode='normal')# Open play ff
config.bind('<space>ph', 'hint links spawn -d play pause high {hint-url}', mode='normal')# Open play ff
config.bind('<space>pH', 'spawn -d play pause high {url}', mode='normal')# Open play ff
config.bind('<space>pm', 'hint -r links spawn -d play {hint-url}', mode='normal')# Open play ff
config.bind('<space>pP', 'spawn -d play low {url}', mode='normal')# Open current play fs

# Link
config.bind('<space>lm', 'hint -r links tab-bg', mode='normal')
config.bind('<space>lb', 'hint links spawn -d firefox {hint-url}', mode='normal')
config.bind('<space>lB', 'spawn -d firefox {url}', mode='normal')
config.bind('<space>ly', 'hint links yank', mode='normal')
config.bind('<space>ld', 'hint links download {hint-url}', mode='normal')

# Redirect
config.source('redirect.py')

# Themes
# config.source('themes/onedark.py')
config.source('themes/dark.py')

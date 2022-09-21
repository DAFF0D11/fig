# base16-qutebrowser (https://github.com/theova/base16-qutebrowser)
# Base16 qutebrowser template by theova
# Horizon Dark scheme by Michaël Ball (http://github.com/michael-ball/)

base00 = "#000000"
base01 = "#232530"
base02 = "#2E303E"
base03 = "#6F6F70"
base04 = "#9DA0A2"
base05 = "#CBCED0"
base06 = "#DCDFE4"
base07 = "#E3E6EE"
base08 = "#E95678"
base09 = "#FAB795"
base0A = "#FAC29A"
base0B = "#29D398"
base0C = "#59E1E3"
base0D = "#26BBD9"
base0E = "#EE64AC"
base0F = "#F09383"



# (curs    "#1ef1a4")

# (backg   "#040406")
# (backg   "#000000")
# (foreg   "#a2a4ba")

# (red     "#E93C58")
# (green   "#29d398")
# (yellow  "#efaf8e")
# (blue    "#6e72af")
# (magenta "#b072d1")
# (cyan    "#24a8b4")

# (grayll  "#f9f9f9")
# (grayl   "#d9dce7")
# (grayml  "#a2a4ba")
# (graym   "#454558")
# (grayd   "#232533")

# (black   "#000000")
# (white   "#ffffff")



# Transparent
tr  = "rgba(0, 0, 0, 0)"

back  = "#000000"
# back    = "#040406"
fore    = "#f9f9f9"
dgray   = "#232533"
mgray   = "#454558"
lgray   = "#a2a4ba"
white   = "#f1f1f1"
black   = "#000000"
red     = "#E93C58"
pink    = "#EE64AC"
magenta = "#9d6eba"
green   = "#53c18e"
blue    = "#546ba1"
cyan    = "#24a8b4"
orange  = "#e5895e"
yellow  = "#f7bc81"

dorange = "#F09383"


       # (red     "#E93C58")
       # (green   "#53c18e")
       # (yellow  "#f7bc81")
       # (blue    "#5f71a1")
       # (magenta "#9d6eba")
       # (cyan    "#24a8b4")

       # (orange  "#e5895e")
       # (brown   "#8f867c")

       # (grayll  "#f9f9f9")
       # (grayl   "#d9dce7")
       # (grayml  "#a2a4ba")
       # (graym   "#2e303d")
       # (grayd   "#0c0c10")

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = mgray

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = black

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = black

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = dorange

# Background color of the completion widget category headers.
c.colors.completion.category.bg = black

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = black

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = black

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = yellow

# Background color of the selected completion item. -> selected item bg
c.colors.completion.item.selected.bg = black

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = black

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = black

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = red

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = red

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = dgray

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = back

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = base01

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = base04

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = base00

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  base05

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = base02

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = base05

# Background color for the download bar.
c.colors.downloads.bar.bg = base00

# Color gradient start for download text.
c.colors.downloads.start.fg = base00

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = base0D

# Color gradient end for download text.
c.colors.downloads.stop.fg = base00

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = base0C

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = red

# Hint borders are set in this weird way
config.set("hints.border", "1px solid gray")
c.hints.padding = { "bottom": 3, "top": 2, "left": 4, "right": 4 }

# Font color for hints.
c.colors.hints.fg = red

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = back

# Font color for the matched part of hints.
c.colors.hints.match.fg = back

# Text color for the keyhint widget.
c.colors.keyhint.fg = white

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = yellow

# Background color of the keyhint widget.
c.colors.keyhint.bg = back

# Foreground color of an error message.
c.colors.messages.error.fg = red

# Background color of an error message.
c.colors.messages.error.bg = back

# Border color of an error message.
c.colors.messages.error.border = back

# Foreground color of a warning message.
c.colors.messages.warning.fg = orange

# Background color of a warning message.
c.colors.messages.warning.bg = back

# Border color of a warning message.
c.colors.messages.warning.border = back

# Foreground color of an info message.
c.colors.messages.info.fg = base05

# Background color of an info message.
c.colors.messages.info.bg = base00

# Border color of an info message.
c.colors.messages.info.border = base00

# Foreground color for prompts.
c.colors.prompts.fg = base05

# Border used around UI elements in prompts.
c.colors.prompts.border = base00

# Background color for prompts.
c.colors.prompts.bg = base00

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = base02

# Foreground color for the selected item in filename prompts.
c.colors.prompts.selected.fg = base05

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = fore

# Background color of the statusbar.
c.colors.statusbar.normal.bg = back

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = fore

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = back

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = fore

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = base0C

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = fore

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = base01

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = fore

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = base00

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = fore

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = base00

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = fore

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = base0E

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = fore

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = base0D

# Background color of the progress bar.
c.colors.statusbar.progress.bg = black

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = fore

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = fore

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = cyan

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = red

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = yellow

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = orange

# Background color of the tab bar.
c.colors.tabs.bar.bg = back

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = base0D

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = back

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = base08

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = lgray

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = back

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = lgray

# Background color of unselected even tabs.
c.colors.tabs.even.bg = back

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = back

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = red

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = back

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = red

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = back

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = yellow

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = back

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = yellow

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = yellow

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = back

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = yellow

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = back

# Background color for webpages if unset (or empty to use the theme's
# color).

c.colors.webpage.bg = back

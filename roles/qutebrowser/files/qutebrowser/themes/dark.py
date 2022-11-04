# Dark-fi
bakg        = "#000000"
forg        = "#d1d1d1"
red         = "#E93C58"
green       = "#1EF1A4"
yellow      = "#e8b179"
cyan        = "#24a8b4"
magenta     = "#9f78ba"
blue        = "#5f71a1"
black       = "#000000"
white       = "#ffffff"
gray        = "#2e2e3a"
darkgray   = "#111119"
mediumgray = "#6b6c83"
lightgray  = "#e9e9e9"

# Transparent
tr  = "rgba(0, 0, 0, 0)"

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = mediumgray

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = bakg

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = bakg

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = yellow

# Background color of the completion widget category headers.
c.colors.completion.category.bg = bakg

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = bakg

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = bakg

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = white

# Background color of the selected completion item. -> selected item bg
c.colors.completion.item.selected.bg = bakg

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = bakg

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = bakg

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = green

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = green

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = darkgray

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = bakg

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = mediumgray

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = lightgray

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = bakg

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg =  lightgray

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = mediumgray

#Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = lightgray

# Background color for the download bar.
c.colors.downloads.bar.bg = bakg

# Color gradient start for download text.
c.colors.downloads.start.fg = bakg

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = blue

# Color gradient end for download text.
c.colors.downloads.stop.fg = bakg

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = cyan

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = red

# Hint borders are set in this weird way
config.set("hints.border", "0px solid gray")
c.hints.padding = { "bottom": 3, "top": 2, "left": 4, "right": 4 }

# Font color for hints.
c.colors.hints.fg = green

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency (tr).
c.colors.hints.bg = bakg

# Font color for the matched part of hints.
c.colors.hints.match.fg = bakg

# Text color for the keyhint widget.
c.colors.keyhint.fg = white

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = yellow

# Background color of the keyhint widget.
c.colors.keyhint.bg = bakg

# Foreground color of an error message.
c.colors.messages.error.fg = red

# Background color of an error message.
c.colors.messages.error.bg = bakg

# Border color of an error message.
c.colors.messages.error.border = bakg

# Foreground color of a warning message.
c.colors.messages.warning.fg = yellow

# Background color of a warning message.
c.colors.messages.warning.bg = bakg

# Border color of a warning message.
c.colors.messages.warning.border = bakg

# Foreground color of an info message.
c.colors.messages.info.fg = lightgray

# Background color of an info message.
c.colors.messages.info.bg = bakg

# Border color of an info message.
c.colors.messages.info.border = bakg

# Foreground color for prompts.
c.colors.prompts.fg = lightgray

# Border used around UI elements in prompts.
c.colors.prompts.border = bakg

# Background color for prompts.
c.colors.prompts.bg = bakg

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = darkgray

# Foreground color for the selected item in filename prompts.
c.colors.prompts.selected.fg = lightgray

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = forg

# Background color of the statusbar.
c.colors.statusbar.normal.bg = bakg

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = bakg

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = bakg

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = forg

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = cyan

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = forg

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = darkgray

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = forg

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = bakg

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = forg

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = bakg

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = forg

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = red

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = forg

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = blue

# Background color of the progress bar.
c.colors.statusbar.progress.bg = bakg

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = forg

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = forg

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = magenta

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = red

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = cyan

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = yellow

# Background color of the tab bar.
c.colors.tabs.bar.bg = bakg

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = blue

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = bakg

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = red

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = mediumgray

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = bakg

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = mediumgray

# Background color of unselected even tabs.
c.colors.tabs.even.bg = bakg

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = bakg

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = darkgray

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = bakg

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = darkgray

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = bakg

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = yellow

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = bakg

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = yellow

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = yellow

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = bakg

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = yellow

# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = bakg

# Background color for webpages if unset (or empty to use the theme's
# color).
c.colors.webpage.bg = bakg

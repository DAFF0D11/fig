# space2meta

_Turn your space key into the meta key (a.k.a. win key, OS key, super key) when
chorded to another key (on key release only)._

## Dependencies

- [Interception Tools][interception-tools]

## Building

```
$ git clone https://gitlab.com/interception/linux/plugins/space2meta.git
$ cd space2meta
$ cmake -Bbuild
$ cmake --build build
```

## Execution

```
space2meta - turn space into meta when chorded to another key (on release)

usage: space2meta [-h | -t delay]

options:
    -h show this message and exit
    -t delay used for key sequences (default: 20000 microseconds)

```

`space2meta` is an [_Interception Tools_][interception-tools] plugin. A
suggested `udevmon` job configuration (check the [_Interception Tools_
README][interception-tools] for alternatives) is:

```yaml
- JOB: intercept -g $DEVNODE | space2meta | uinput -d $DEVNODE
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_SPACE]
```

To compose functionality with [`caps2esc`], for example, you do:

```yaml
- JOB: intercept -g $DEVNODE | caps2esc | space2meta | uinput -d $DEVNODE
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC, KEY_SPACE]
```

For more information about the [_Interception Tools_][interception-tools], check
the project's website.

## Mouse/Touchpad Support

After _Interception Tools_ 0.3.2, `space2meta` can observe (or replace) mouse
events. An example configuration taken from my PC:

```yaml
SHELL: [zsh, -c]
---
- CMD: mux -c muxer
- JOB: mux -i muxer | caps2esc -m 2 | space2meta | uinput -c /etc/interception/hybrid.yaml
- JOB: intercept -g $DEVNODE | mux -o muxer
  DEVICE:
    LINK: /dev/input/by-id/usb-SEMITEK_USB-HID_Gaming_Keyboard_SN0000000001-event-kbd
- JOB: intercept -g $DEVNODE | mux -o muxer
  DEVICE:
    LINK: /dev/input/by-id/usb-Logitech_USB_Receiver-if02-event-mouse
```

For more information on the topic, check the [_Interception Tools_
README][interception-tools] about usage of the `mux` tool and hybrid virtual
device configurations.

## Installation

I'm maintaining an Archlinux package on AUR:

- <https://aur.archlinux.org/packages/interception-space2meta>

## Caveats

As always, there's always a caveat:

- visual delay when inserting space.
- `intercept -g` will "grab" the detected devices for exclusive access.
- If you tweak your key repeat settings, check whether they get reset.
  Please check [this report][key-repeat-fix] about the resolution.

## License

<a href="https://gitlab.com/interception/linux/plugins/space2meta/blob/space2meta/LICENSE.md">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/License_icon-mit-2.svg/120px-License_icon-mit-2.svg.png" alt="MIT">
</a>

Copyright © 2019 Francisco Lopes da Silva

[interception]: https://github.com/oblitum/Interception
[`caps2esc`]: https://gitlab.com/interception/linux/plugins/caps2esc
[interception-tools]: https://gitlab.com/interception/linux/tools
[key-repeat-fix]: https://github.com/oblitum/caps2esc/issues/1

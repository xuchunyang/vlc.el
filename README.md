# VideoLAN VLC Media Player Control

This package lets you control VLC through the [Web Interface](https://wiki.videolan.org/Control_VLC_via_a_browser/)'s [API](https://github.com/videolan/vlc/blob/fad0d14618f7be34b04347e517644764d43d8dad/share/lua/http/requests/README.txt).

## Usage

### Enable the web interface

To use this package, you're going to need to enable the web interface, go to
Preferences → HTTP web interface → check "Enable HTTP web interface", and don't
forget to set a non-empty password, then restart VLC.

### Set the password

Once you have enabled the web interface, you need tell vlc.el your password, if
your password is "secret", you don't have to do anything because value of user
option `vlc-password` defaults to `"secret"`, if your password is different, you
need to customize `vlc-password`. You have two options, first, you can set
`vlc-password` directly, e.g.,

``` emacs-lisp
(setq vlc-password "top-secret")
```

Secondly, you can use Emacs
[auth-source](https://www.gnu.org/software/emacs/manual/html_node/auth/), put
the following to your `~/.authinfo[.gpg]`

    machine vlc password top-secret

then change `vlc-password` to `auth-source` like this:

``` emacs-lisp
(setq vlc-password 'auth-source)
```

### Have fun

There are many commands such as `M-x vlc-add` to add a file to the playlist and
play it, here's a list of all commands:

- vlc-add
- vlc-clear
- vlc-delete
- vlc-empty
- vlc-enqueue
- vlc-fullscreen
- vlc-key
- vlc-loop
- vlc-next
- vlc-pause
- vlc-play
- vlc-prev
- vlc-random
- vlc-repeat
- vlc-seek
- vlc-snapshot
- vlc-sort
- vlc-stop
- vlc-volume

## Requires

- Emacs 25.1
- VLC

## Resources

- HTTP Requests API [README](https://github.com/videolan/vlc/blob/fad0d14618f7be34b04347e517644764d43d8dad/share/lua/http/requests/README.txt)
- API source code [httprequests.lua](https://github.com/videolan/vlc/blob/fad0d14618f7be34b04347e517644764d43d8dad/share/lua/intf/modules/httprequests.lua)
- Racket package https://docs.racket-lang.org/vlc/ for inspiration, it uses RC interface, not the Web Interface

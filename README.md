Keystone 
-------------------------------------------------------------------------------

### Play Hearthstone with the keyboard. ###

-----

**Keystone** is a tiny executable that runs in the background while you
play *Hearthstone*, and allows you to control the game using the
keyboard. Keys are described in depth [below][Key Descriptions], but the short version
is that you can use **Arrow Keys** to move around, **Numpad 0** to click,
and **End** to end your turn.

## Keys Description ##

For now *Keystone* fully supports the in-match interface, as well as
clicking the `Play` button after each match so that you can jump right
back into the next. Navigation of the game menus is under works, but
not supported yet.

There are two versions of the *Keystone* executable: 

1. [The Standard Version][] is designed for full-sized keyboards and doesn't interfere with any keys normally used for typing;
2. [The Laptop Version][] is designed for smaller keyboards and it does use some alphabet keys.

### Full-Sized ###

The following 3 items are all you need to know to play the game:

* `Arrow Keys` move around;
* `Numpad 0` clicks the mouse;
* `End` ends your turn.

The `End` key is a bit of a stretch to reach from the arrow keys, but
that's *intentional* so you don't hit it by accident (after all, it
ends your turn).  
Furthermore, there are some more keys, for convenience:

* The right `Ctrl` key places the mouse on you hero power. Pressing it again will move to your hero icon, then your enemy's icon, then the options button. All of these can also be reached with the arrow keys.
* `Numpad Arrows` work like arrow keys (`Numpad 5` also works like
`Down`).
* `Numpad -` ends your turn.
* `Numpad 7` and `9` are similar to the right `Ctrl` key.
* `F10` opens the options menu, and leaves the mouse on the *"Concede"* button.
* `F11` reloads some variables, it must be pressed if you move the
window or change the resolution.
* `F12` reloads *Keystone* entirely.
* The `Pause/Break` key pauses and unpauses *Keystone*, which will free up all
the keys (except for `Pause/Break`).

### Laptop-Sized ###

The full-sized version has the disadvantage that it relies on
arrow keys or the Numpad. Since most laptops have tiny (or
inexistent) arrow keys we also provide a second executable which
uses more convetional keys.  
The disadvantage here is that it interferes with regular typing (you
won't be able to type while it. To
mitigate this, the 

The following 3 items are all you need to know to play the game:

* `I`, `J`, `K`, and `L` move around;
* `Space` or `O` click the mouse (that's the letter O, not the number);
* `E`, `8` or `Shift+Space` end your turn.

Also, for convenience:

* `P` and `U` work like the right `Ctrl` key.
* All keys [specified above][] for the full-sized version also apply.


## Installation ##

No installation is actually necessary, just download the file and run
it. You'll notice there are two executables you can download, the
reason for that is explained in [Key Descriptions][], but the short
version is:

* If you have a full-sized keyboard, use the standard version (*Keystone_vX.exe*).
* If your keyboard has tiny arrow keys (or no arrow keys), use the
  laptop version (*Keystone-laptop_vX.exe*).

Now that you've read the two items above, here's the
[download link][].  
You may want to make it autostart with windows, or just leave it on
your desktop and start it when you start Hearthstone.


## No Drawbacks (and NO WARRANTY) ##

*Keystone* is perfectly well-intended and non-intrusive, which is to say:

1. It simply controls your mouse in a very intelligent way, so it doesn't do anything ugly like dll injection.
2. It only acts inside the Hearthstone window, so it doesn't interfere with anything else.
3. The default keys don't interfere with your typing, so you can still chat with your friends.
4. It does *NOT* automate anything and it is *NOT* a bot of any kind. So it's not a violation of Hearthstone's TOS.
5. It will *NOT* attempt to install anything or make any sort of internet connection.

If you want to check any of the above claims, the source is available
for viewing [here][github-source]. You may read, download, modify, and compile it
at your leisure, but you may not distribute it (or a modified version
of it) without my permission.

That said, we have a disclaimer:  
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.


[Key Descriptions]: #keys-description

[github-source]: https://github.com/Bruce-Connor/Keystone/

[specified above]: #full-sized

[download link]: 

[The Standard Version]:

[The Laptop Version]:

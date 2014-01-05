Keystone (Alpha)
-------------------------------------------------------------------------------

#### Play Hearthstone with the keyboard. ####

**Keystone** is a tiny executable that runs in the background while
you play *Hearthstone*, and allows you to control the game using the
keyboard.

It has been tested on several resolutions in both fullscreen and
windowed mode, but it's still in development, so **we need testers!**  
If you'd like to help, just install it and [bug-report][] if it doesn't work
for you (press `Home` key for a bug-report).

-----

## Summary ##

Keys are described in depth [below][Key Descriptions], but
the short version is that you can use **Arrow Keys** to move around,
**Numpad 0** to click, and **End** to end your turn.

Besides just being convenient, this app should help people with RSI
pain. Playing Hearthstone on the laptop touchpad hurts my wrist,
and this little script helps me **a lot**.

Keep in mind this is early alpha, so please [submit bug reports][bug-report]!

## Keys Description ##

For now *Keystone* fully supports the in-match interface, as well as
clicking the "*Play*" button after each match so that you can jump right
back into the next. Navigation of the game menus is under works, but
not supported yet.

There are two versions of the *Keystone* executable: 

1. [The Standard Version][] is designed for full-sized keyboards (with direction keys and a Numpad) and doesn't interfere with any keys normally used for typing;
2. [The Laptop Version][] is designed for smaller keyboards and it does use some alphabet keys.

## Installation ##

No installation is actually necessary, just download the file and run
it. You'll notice there are two executables you can download, the
reason for that is explained in [Key Descriptions][], but the short
version is:

* If you have a full-sized keyboard, use the standard version (*Keystone.exe*).
* If your keyboard has tiny arrow keys (or no arrow keys), use the
  laptop version (*Keystone-laptop.exe*).

Now that you've read the two items above, here's the
[download link][].  
You may want to make it autostart with windows, or just leave it on
your desktop and start it when you start Hearthstone.


## Is This a Bot? ##

**_Keystone_ is not a bot.** It takes a series of precautions to
avoid being considered a bot (but keep in mind, that decision
ultimately depends on Blizzard):

4. It does *NOT* automate anything, and it *tries* very hard to not be a violation of Hearthstone's TOS. There's a key to move the mouse in each direction and a key to click the button.
1. It simply moves your mouse in a useful way, and it follows the 1-key to 1-action rule. This means *at least* 1 key must be pressed for each time the mouse will be moved or clicked.
2. It doesn't do anything ugly like dll injection or reading process memory.
5. It will *NOT* attempt to install anything or make any sort of internet connection.

Furthermore, it tries to be completely non-intrusive:

2. It only acts inside the Hearthstone window, so it doesn't interfere with anything else.
3. The default keys don't interfere with your typing, so you can still chat with your friends.

If you want to check any of the above claims, the source is available
for viewing [here][github-source]. You may read, download, modify, and compile it
at your leisure, but you may not distribute it (or a modified version
of it) without my permission.

### NO WARRANTY and DISCLAIMER ###

That said, we have a disclaimer:  
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Specifically, we take no responsibility if you get banned for using
it or if you accidentally spend money in the game. USE IT AT YOUR OWN RISK.

On a lighter note, if Blizzard decides to rule against it, we'll do
our best to comply and to notify everyone.


[Key Descriptions]: #keys-description

[github-source]: https://github.com/Bruce-Connor/Keystone/

[The Standard Version]: https://github.com/Bruce-Connor/Keystone/blob/master/README-fullsize.md#full-sized

[The Laptop Version]: https://github.com/Bruce-Connor/Keystone/blob/master/README-laptop.md#laptop-sized

[download link]: https://github.com/Bruce-Connor/Keystone/releases

[bug-report]: https://github.com/Bruce-Connor/Keystone/issues/new


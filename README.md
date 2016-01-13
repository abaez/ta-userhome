# ta-userhome
## A modular userhome of textadept by [Alejandro Baez][1]
[![license][2i]][2p]

### Description
As the sub title states, this is a custom version **_USERHOME** of textadept.
I tend to like to modulize small sections of configurations. This allows for
cleaner changes and if something causes crashes, it can be pinpointed easily
without much hassle.

### REQUIREMENTS
* [ta-common][3]
* [ta-extend][4]
* [textredux][5]
* [ctags][6]
* [ta-pm][7]

### INSTALL
Simply clone the repository as your **_USERHOME**:

```
hg clone https://bitbucket.org/a_baez/ta-userhome ~/.textadept
```

### USAGE
A little bit of an explanation is needed to figure where to change what for
each module:

* extensions: here is where you put any *file extensions* you would want
textadept to auto label. Hence the table **auto**.
* global: here is where you would put global variables for modules or
snippets. May end up changing the name to `user.lua` for less confusion...
* keys: where you put all that are configured for textadept on global.
* init: should be kept to a minimum of only initializing modules listed.
* properties: all visual changes to textadept go here. May end up modulizing
this too at some future time...

[1]: https://keybase.io/baez
[2i]: https://img.shields.io/badge/license-MIT-green.svg
[2p]: ./LICENSE
[3]: https://bitbucket.org/a_baez/ta-common
[4]: https://bitbucket.org/a_baez/ta-extend
[5]: https://github.com/rgieseke/textredux
[6]: http://foicica.com/hg/ctags/
[7]: https://bitbucket.org/a_baez/ta-pm

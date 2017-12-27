vim-shore
==========

Autojump to 1st non-blank when j/k into leading spaces.

[![asciicast](https://asciinema.org/a/6kbuYwUhGspyrYsP2AZGJih2L.png)](https://asciinema.org/a/6kbuYwUhGspyrYsP2AZGJih2L)

(blue highlight for illustration purposes only, the plugin doesn't set it).


Why not use `+`, `-` or `<cr>`?
--------------------------------

Because I can move faster with `hjkl`, for short motions.
99 out of 100, I don't want to move into leading spaces, so this is just a better default for people who have a similar usage.


Settings
---------

- `let g:shore_stayonfront = 1` to also move back to 1st non-blank (in addition to moving forward).  
- `g:shore_key_down` and `g:shore_key_up` to map to non-default keys (or use the `<plug>` maps below).  
- `let shore_nomaps = 1` to prevent mappings.  

Maps:

- `<Plug>(shore)down`
- `<Plug>(shore)up`

Mapped by default to `j`/`k`


Command:

- `:ToggleShore` toggle plugin mappings on/off


Pluginophobia
--------------

If you don't like plugins, feel free to steal the code into your vimrc.


```

    The heart can think of no devotion
    Greater than being shore to the ocean--
    Holding the curve of one position,
    Counting an endless repetition.

```

License
--------
[Attribution-ShareAlike 4.0 Int.](https://creativecommons.org/licenses/by-sa/4.0/)


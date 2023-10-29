# why using vim

> Typing is not the bottleneck.

There are 2 main reasons why I keep using Vim/Neovim as my main editor.

- Vim gives developers a language to express the motion and changes in a concise and efficient way.
- The journey of improvement on using Vim will never end.

# The Zen of Vim

1. Speak Vim, not memorize.

> Text is structured (through text objects)

- Vim has a composable language
- It makes use of text structure

The expression syntax is declarative, extend your thoughts in a natural way.

- A common pattern as verb(operator) + noun(text objects), e.g.
  - dw as delete word,
  - cl as change letter,
  - yib as yank in block,
  - va[ as visual around [ bracket
  - > 2j as indent 2 lines below
- the pattern is well structured and extensible
  - plugins like vim-surround, vim-visual-multi, comment, etc

The motion in Vim lifts you to the sky, e.g.

- gg/G as top and end of file
- ^/$ as begin/end of line
- w as word
- e as end(of a word)
- b as back
- 2k as up 2 lines
- f,F or t, T to local the character
- ?, / to search pattern up and down

Combination of motion and edit expression.

- cf'
- d/<pattern>

Navigate accross files

- vimgrep
- qflist

2. DRY.

> Don't type it twice

All the changes are repeatable.

- dot
- macro

3. Be a time traveller.

All the changes are not only repeatable, but also undoable.

Vim memorize things for you.

- register
  - clipboard
  - macro
- marker
- jumplist, changelist

4. Feel no modes.

> The Ideal: One Keystroke to Move, One Keystroke to Execute.

- Just for reading(normal) and writing(normal+insert)
- Move, change, move again
- Visual mode is the smell, some better solution may exist

5. Embrace the world, make it your own.

- Vim is highly configurable and extensible
- Follow the mindset of Vim, then fit your own habbits
- PDE, a.k.a Personal Development Environment

# Good For Reading/Watching

- [Seven habits of effective text editing by Bram Moolenaar](https://www.moolenaar.net/habits.html)
- [Mastering the Vim Language by Chris Toomey](https://youtu.be/wlR5gYd6um0?si=ftR0wOchN5KdbL68)
- [Practical Vim by Drew Neil](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/)
- [Your problem with Vim is that you dont't grok vi](https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)

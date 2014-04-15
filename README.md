.vim
====

I use this repository to rapidly restore my vim settings and plugins. I can simply go to my home directory on any machine and run the following:

```bash
$ git clone https://github.com/chevex/.vim.git ~/.vim
$ cd ~/.vim
$ git submodule init
$ git submodule update
```

If you want a one-liner:

```bash
$ git clone https://github.com/chevex/.vim.git ~/.vim && cd ~/.vim && git submodule init && git submodule update
```

![](http://i.imgur.com/acPSGtG.gif)

I just pasted the one-liner from above and went from a bare vim configuration with no .vimrc and no plugins to everything being configured. The one-liner used in the above .gif includes a symlink for `.vimrc` at the end, however that has been updated to use the newer conventions of storing vim config as `.vim/vimrc`.

All vim plugins are added to the .vim/bundle/ directory as git submodules that point to their original github respositories. This makes it super easy to keep all your plugins up to date.

> $ git submodule foreach git pull origin master

That will iterate over all the plugin submodules and get the latest from their repositories. After that you'll just want to commit the updates to your main repository, and push them up to your fork if you made one.

> $ git add . && git commit -m "Updated plugins." && git push origin master

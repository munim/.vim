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

Most of the latest versions of vim have learned the ability to look in `~/.vim/vimrc` for your vim configuration settings. If vim isn't finding your settings then run the following to create a symlink.

```bash
$ ln -s ~/.vim/vimrc ~/.vimrc
```

Demo:

![](http://i.imgur.com/acPSGtG.gif)

I just pasted the one-liner from above and went from a bare vim configuration with no .vimrc and no plugins to everything being configured.

All vim plugins are added to the .vim/bundle/ directory as git submodules that point to their original github respositories. This makes it super easy to keep all your plugins up to date.

> $ git submodule foreach git pull origin master

That will iterate over all the plugin submodules and get the latest from their repositories. After that you'll just want to commit the updates to your main repository, and push them up to your fork if you made one.

> $ git add . && git commit -m "Updated plugins." && git push origin master

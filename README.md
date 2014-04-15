.vim
====

I use this repository to rapidly restore my vim settings and plugins. I can simply go to my home directory on any machine and run the following:

```bash
$ cd ~
$ git clone https://github.com/chevex/.vim.git
$ cd .vim
$ git submodule init
$ git submodule update
```

If you want a one-liner:

```bash
cd ~ && git clone https://github.com/chevex/.vim.git && cd .vim && git submodule init && git submodule update
```

All vim plugins are added to the .vim/bundle/ directory as git submodules that point to their original github respositories. This makes it super easy to keep all your plugins up to date.

> $ git submodule foreach git pull origin master

That will iterate over all the plugin submodules and get the latest from their repositories. After that you'll just want to commit the updates to your main repository, and push them up to your fork if you made one.

> $ git add . && git commit -m "Updated plugins." && git push origin master

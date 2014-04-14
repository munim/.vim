.vim
====

I use this repository to rapidly restore my vim settings and plugins. I can simply go to my home directory on any machine and run the following:

> $ cd ~  
> $ git init  
> $ git remote add origin https://github.com/chevex/.vim.git  
> $ git fetch  
> $ git checkout master  
> $ git submodule init  
> $ git submodule update

If you want a one-liner:

````bash
git init && git remote add origin https://github.com/chevex/.vim && git fetch && git checkout master && git submodule init && git submodule update
````

It's slightly more involved than a simple git clone because git gets mad about cloning into a non-empty directory. So instead we initialize our home directory as a git repository, add a remote to the new repository that points to this github repository. Then we simply fetch, checkout master, initialize all submodules, and update them.

All vim plugins are added to the .vim/bundle/ directory as git submodules that point to their original github respositories. This makes it super easy to keep all your plugins up to date.

> $ git submodule foreach git pull origin master

That will iterate over all the plugin submodules and get the latest from their repositories. After that you'll just want to commit the updates to your main repository, and push them up to your fork if you made one.

> $ git add . && git commit -m "Update plugins." && git push origin master

Example:

[![](http://i.imgur.com/bFQLUB4.gif)](http://i.imgur.com/bFQLUB4.gif)

I simply pasted the one-liner from above into the terminal. After a minute of letting git update everything all my vim settings/plugins have been restored and I hardly had to do a thing!

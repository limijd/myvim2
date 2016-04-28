# myvim2

* How to add new submodule?

git submodule add http://... dot.vim/bundle/<submodule>

* How to checkout a new sandbox?

git clone http://....
git submodule init

git submodule foreach git update
git submodule foreach git pull origin master


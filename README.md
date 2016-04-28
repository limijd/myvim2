# myvim2

* How to add new submodule?

git submodule add http://... dot.vim/bundle/<submodule>

* How to checkout a new sandbox and then sync all the submodule?

git clone http://....

git submodule init
git submodule foreach git submodule update
git submodule foreach git pull origin master


Ticket #5073
============

http://www.playonlinux.com/en/issue-5073.html

Cloned https://github.com/stefand/wine

Imported tags from parent repository
git remote add --tags parent https://github.com/wine-mirror/wine.git
git fetch --tags parent

Created patch file from the output of git diff wine-1.7.31

Added patch from WGL_WINE_surface2

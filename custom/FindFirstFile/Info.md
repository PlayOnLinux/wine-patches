Ticket #4898
============

http://www.playonlinux.com/en/issue-4898.html

FindFirstFile
=============

Implement FindFirstFileExW level FindExInfoBasic.
(Author: Sebastian Lackner)

References
----------

- https://bugs.winehq.org/show_bug.cgi?id=37354
  "Battle.net launcher does not start in Windows 7 mode: "Cannot load Qt 
  platform plugin Windows" (FindFirstFileExW needs info level 
  'FindExInfoBasic' support)"

- https://github.com/compholio/wine-compholio/tree/master/patches/kernel32-FindFirstFile

League Of Legends
=================

Request
--------

* http://www.playonlinux.com/en/issue-2720.html


Additional
-----------

Wine-1.7 include PandoInstallerFix, so the patches will not be included.
According to pango/petch, the two patches:
* 0001-ntdll-Improve-performace-of-heap-allocation-v2
* 0002-imm32-Avoid-deadlock-when-destroying-thread-data-v2
Are not used anymore, so removed.

(Aymeric 2013-08-12)

References
----------

 * AppDB: http://appdb.winehq.org/objectManager.php?sClass=version&iId=19141
 * current (2013-07-14) howto refers to a new installation script (http://league-of-legends-on-wine-install-script.googlecode.com/git/Install-LoL-on-Wine.sh), that uses Wine 1.6-rc4 plus two patches

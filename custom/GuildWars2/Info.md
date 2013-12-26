Ticket #3208
============ 

On Thu, 26 Dec 2013 23:06:39 +0100

http://www.playonlinux.com/fr/issue-3208.html

Removing old patches


  These patches have been applied to fix the in-game trading post and screen shots:
  http://bugs.winehq.org/show_bug.cgi?id=27168#c41
  http://bugs.winehq.org/show_bug.cgi?id=31557#c23

  I also reverted an official change that broke mouse camera control in wine 1.5.29.
  http://bugs.winehq.org/show_bug.cgi?id=33479

  Direct3D command stream multithreading is an experimental change that can improve performance. Starting with version 1.7.1 of my wine packages, these patches are included to allow CSMT:
  http://www.winehq.org/pipermail/wine-devel/2013-September/101106.html
  CSMT is activated using this registry setting:
  HKCU/Software/Wine/Direct3D/CSMT = "enabled"
  Make sure StrictDrawOrdering is not enabled in the registry.

Patch 01 and 02 are from the two first remarks.

Patch 03 is a revert of commit 76bbf106a28c4caa82873e8450bde7d4adc765bf

All other patches are from CSMT patches to be applied on Wine 1.7.1. 

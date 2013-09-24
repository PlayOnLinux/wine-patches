Ticket #3054
============

http://www.playonlinux.com/en/issue-3054.html

WineHQ bug: http://bugs.winehq.org/show_bug.cgi?id=31951

[PATCH] kernel32: Basic integration of SetVolumeMountPointA/W. (v3)
	Fixes: Bug 31951 and its duplicate 31703 (crash in TomTom HOME software)
	Fixes not: Bug 7711 (detecting TomTom devices)
	Maybe the device detection works if wine's MountManager supports MOUNTMGR_CREATE_POINT_INPUT:
		- fixme:mountmgr:mountmgr_ioctl ioctl 6dc000 not supported
		- http://doxygen.reactos.org/d9/df4/drivers_2filters_2mountmgr_2device_8c_source.html#l01479
	Add a wine_PWSTR_IS_VOLUME_NAME(s) macro to get rid of a UNICODE_STRING.
        Remove some strange looking memset calls and casts and copy volume name via memcpy.



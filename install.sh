# Set to true if you do *NOT* want Magisk to mount
# any files for you. Most modules would NOT want
# to set this flag to true
SKIPMOUNT=false
PROPFILE=false
POSTFSDATA=false
LATESTARTSERVICE=true
CLEANSERVICE=true
DEBUG=false
MODDIR=/data/adb/modules

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info why you would need this

# Construct your list in the following format
# This is an example
REPLACE_EXAMPLE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here
REPLACE="
"

##########################################################################################
#
# Function Callbacks
#
# The following functions will be called by the installation framework.
# You do not have the ability to modify update-binary, the only way you can customize
# installation is through implementing these functions.
#
# When running your callbacks, the installation framework will make sure the Magisk
# internal busybox path is *PREPENDED* to PATH, so all common commands shall exist.
# Also, it will make sure /data, /system, and /vendor is properly mounted.
#
##########################################################################################
##########################################################################################
#
# The installation framework will export some variables and functions.
# You should use these variables and functions for installation.
#
# ! DO NOT use any Magisk internal paths as those are NOT public API.
# ! DO NOT use other functions in util_functions.sh as they are NOT public API.
# ! Non public APIs are not guranteed to maintain compatibility between releases.
#
# Available variables:
#
# MAGISK_VER (string): the version string of current installed Magisk
# MAGISK_VER_CODE (int): the version code of current installed Magisk
# BOOTMODE (bool): true if the module is currently installing in Magisk Manager
# MODPATH (path): the path where your module files should be installed
# TMPDIR (path): a place where you can temporarily store files
# ZIPFILE (path): your module's installation zip
# ARCH (string): the architecture of the device. Value is either arm, arm64, x86, or x64
# IS64BIT (bool): true if $ARCH is either arm64 or x64
# API (int): the API level (Android version) of the device
#
# Availible functions:
#
# ui_print <msg>
#     print <msg> to console
#     Avoid using 'echo' as it will not display in custom recovery's console
#
# abort <msg>
#     print error message <msg> to console and terminate installation
#     Avoid using 'exit' as it will skip the termination cleanup steps
#
# set_perm <target> <owner> <group> <permission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     this function is a shorthand for the following commands
#       chown owner.group target
#       chmod permission target
#       chcon context target
#
# set_perm_recursive <directory> <owner> <group> <dirpermission> <filepermission> [context]
#     if [context] is empty, it will default to "u:object_r:system_file:s0"
#     for all files in <directory>, it will call:
#       set_perm file owner group filepermission context
#     for all directories in <directory> (including itself), it will call:
#       set_perm dir owner group dirpermission context
#
##########################################################################################
##########################################################################################
# If you need boot scripts, DO NOT use general boot scripts (post-fs-data.d/service.d)
# ONLY use module scripts as it respects the module status (remove/disable) and is
# guaranteed to maintain the same behavior in future Magisk releases.
# Enable boot scripts by setting the flags in the config section above.
##########################################################################################

# Set what you want to display when installing your module

print_modname() {
	ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ui_print "
┏━━━┳━━━━┳━━━┳━━━┓
┃┏━┓┃┏┓┏┓┃┏━┓┃┏━┓┃
┃┗━━╋┛┃┃┗┫┗━┛┃┗━┛┃
┗━━┓┃╋┃┃╋┃┏┓┏┫┏━━┛
┃┗━┛┃╋┃┃╋┃┃┃┗┫┃
┗━━━┛╋┗┛╋┗┛┗━┻┛
┏━┓┏━┓
┗┓┗┛┏┛
╋┗┓┏┛
╋┏┛┗┓
┏┛┏┓┗┓
┗━┛┗━┛
┏━━━┳━━━┳┓╋╋┏┳━━━┳━┓╋┏┳━━━┳━━━┳━━━┓
┃┏━┓┃┏━━┫┗┓┏┛┃┏━┓┃┃┗┓┃┃┏━┓┃┏━━┻┓┏┓┃
┃┗━┛┃┗━━╋┓┃┃┏┫┃╋┃┃┏┓┗┛┃┃╋┗┫┗━━┓┃┃┃┃
┃┏┓┏┫┏━━┛┃┗┛┃┃┗━┛┃┃┗┓┃┃┃╋┏┫┏━━┛┃┃┃┃
┃┃┃┗┫┗━━┓┗┓┏┛┃┏━┓┃┃╋┃┃┃┗━┛┃┗━━┳┛┗┛┃
┗┛┗━┻━━━┛╋┗┛╋┗┛╋┗┻┛╋┗━┻━━━┻━━━┻━━━┛"
  ui_print "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  ui_print ""
  ui_print ""
  ui_print ""
  }

# Copy/extract your module files into $MODPATH in on_install.

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print "▌ALL RE-VANCED APPLICATION CREDITS GO'S TO..."
  sleep 1
  ui_print ""
  ui_print "▌▰ 𝙍𝙚𝙑𝙖𝙣𝙘𝙚𝙙 𝙏𝙀𝘼𝙈 ▰ ▌"
  sleep 2
  ui_print ""
  sleep 2
  ui_print "▌I Have Just Build The App with Latest CLI..."
  ui_print "▌& Made This Module For Our Community!"
  ui_print ""
  sleep 2
    unzip -o "$ZIPFILE" 'tmp/*' -d $MODPATH >&2
  ui_print "▌Installing MicroG.apk To Avoid Crashes And Login!"
  ui_print ""
  ui_print "▌Installing 𝙈𝙄𝘾𝙍𝙊-𝙂..."
pm install $MODPATH/MicroG-ReCompiled-By-CV2.apk
  ui_print ""
ui_print "▌Installing 𝙎𝙏𝙍𝙋 𝙭 𝙍𝙚𝙑𝙖𝙣𝙘𝙚𝙙 𝙔𝙤𝙪𝙩𝙪𝙗𝙚 ..."
pm install $MODPATH/STRPxReVanced-Youtube.apk
ui_print " "
ui_print "▌Installing 𝙎𝙏𝙍𝙋 𝙭 𝙍𝙚𝙑𝙖𝙣𝙘𝙚𝙙 𝙈𝙪𝙨𝙞𝙘 ..."
pm install $MODPATH/STRPxReVanced-Music.apk
ui_print ""
  ui_print "▌ENJOY! ▌"
  rm -rf $TMPR
  sleep 2
  ui_print "▌STRP x ReVanced ♥️"
  ui_print ""
  ui_print "▌Don't Forget To Reboot Device!"
  sleep 3
}

set_permissions() {
  # The following is the default rule, DO NOT remove
  set_perm_recursive $MODPATH 0 0 0755 0644
}

SKIPUNZIP=1
unzip -qjo "$ZIPFILE" 'common/functions.sh' -d $TMPDIR >&2
. $TMPDIR/functions.sh
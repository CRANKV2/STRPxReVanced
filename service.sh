until [ "$(getprop sys.boot_completed)" = 1 ]; do
	sleep 1
done
B_PATH=$(pm path com.google.android.youtube | grep base | cut -d: -f2)
if [ "$B_PATH" ]; then
	chcon u:object_r:apk_data_file:s0 $MODDIR/YT/base.apk
	mount -o bind $MODDIR/YT/base.apk $B_PATH
fi
M_PATH=$(pm path com.google.android.apps.youtube.music | grep base | cut -d: -f2)
if [ "$M_PATH" ]; then
	chcon u:object_r:apk_data_file:s0 $MODDIR/YTM/base.apk
	mount -o bind $MODDIR/YTM/base.apk $M_PATH
fi
#! /bin/sh
### BEGIN INIT INFO
# Provides:          autossh
# Required-Start:    $network $remote_fs $syslog
# Required-Stop:     $network $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: <service description>
### END INIT INFO

#################################################################################
# Fill/change the following vars
#################################################################################

PATH=/sbin:/usr/sbin:/bin:/usr/bin:/usr/local/bin


. /etc/environment

. /lib/init/vars.sh

case "$1" in
    start)
    echo "start autossh"
    id=$(( 20000 + 1035 ))
    su farmtec bash -c 'autossh -f -M 0 -N -R '"$id"':localhost:22 pi@fsdm.farmsoft.cz -g -o ServerAliveInterval=10>
    ;;
    stop)
    sudo killall -s KILL autossh
    ;;
    restart)
    sudo killall -s KILL autossh
    id=$(( 20000 + 1035 ))
    su farmtec bash -c 'autossh -f -M 0 -N -R '"$id"':localhost:22 pi@fsdm.farmsoft.cz -g -o ServerAliveInterval=10>
    ;;
    *)
    echo "Usage: $0 (start|stop)"
    ;;
esac
exit 0

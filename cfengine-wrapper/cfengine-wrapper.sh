#!/system/xbin/busybox sh

. /system/bin/common-functions.sh

deployFileOnFirstBoot "cfengine-wrapper.conf" "root" "root" 600

. /data/mui/cfengine-wrapper.conf

RUDDER="/data/rudder"
WORKDIR="$RUDDER/cfengine-community"

busybox mkdir -p ${RUDDER}/inventories
busybox mkdir -p ${RUDDER}/modified-files
busybox mkdir -p ${RUDDER}/reports
busybox mkdir -p ${RUDDER}/tmp/inventory
busybox mkdir -p ${RUDDER}/tools
busybox mkdir -p ${RUDDER}/etc
busybox mkdir -p ${RUDDER}/bin
busybox mkdir -p ${WORKDIR}/bin
# ocs need to write in tmp/inventory
busybox chmod o+x ${RUDDER}
busybox chmod o+x ${RUDDER}/tmp
busybox chmod o+rwx ${RUDDER}/tmp/inventory
echo ${SERVER} > ${WORKDIR}/policy_server.dat

if [ ! -e ${RUDDER}/etc/uuid.hive ]
then
	cat /proc/sys/kernel/random/uuid > ${RUDDER}/etc/uuid.hive
fi

busybox cp -ar /system/bin/cf-* ${WORKDIR}/bin/
busybox cp -a /system/bin/run-inventory ${RUDDER}/bin
busybox chown root:root ${WORKDIR}/bin/*


if [ ! -f ${WORKDIR}/ppkeys/localhost.priv ]; then
	${WORKDIR}/bin/cf-key
	deployFileOnFirstBootToDir "cfengine-key.pub" "root" "root" 600 "${WORKDIR}/ppkeys/"
	mv ${WORKDIR}/ppkeys/cfengine-key.pub ${WORKDIR}/ppkeys/root-$(cf-key -p ${WORKDIR}/ppkeys/cfengine-key.pub).pub
fi

if [ ! -e ${WORKDIR}/inputs/failsafe.cf ]
then
	busybox cp -ar /system/usr/share/cfengine/inputs ${WORKDIR}/
	busybox chmod -R 600 ${WORKDIR}/inputs
	busybox chown -R root:root ${WORKDIR}/inputs/
fi

# To make sure cfengine is really running, we watch cf-execd, and we force cf-agent.
# XXX: on boot, the first launch may fail.
# If hostname change, cfengine will send another inventory after 24h. This is too long, we need to
# force another inventory
hostname=$(hostname)
while true
do
        if ! pgrep cf-execd || [[ ${hostname} != $(hostname) ]]
        then
                ${WORKDIR}/bin/cf-agent -KI -Dforce_inventory
		hostname=$(hostname)
        fi
        sleep 300
done

#!/bin/sh
eval $(dbus export lucky_)
source /koolshare/scripts/base.sh

if [ "$lucky_enable" = "1" ] || pidof lucky >/dev/null 2>&1 || [ -d "/koolshare/perp/lucky" ];then
	echo_date "先关闭Luckky插件！"
	sh /koolshare/scripts/lucky_config.sh stop
fi

# 如果软件中心版本比对脚本仍是Lucky安装时修改的版本，则恢复原文件。
for BACKUP in $(find /koolshare /www -type f -name "*.lucky-update.orig" 2>/dev/null); do
	TARGET=${BACKUP%.lucky-update.orig}
	if [ -f "${TARGET}" ] && grep -q 'col.name!="lucky"&&' "${TARGET}" 2>/dev/null; then
		cat "${BACKUP}" > "${TARGET}" 2>/dev/null && rm -f "${BACKUP}" 2>/dev/null
	else
		rm -f "${BACKUP}" 2>/dev/null
	fi
done

find /koolshare/init.d/ -name "*lucky*" | xargs rm -rf
rm -rf /koolshare/bin/lucky 2>/dev/null
rm -rf /tmp/lucky 2>/dev/null
rm -rf /koolshare/res/icon-lucky.png 2>/dev/null
rm -rf /koolshare/scripts/lucky*.sh 2>/dev/null
rm -rf /koolshare/webs/Module_lucky.asp 2>/dev/null
rm -rf /koolshare/scripts/lucky_install.sh 2>/dev/null
rm -rf /koolshare/scripts/uninstall_lucky.sh 2>/dev/null
rm -rf /koolshare/configs/lucky 2>/dev/null
rm -rf /tmp/upload/lucky* 2>/dev/null
rm -f /var/lock/lucky.lock /tmp/lucky.pid /tmp/var/lucky.pid 2>/dev/null

dbus remove lucky_version
dbus remove lucky_binary
dbus remove lucky_watchdog
dbus remove lucky_enable
dbus remove lucky_port
dbus remove lucky_reset_disable
dbus remove lucky_reset_port
dbus remove lucky_reset_safeurl
dbus remove lucky_reset_user
dbus remove lucky_safeurl
dbus remove softcenter_module_lucky_name
dbus remove softcenter_module_lucky_install
dbus remove softcenter_module_lucky_version
dbus remove softcenter_module_lucky_title
dbus remove softcenter_module_lucky_description
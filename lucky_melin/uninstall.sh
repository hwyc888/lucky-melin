#!/bin/sh
eval $(dbus export lucky_)
source /koolshare/scripts/base.sh

if [ "$lucky_enable" = "1" ] || pidof lucky >/dev/null 2>&1 || [ -d "/koolshare/perp/lucky" ];then
	echo_date "先关闭Luckky插件！"
	sh /koolshare/scripts/lucky_config.sh stop
fi

find /koolshare/init.d/ -name "*lucky*" | xargs rm -rf
rm -rf /koolshare/bin/lucky 2>/dev/null
rm -rf /tmp/lucky 2>/dev/null
rm -rf /koolshare/res/icon-lucky.png /koolshare/res/icon-lucky_melin.png 2>/dev/null
rm -rf /koolshare/scripts/lucky*.sh 2>/dev/null
rm -rf /koolshare/webs/Module_lucky.asp /koolshare/webs/Module_lucky_melin.asp 2>/dev/null
rm -rf /koolshare/scripts/lucky_install.sh 2>/dev/null
rm -rf /koolshare/scripts/uninstall_lucky.sh /koolshare/scripts/uninstall_lucky_melin.sh 2>/dev/null
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
dbus remove softcenter_module_lucky_melin_name
dbus remove softcenter_module_lucky_melin_install
dbus remove softcenter_module_lucky_melin_version
dbus remove softcenter_module_lucky_melin_title
dbus remove softcenter_module_lucky_melin_description
# 同时清理 1.6.2 及更早版本遗留的官方 lucky 模块身份。
dbus remove softcenter_module_lucky_name
dbus remove softcenter_module_lucky_install
dbus remove softcenter_module_lucky_version
dbus remove softcenter_module_lucky_title
dbus remove softcenter_module_lucky_description
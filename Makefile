NAME=oc-snmp
VERSION=0.02
MAINTAINER='Artur Balanuta'
DEPS := snmpd snmp
WORK_DIR=src

DESCRIPTION='OpenChirp.io SNMP device specific configurations'

POSTINSTALL_SCRIPT=deb/post-install.sh
PREINSTALL_SCRIPT=deb/pre-install.sh
POSTUNINSTALL_SCRIPT=deb/post-uninstall.sh

COMMON_FPM_ARGS=\
	--log error \
	-C $(WORK_DIR) \
	--after-install $(POSTINSTALL_SCRIPT) \
	--before-install $(PREINSTALL_SCRIPT) \
	--after-remove $(POSTUNINSTALL_SCRIPT) \
	--name $(NAME) \
	--version $(VERSION) \
	--maintainer $(MAINTAINER) \
	--description $(DESCRIPTION) \
	--config-files /etc/snmp/snmpd.conf \
	--verbose

.PHONY: package
package:
	sed -i "s/sysLocation.\+/sysLocation $(NAME)_$(VERSION)/g" $(WORK_DIR)/etc/snmp/snmpd.conf
	fpm -s dir -t deb $(COMMON_FPM_ARGS) $(foreach dep,$(DEPS),-d $(dep))
	mv $(NAME)_$(VERSION)_*.deb build/

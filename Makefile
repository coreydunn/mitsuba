PREFIX=   /var/www
OBJS=     *php server_config.ini db db/posts.db

FQDN=     example.local
PROTO=    http
PORT=     8888
ROOT=     $(PREFIX)/$(FQDN)

all:
	@echo 'Targets:'
	@echo '    install'

server_config.ini: Makefile
	@echo "[Server]" > $@
	@echo "fqdn=$(FQDN)" >> $@
	@echo "proto=$(PROTO)" >> $@
	@echo "port=$(PORT)" >> $@
	@echo "root=$(ROOT)" >> $@

install: server_config.ini
	if [ ! -d $(PREFIX) ]; then \
		mkdir $(PREFIX); \
	fi
	if [ ! -d $(PREFIX)/$(FQDN) ]; then \
		mkdir $(PREFIX)/$(FQDN); \
	fi
	for x in $(OBJS); do \
		if [ -d $$x ]; then \
			mkdir $(PREFIX)/$(FQDN)/$$x; \
		else \
			cp $$x $(PREFIX)/$(FQDN)/$$x; \
		fi \
	done \

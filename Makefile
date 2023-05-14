FQDN=     example.local
PREFIX=   /var/www
OBJS=     *php server_config.ini db db/posts.db

all:
	@echo 'Targets:'
	@echo '    install'

install:
	[ ! -d $(PREFIX) ] && mkdir $(PREFIX)
	[ ! -d $(PREFIX)/$(FQDN) ] && mkdir $(PREFIX)/$(FQDN)
	for x in $(OBJS); do \
		if [ -d $$x ]; then \
			mkdir $(PREFIX)/$(FQDN)/$$x; \
		else \
			cp $$x $(PREFIX)/$(FQDN)/$$x; \
		fi \
	done \


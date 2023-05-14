FQDN=     example.local
PREFIX=   /var/www
OBJS=     *php server_config.ini db db/posts.db

all:
	@echo 'Targets:'
	@echo '    install'

install:
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


FQDN=     example.local
PREFIX=   /var/www/$(FQDN)
OBJS=     index.php done.php server_config.ini db db/posts.db

all:
	@echo 'Targets:'
	@echo '    install'

install:
	for x in $(OBJS); do \
		if [ -d $$x ]; then \
			mkdir $(PREFIX)/$$x; \
		else \
			cp $$x $(PREFIX)/$$x; \
		fi \
	done \


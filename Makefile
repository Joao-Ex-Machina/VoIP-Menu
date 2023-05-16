install:
	make dependencies
	sudo make setup
dependencies: requirements.txt
	python3 -m venv .venv
	. .venv/bin/activate; python3 -m pip install -r requirements.txt
	mkdir -p /var/lib/asterisk/agi-bin
setup:
	chown -R asterisk /etc/asterisk/
	chown -R asterisk /var/lib/asterisk/
	chown -R asterisk /var/spool/asterisk/
	cp src/conf/extensions.conf /etc/asterisk
	cp src/conf/sip.conf /etc/asterisk
	cp src/lib/* /var/lib/asterisk
	cp src/scripts/*.sh /var/lib/asterisk
	chmod u+x  /var/lib/asterisk/*.sh
	cp -r .venv /var/lib/asterisk/agi-bin/
	cp src/scripts/stock.py /var/lib/asterisk/agi-bin/stock.agi
#	mkdir /usr/share/asterisk
#	mkdir /usr/share/asterisk/sounds
	mkdir -p /var/lib/asterisk/sounds/en
	cp src/sounds/*  /var/lib/asterisk/sounds/en

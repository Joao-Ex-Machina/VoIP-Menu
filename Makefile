install:
	sudo make dependencies
	sudo make setup
dependencies:
	git clone https://github.com/zaf/asterisk-googletts
	mkdir -p /var/lib/asterisk/agi-bin
	mv asterisk-googletts/*.agi /var/lib/asterisk/agi-bin
	rm -rf asterisk-googletts
setup:
	cp src/conf/extensions.conf /etc/asterisk
	cp src/conf/sip.conf /etc/asterisk
	cp src/scripts/stock.py /var/lib/asterisk/agi-bin/stock.agi
#	mkdir /usr/share/asterisk
#	mkdir /usr/share/asterisk/sounds
	mkdir -p /var/lib/asterisk/sounds/en
	cp src/sounds/*  /var/lib/asterisk/sounds/en

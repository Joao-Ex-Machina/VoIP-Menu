

setup:
	cp src/conf/extensions.conf /etc/asterisk
	cp src/conf/sip.conf /etc/asterisk
#	mkdir /usr/share/asterisk
#	mkdir /usr/share/asterisk/sounds
	cp src/sounds/*  /var/lib/asterisk/sounds/en

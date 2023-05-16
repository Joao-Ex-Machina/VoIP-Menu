install:
	sudo make dependencies
	sudo make setup
dependencies: requirements.txt
	git clone https://github.com/zaf/asterisk-googletts
	mkdir -p /var/lib/asterisk/agi-bin
	mv asterisk-googletts/*.agi /var/lib/asterisk/agi-bin
	rm -rf asterisk-googletts
	python3 -m venv .venv
	. .venv/bin/activate; python3 -m pip install -r requirements.txt
setup:
	cp src/conf/extensions.conf /etc/asterisk
	cp src/conf/sip.conf /etc/asterisk
	cp -r .venv /var/lib/asterisk/agi-bin/
	cp src/scripts/stock.py /var/lib/asterisk/agi-bin/stock.agi
#	mkdir /usr/share/asterisk
#	mkdir /usr/share/asterisk/sounds
	mkdir -p /var/lib/asterisk/sounds/en
	cp src/sounds/*  /var/lib/asterisk/sounds/en

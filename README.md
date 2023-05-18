# VoIP-Menu
A simple IVR menu implementation for the Asterisk PBX

## Installation
1. Install all package dependencies:

**Asterisk:** A complete PBX solution

2. Clone this repo

3. Install!

```sudo make install```

## Usage

1. Start the Asterisk daemon:

```sudo asterisk```

2. Start the Asterisk CLI:

```sudo asterisk -vvvvr```

3. Using your favorite softphone (we recommend [Linphone](linphone.org)), add a new SIP account with:

User: 3000 OR 3001 OR 4000 OR 4001

SIP domain: 127.0.0.1

Password: agr23

4. Make a call to the 96267 extension and enjoy the IVR!

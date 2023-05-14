# VoIP-Menu
A simple IVR menu implementation for the Asterisk PBX

## Installation
1. Install all package dependencies:

**Asterisk:** A complete PBX solution

**Perl:** The Perl Programming Language

**perl-libwww:** The World-Wide Web library for Perl

**perl-LWP-Protocol-https:** For HTTPS support

**sox:** Sound eXchange, sound processing program

**mpg123:** MPEG Audio Player and decoder

**git:** A fast distributed version control system (needed if you are not installing the Googletts AGI from source)

2. If you do not have [Zaf's Asterisk Googletts AGI](https://github.com/zaf/asterisk-googletts) do:

```sudo make dependencies```

Or install it from the source.

3. Finish with:

```sudo make setup```

You can skip steps 2. and 3. if you do:

```sudo make install```

## Usage

1. Start the Asterisk daemon:

```sudo asterisk```

2. Start the Asterisk CLI:

```sudo asterisk -vvvvr```

3. Using your favorite softphone (we recommend [Linphone](linphone.org)), add a new SIP account with:

User: 3001

SIP domain: 127.0.0.1

Password: agr23

4. Make a call to the 96267 extension and enjoy the IVR!

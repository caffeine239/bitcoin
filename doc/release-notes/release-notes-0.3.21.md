Binaries for Muskcoin version 0.3.21 are available at:
  https://sourceforge.net/projects/muskcoin/files/Muskcoin/muskcoin-0.3.21/

Changes and new features from the 0.3.20 release include:

* Universal Plug and Play support.  Enable automatic opening of a port for incoming connections by running muskcoin or muskcoind with the - -upnp=1 command line switch or using the Options dialog box.

* Support for full-precision muskcoin amounts.  You can now send, and muskcoin will display, muskcoin amounts smaller than 0.01.  However, sending fewer than 0.01 muskcoins still requires a 0.01 muskcoin fee (so you can send 1.0001 muskcoins without a fee, but you will be asked to pay a fee if you try to send 0.0001).

* A new method of finding muskcoin nodes to connect with, via DNS A records. Use the -dnsseed option to enable.

For developers, changes to muskcoin's remote-procedure-call API:

* New rpc command "sendmany" to send muskcoins to more than one address in a single transaction.

* Several bug fixes, including a serious intermittent bug that would sometimes cause muskcoind to stop accepting rpc requests. 

* -logtimestamps option, to add a timestamp to each line in debug.log.

* Immature blocks (newly generated, under 120 confirmations) are now shown in listtransactions.

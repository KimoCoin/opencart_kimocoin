# opencart_kimocoin
### ported from : https://github.com/btcgear/OpenCart_Bitcoin (version 1.4.0)

Initial bounty paid by cablepair.

This is an OpenCart payment module that communicates with a kimocoin client using JSON RPC.

This code accurately converts any cryptocurrency to KMC using the up-to-the-minute values for average trade value and last trade value.  It is completely self contained and requires no cron jobs or external hardware other than a properly configured kimocoind server.  Every order creates a new kimocoin address for payment and gives it a label corresponding to the order_id of the order.  It installs like any other OpenCart plugin and it is completely integrated with OpenCart.

This extension has been tested with OpenCart versions between 1.5.2.1 and 1.5.5.1.


ScreenShots: 
	
	http://i60.tinypic.com/ogapz8.jpg
	http://i59.tinypic.com/2mguuxl.jpg
	http://i58.tinypic.com/14kw8d3.jpg
	http://i62.tinypic.com/2mh4xs.jpg
	http://i61.tinypic.com/zx1de0.jpg


# Dependencies

This extension now requires previous installation of [vQmod](https://code.google.com/p/vqmod/) and will not run properly without it. vQmod enables making changes to core OpenCart functionality without actually editing the core OpenCart files.

# Installation

1. Install vQmod.
2. Upload all files maintaining OpenCart folder structure.
3. Install the payment module in the admin console (Extensions > Payments > KimoCoin > Install).
4. Edit the payment module settings (Extensions > Payments > KimoCoin > Edit).
5. Run at least one test order through checkout up until payment (no payment required).  The first order initializes the KimoCoin currency and will return 0 KMC for the order total.

## Explanation of Settings

* *KimoCoin RPC Username*: This is the username in the "rpcuser" line of your kimocoin.conf file.
* *KimoCoin RPC Host Address*: This is the IP address of the computer kimocoind is running on.
* *KimoCoin RPC Password*: This is the password in the "rpcpassword" line of your kimocoin.conf file.
* *KimoCoin RPC Port*: This is the port number in the "rpcport" line of your kimocoin.conf file.  The default port is 1988.
* *The prefix for the address labels*: The addresses will be assigned to accounts named with the format [prefix]_[order_id].
* *Is this a block explorer JSON-RPC server?*: Choose yes if connecting to explorer.kimocoin.com JSON-RPC API.
* *Show KMC as a store currency*: If you select yes, your customers will be able to view prices in KMC.
* *Calculate KMC amount to this many decimal places*: Self explanatory. Choose the precision of the exchange rate calculation.
* *Time to complete order*: The number of seconds a customer has to send kimocoins to complete the order.
* *Status of a new order*: Choose a status for an order that has received payment with 0 confirmations.
* *Status*: Enable the KimoCoin payment module here.
* *Sort Order*: Where you want this module to show up in relation to the other payment modules on the checkout page.

Shared Libraries
================

## muskcoinconsensus

The purpose of this library is to make the verification functionality that is critical to Muskcoin's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `muskcoinconsensus.h` located in  `src/script/muskcoinconsensus.h`.

#### Version

`muskcoinconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`muskcoinconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `muskcoinconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `muskcoinconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `muskcoinconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/muskcoin/bips/blob/master/bip-0016.mediawiki)) subscripts
- `muskcoinconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/muskcoin/bips/blob/master/bip-0066.mediawiki)) compliance
- `muskcoinconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/muskcoin/bips/blob/master/bip-0147.mediawiki))
- `muskcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/muskcoin/bips/blob/master/bip-0065.mediawiki))
- `muskcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/muskcoin/bips/blob/master/bip-0112.mediawiki))
- `muskcoinconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/muskcoin/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `muskcoinconsensus_ERR_OK` - No errors with input parameters *(see the return value of `muskcoinconsensus_verify_script` for the verification status)*
- `muskcoinconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `muskcoinconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `muskcoinconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `muskcoinconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NMuskcoin](https://github.com/NicolasDorier/NMuskcoin/blob/master/NMuskcoin/Script.cs#L814) (.NET Bindings)
- [node-libmuskcoinconsensus](https://github.com/bitpay/node-libmuskcoinconsensus) (Node.js Bindings)
- [java-libmuskcoinconsensus](https://github.com/dexX7/java-libmuskcoinconsensus) (Java Bindings)
- [muskcoinconsensus-php](https://github.com/Bit-Wasp/muskcoinconsensus-php) (PHP Bindings)

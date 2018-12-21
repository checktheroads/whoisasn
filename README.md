# `whoisasn`
`whoisasn` is a simple `bash` tool for network engineers to quickly look up who operates an AS number using the PeeringDB REST API. There's probably a better way to do this, like querying RIRs directly, but this was faster at the time.

# Installation
## Install Dependencies

* [`jq`](https://github.com/stedolan/jq)

## Install `whoisasn`
```
git clone https://github.com/checktheroads/whoisasn.git
cd whoisasn
sh ./install.sh
```
# Usage
```
whoisasn <asn>
```
# Example
```
whoisasn 395077

 ↳ AS395077 belongs to Omnificent Systems

```

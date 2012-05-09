# Roku Application which can be powered by MRSS feeds. 

## Setup

1. Change url variable in appMain.brs to point to your Syndicate server.
1. Edit manifest and change Title and Subtitle accordingly.
1. Edit Makefile and change Appname accordingly. 

## Graphics

All graphics are in /images

*  banner - The banner at the top of the application
*  banner-logo - The logo overlaid on top of the banner. Position is controlled in theme.brs
*  logo - The logo used on the channel screen of the Roku. These can be used when submitting application to Roku as well. 

## Install to Roku

Roku must first be set to development mode. 

```bash
export ROKU_DEV_TARGET=<ip_address_of_roku>
make install
```

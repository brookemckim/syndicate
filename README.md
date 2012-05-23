Syndicate
=========

Generate MRSS feeds from any directory on your computer. 

## Install

```
gem install syndicate
```

## Use

From the command line:

```
syndicate
```

This will start a web server that listens on port 3000. 
You can then access a feed for any directory on the system running the server 
by visiting http://localhost:3000/d/Users/bmckim/Desktop - replace this path
with any directory you want to explore. 

You will then need devices that can consume this MRSS feed.

### Applications

Example applications to consume the MRSS feeds are available in the examples directory.

# Aggregating Log Files with Secure Scuttlebutt

Secure scuttle-what? That's most peoples' first question when I mention the decentralized network called [ssb](https://www.scuttlebutt.nz). I came across this network while trying to solve a problem with my duplicity backup scripts. There are a few applications that run on this network, and I especially enjoy the community on the [social network](https://www.scuttlebutt.nz/applications.html#patchwork) that runs in the scuttleverse. Secure Scuttlebut is a [gossip protocol](https://en.wikipedia.org/wiki/Gossip_protocol) for syncing blockchains between devices on the same network. But unlike most blockchain technology it doesn't establish consensus on one massive public ledger. Instead each machine has its own feed that is shared with followers. Each user's identity is just a public/private key pair, so anyone can replicate and verify a feed but only the owner can append to it. 

I have an elaborate set of duplicity backup scripts that back up all my computers to multiple locations. Running your backups on an open-source python script has its advantages, but one of the major disadvantages I found was the lack of a centralized notification center where I could see the status of all my backups. Some of these machines (especially my wife's) I don't log onto very much, and when I do I don't often read cron mail. I toyed with the idea of trying to send error logs over email, but setting up a bunch of email servers didn't sound like very much fun. I also took a look at Logstash, but wondered if there was a less fragile way. That's how I found SSB, which makes ad-hoc connections to LAN peers to transfer messages. 

### Setup

The first step is to get the right version of Node.js on each machine. Once I found [nvm](https://github.com/creationix/nvm) the process became much easier. You can install the secure scuttlebutt client - `sbot` - with the following commands:
`curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash`
`nvm install 8.10`
`npm install -g scuttlebot`

In order to keep our logs confidential and off the main scuttlebutt network, we'll want to pass a custom port and key when running sbot. I also like to set up a directory that is separate from sbot's default directory so I can run other ssb apps like Patchwork. I start my sbot server with a command like this:
`sbot server --path ~/alternate-ssb-directory --port 8321 --caps.shs "randonsecretAPIstringthatisaboutfortycharacters"`

Don't let the `server` command fool you. This is not client-server technology in the traditional sense. In this case the client-server relationship happens entirely on your machine. `sbot server` is 100% functional even when your machine is not connected to the internet - it will resume listening for peers when you reconnect.

The sbot server should be started at login. I use a systemd service like [this one]() on Linux and a launchd script [like this]() on macOS. Once `sbot server` is running we can use the `sbot` cli to publish log messages to our own feed. The sbot server does not need to be connected to the internet to accept these messsages, but when it detects a network interface it will look for other sbots and share messages with them.

### Adding Log Messages

Now we can pipe the output of any script we like to `sbot`. I put a snippet like the following at the end of my backup scripts:
`| xargs -I {} sbot publish --path ~/alternate-ssb-directory --port 8321 --caps.shs "randonsecretAPIstringthatisaboutfortycharacters" --type log --source mycomputername --destination myothercomputer --text " {}"`

This will publish each line of log output as a "post" with type "log" to our sbot feed. You'll notice that you can pass arbitrary named flags in the command to publish the post. These flags and their values will be added to the JSON post content. In this case I am passing the custom flags "--source" and "--destination" to specify the source and destination machines for the current backup.

### Connecting the sbots

I was simplifying a little bit when I said that `sbot server` would automatically sync with peers on the LAN. To get an sbot to save messages from its peers, you need to tell it which feeds you are interested in following. You do this by publishing a post of type "contact" to your feed. The contact post includes the public key of the machine you wish to follow. This public key (a.k.a. userId) can be found by running the `whoami` command on the machine you wish to follow. The full command would look like this:
`sbot whoami --path ~/alternate-ssb-directory --port 8321 --caps.shs "randonsecretAPIstringthatisaboutfortycharacters"` 
You can then publish the contact post on the original machine with a command like the following:
`sbot publish --path ~/alternate-ssb-directory --port 8321 --caps.shs "randonsecretAPIstringthatisaboutfortycharacters" --type contact --contact {userId} --following`
where `{userId}` is the id from the `whoami` command.

It would be pretty tiresome to have to follow every one of your machines on every other machine. Fortunately sbot will replicate the feeds of peers up to 3-hops away on the social graph, and you can increase that number if you like. So in practice having each machine follow one or two others will ensure that your messages eventually propagate all the way around.

### Assembling logs

At this point all the log messages should be making their gossipy way around your computer community. The last step is to assemble the feeds into a traditional log file for easy viewing. At this point if you want to use a fancy log viewer like Kibana you can go to town. I am using a simple python script like this to generate a text file:
```
```

### In Conclusion

Although npm and Javascript are not my tools of choice and there is a decent amount of setup work on each machine, this setup has several advantages:
* Your setup is free from static IP addresses and DNS records.
* Uptime of machines and internet connections are not a concern. They will sync when they can.
* The transmission of your data is encrypted without the hassle of SSL certificates.
* There is no need to open ports into your home network.
* Your system is free - free as in beer and speech

I'm really glad I gave scuttlebutt a go. It's a neat technology that turns a lot traditional computing values on their head. And in the process I found an awesome network of people living on boats and in off-grid monasteries making cool stuff and sharing it. You can follow me on scuttlebutt at: @k8oSu2t6f/cd0jqqUbL2Oqy77J1AE39I+WoF2QK7BFg=.ed25519



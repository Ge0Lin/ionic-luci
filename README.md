Public ThingMesh OpenWRT Repository
-----------------------------------

Include this repository in your OpenWRT built root by editing feeds.conf
and add the following line:

src-git thingmesh https://github.com/ThingMesh/openwrt-thingmesh.git

After adding the repository, please issue the following commands:

$ scripts/feeds update
$ scripts/feeds install -p thingmesh -a


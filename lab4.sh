#!bin/bash

#создаем namespace
ip net add h2
ip net add h3
ip net add h4

#создаем bridge
brctl addbr br0

#создаем шнурки
ip link add veth0 type veth peer name veth2

#поднимаем систему
ip link set veth2 netns h2
ip net e h2 ip l s veth2 up
ip net e h2 ip l s lo up
ip l s veth0 up

#добавляем ip-шники
ip a a 10.0.0.2 dev h2
ip a a 10.0.0.3 dev h3
ip a a 10.0.0.4 dev h4
ip l a link veth2 name veth2.10 type vlan id 10
ip l a link veth2 name veth2.20 type vlan id 20

ip route -net 10.0.0.0/24 gw 10.0.0.1/24 dev veth2 
ip net e h2 ip r a 10.0.0.1/24 dev veth2

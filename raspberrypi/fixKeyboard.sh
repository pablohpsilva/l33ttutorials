#!/bin/bash
sudo setxkbmap -layout us
sudo setupcon
sudo udevadm trigger --subsystem-match=input --action=change

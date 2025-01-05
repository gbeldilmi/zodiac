#!/usr/bin/env bash

_directory="/zodiac/home/$USER"
_archive="/zodiac/bkp/$USER-$(date +%F-%H-%M-%S).tar.zst"

archive $_directory $_archive

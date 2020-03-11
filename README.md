# Battery Notify

## Simple script to notify that your battery exceed specified percentage

## Description

First argument specifies urgency of the message, supported are those by `notify-send` (low, normal and critical)
second sets after below what battery status notification is supposed to show up
third is time notify shows

good idead\'d be to put it somewhere in crontab in about 5-10m

## Usage

```
battery_notify normal 20
battery_notify critical 2 10
```

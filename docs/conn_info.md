### Connection Info
---

<html><small>revision: 0</small></html>

##

LINE use connection info to determine which server is suitable for client from given parameters

<html><small>The parameter is in hash order</small></html>

| Parameter | Description |
|--|--|
| `type` | LINE Application Type. e.g. `ANDROID` or `IOS` |
| `version` | LINE Application Version |
| `region` | Region |
| `time` | UNIX Time in millisecond |
| `carrier` | SIM Card MCCMNC |
| `key` | Checksum parameter using MD5, hex digest of all parameter above with salt

<html><small>note: salt</small></html>

```0x4c,0x60,0x5e,0xff,0xdf,0x3d,0xfc,0xa1,0x21,0x7d,0x48,0x17,0x40,0x20,0x56,0x91,0x80,0xdc,0x23,0x38,0xa5,0x77,0x2a,0x80,0xed,0x0a,0xaa,0x01,0xbc,0xd0,0xa0,0x8f```

#
The generated url should be like [this!](https://legy-jp.line.naver.jp/R?carrier=&key=f6a7e33b389c6339aad979b830a693ce&region=ja&time=1590250505&type=ANDROID&version=10.1.2)
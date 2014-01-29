/etc/localtime:
  file.symlink:
    - force: true
    - target: /usr/share/zoneinfo/America/Chicago

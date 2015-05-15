{% from "rsyncd/map.jinja" import rsyncd with context %}

rsyncd_conf_exists:
  file.managed:
    - name: {{ rsyncd.configfile }}
    - contents: |
        # This file is created by salt as a dummy, use the config state or override manually
        pid file = /var/run/rsyncd.pid
        use chroot = yes
        read only = yes
    - replace: false

rsync:
  pkg.installed:
    - name: {{ rsyncd.pkg }}
  service.running:
    - name: {{ rsyncd.service }}
    - enable: True
    - require:
      - file: rsyncd_conf_exists

{% if grains.os_family == 'Debian' %}
/etc/default/rsync:
  file.replace:
    - pattern: ^.*RSYNC_ENABLE=.*$
    - repl: RSYNC_ENABLE=true
    - append_if_not_found: True
    - watch_in:
      - service: rsync
{% endif %}

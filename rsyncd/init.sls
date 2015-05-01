{% from "rsyncd/map.jinja" import rsyncd with context %}

rsync:
  pkg.installed:
    - name: {{ rsyncd.pkg }}
  service.running:
    - name: {{ rsyncd.service }}
    - enable: True

{% if grains.os_family == 'Debian' %}
/etc/default/rsync:
  file.replace:
    - pattern: ^.*RSYNC_ENABLE=.*$
    - repl: RSYNC_ENABLE=true
    - append_if_not_found: True
    - watch_in:
      - service: rsync
{% endif %}

{% from "rsyncd/map.jinja" import rsyncd with context %}
include:
  - rsyncd

rsyncd_config_file:
  file.managed:
    - name: {{ rsyncd.configfile }}
    - contents_pillar: rsyncd:config
    - watch_in:
      - service: rsync

{% if salt['pillar.get']('rsyncd:secrets') %}
rsyncd_secrets_file:
  file.managed:
    - name: {{ rsyncd.secretsfile }}
    - watch_in:
      - service: rsync
    - source: salt://rsyncd/files/secrets.jinja
    - mode: 640
    - template: jinja
{% endif %}

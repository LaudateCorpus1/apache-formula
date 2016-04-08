{% if grains['os_family']=="Debian" %}

{% from "apache/map.jinja" import apache with context %}

include:
  - apache

apache_no-default-vhost:
  file.absent:
    - name: /etc/apache2/sites-enabled/000-default.conf
    - require:
      - pkg: apache
    - watch_in:
      - module: apache-reload

{% endif %}
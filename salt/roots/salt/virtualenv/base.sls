{% set home = pillar['home'] %}
{% set user = pillar['user'] %}

include:
  - python

# for matplotlib
libfreetype6-dev:
  pkg:
    - installed

pkg-config:
  pkg:
    - installed


virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

base_virtualenv:
  virtualenv.managed:
    - name: {{ home }}/env/
    - user: {{ user }}
    - no_chown: True
    - cwd: {{ home }}
    - system_site_packages: False
    - requirements: {{ pillar['req_dir'] }}/requirements/base.txt
    - require:
      - pip: virtualenv

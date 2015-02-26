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
    - requirements: {{ pillar['req_dir'] }}/requirements.txt
    - require:
      - pip: virtualenv

numpy:
  pip.installed:
    - name: numpy==1.9.1
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - virtualenv: base_virtualenv

matplotlib:
  pip.installed:
    - name: matplotlib==1.4.3
    - bin_env: {{ home }}/env/
    - user: {{ pillar['user'] }}
    - cwd: {{ home }}
    - require:
      - pip: numpy
      - pkg: libfreetype6-dev
      - pkg: pkg-config

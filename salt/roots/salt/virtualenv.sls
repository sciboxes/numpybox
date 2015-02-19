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

numpy_virtualenv:
  virtualenv.managed:
    - name: /home/vagrant/env/
    - user: vagrant
    - no_chown: True
    - cwd: /home/vagrant/lab/
    - system_site_packages: False
    - requirements: /vagrant/requirements.txt
    - verbose: True
    - require:
      - pip: virtualenv

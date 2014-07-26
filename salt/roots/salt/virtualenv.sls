virtualenv:
  pip.installed:
    - require:
      - pkg: python-pip

numpy_virtualenv:
  virtualenv.managed:
    - name: /home/vagrant/env/
    - user: vagrant
    - no_chown: True
    - cwd: /home/vagrant/src
    - system_site_packages: False
    - requirements: /home/vagrant/src/requirements.txt
    - verbose: True
    - require:
      - pip: virtualenv


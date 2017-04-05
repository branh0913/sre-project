{%set host = grains['host']%}

common_packages:
  pkg.installed:
    - pkgs:
      - nginx
      - vim
      - openssl
      - python-pip
      - python3-openssl
      - firewalld

pyopenssl:
  pip.installed:
    - name: pyOpenSSL
    - reload_modules: True
    - exists_action: i

nginx_firewall:
  firewalld.service:
    - name: nginx
    - ports:
      - 443/tcp
      - 80/tcp

nginx_conf:
  file.managed:
    - name: /etc/nginx/nginx.config
    - source: salt:///nginx-server/files/nginx.conf.jinja2
    - watch_in:
      service: nginx-service



nginx-service:
  service.running:
    - name: nginx
    - enable: true

subversion:
  pkg:
    - installed
    - require:
      - pkgrepo: svn_ppa

svn_ppa:
  pkgrepo.managed:
    - humanname: WANdisco Official WANdisco APT Repository
    - name: deb http://opensource.wandisco.com/ubuntu precise svn18
    - file: /etc/apt/sources.list.d/wandisco.list
    - key_url: 'http://opensource.wandisco.com/wandisco-debian.gpg'

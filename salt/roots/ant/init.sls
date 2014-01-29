ant:
  pkg:
    - installed
    - require:
      - pkg: oracle-java7-installer
ant-contrib:
  pkg:
    - installed
    - require:
      - pkg: ant

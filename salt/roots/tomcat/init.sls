tomcat7:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: tomcat7
      - file: /etc/tomcat/tomcat-users.xml
      - file.append: tomcat-config

/etc/tomcat/tomcat-users.xml:
  file.managed:
    - name: /etc/tomcat7/tomcat-users.xml
    - source: salt://tomcat/tomcat-users.xml
    - user: root
    - group: tomcat7
    - mode: 640
    - require:
      - pkg: tomcat7

tomcat7-admin:
  pkg:
    - installed

tomcat-config:
  file.append:
    - name: /etc/default/tomcat7
    - text:
      - JAVA_HOME=/usr/lib/jvm/java-7-oracle
      - JAVA_OPTS="-Xmx{{ pillar.get('java_opt_Xmx', '1024m') }} -XX:MaxPermSize={{ pillar.get('java_opt_MaxPermSize', '1024m') }}"

tomcat-service:
  service:
    - running
    - name: tomcat7
    - enable: True

wait-for-tomcatmanager:
  tomcat:
    - wait
    - timeout: 300
    - require:
      - service: tomcat-service

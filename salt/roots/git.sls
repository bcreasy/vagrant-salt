git:
  pkg:
    - installed
    - require:
      - pkgrepo: git_ppa

git_ppa:
  pkgrepo.managed:
    - humanname: Git Core PPA repository
    - ppa: git-core/ppa

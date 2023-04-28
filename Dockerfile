FROM ghcr.io/dockhippie/alpine:3.17
ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_VERSION=7.5.0

RUN apk update && \
  apk upgrade && \
  apk add git rsync openssh-client python3 python3-dev py3-pip py3-cryptography py3-psycopg2 && \
  pip3 install -U ansible==${ANSIBLE_VERSION} requests netaddr boto3 kubernetes PyMySQL && \
  rm -rf /var/cache/apk/* && \
  ansible-galaxy collection install kubernetes.core community.mysql community.postgresql amazon.aws

FROM webhippie/python:latest

ENTRYPOINT [""]
ENV PY_COLORS=1
ENV ANSIBLE_FORCE_COLOR=true

# renovate: datasource=pypi depName=ansible
ENV ANSIBLE_VERSION=4.3.0

RUN apk update && \
  apk upgrade && \
  apk add rsync openssh-client py3-requests py3-netaddr py3-boto3 py3-cryptography py3-kubernetes@testing py3-pymysql@testing libressl libressl-dev libffi-dev build-base && \
  pip3 install -U ansible==${ANSIBLE_VERSION} && \
  apk del libressl-dev libffi-dev build-base && \
  rm -rf /var/cache/apk/* && \
  ansible-galaxy collection install kubernetes.core community.mysql amazon.aws

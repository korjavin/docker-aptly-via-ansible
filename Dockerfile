FROM korjavin/korjavin-base
MAINTAINER Korjavin Ivan "korjavin@gmail.com"

RUN apt-get -y update
RUN apt-get install -y python-yaml python-jinja2 git
RUN git clone http://github.com/ansible/ansible.git /tmp/ansible
WORKDIR /tmp/ansible
ENV PATH /tmp/ansible/bin:/sbin:/usr/sbin:/usr/bin
ENV ANSIBLE_LIBRARY /tmp/ansible/library
ENV PYTHONPATH /tmp/ansible/lib:$PYTHON_PATH
RUN git clone --recursive  http://github.com/korjavin/ansible-clouds.git /tmp/example
ADD inventory /etc/ansible/hosts
WORKDIR /tmp/examples
RUN ansible-playbook aptly.yml -c local

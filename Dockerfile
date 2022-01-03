# pull base image
FROM python:alpine

RUN mkdir -p /etc/ansible  && \
    echo 'localhost' > /etc/ansible/hosts

RUN apk add --no-cache bind-tools curl git zip unzip bash-completion docker && \
    pip install boto3 awscli Jinja2 pytest PyYAML


CMD ["ansible-playbook", "--version"]

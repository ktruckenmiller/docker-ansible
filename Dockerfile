# pull base image
FROM python:alpine

RUN mkdir -p /etc/ansible && \
    echo 'localhost' > /etc/ansible/hosts

RUN apk add --no-cache \
    bind-tools \
    curl \
    git \
    zip \
    unzip \
    gcc \
    libc-dev \
    libffi-dev \
    python3-dev \
    bash-completion \
    docker && \
    pip install \
    ansible \
    boto3 \
    awscli \
    Jinja2 \
    pytest \
    PyYAML


CMD ["ansible-playbook", "--version"]

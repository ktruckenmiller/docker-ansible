# pull base image
FROM alpine:3.6

RUN apk --update add sudo                                         && \
    echo "===> Adding Python runtime..."  && \
    apk --update add python py-pip openssl ca-certificates    && \
    apk --update add --virtual build-dependencies \
                python-dev libffi-dev openssl-dev build-base  && \
    pip install --upgrade pip cffi                            && \
    pip install ansible  && \
    pip install --upgrade pywinrm                  && \
    apk --update add sshpass openssh-client rsync  && \
    echo "===> Removing package list..."  && \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*               && \
    mkdir -p /etc/ansible                        && \
    echo 'localhost' > /etc/ansible/hosts

RUN apk add --no-cache bind-tools curl git zip unzip bash-completion docker && \
    pip install boto3 awscli Jinja2 pytest PyYAML


CMD ["ansible-playbook", "--version"]

# Jenkins LTS 이미지를 기반으로 함
FROM jenkins/jenkins:lts

# root로 전환 (필요한 패키지 설치)
USER root

# 필수 패키지 설치
RUN dnf -y install dnf-plugins-core \
    && dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo \
    && dnf -y install docker-ce-cli git \
    && dnf clean all

# 다시 jenkins 사용자로 변경
USER jenkins


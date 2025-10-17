# 베이스 이미지
FROM jenkins/jenkins:lts

# Docker CLI 설치 (Jenkins 파드에서 Docker 명령어 사용 가능하게)
USER root
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean

# jenkins 사용자로 복귀
USER jenkins

# Jenkins에서 빌드 스크립트를 실행할 때 필요한 기본 설정
WORKDIR /var/jenkins_home

# 포트 노출
EXPOSE 8080 50000


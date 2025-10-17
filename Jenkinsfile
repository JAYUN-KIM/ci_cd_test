pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIAL = 'docker-hub-cred'
        IMAGE_NAME = 'jayunkim/ci_cd_test'
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }
        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIAL) {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }
    }
}



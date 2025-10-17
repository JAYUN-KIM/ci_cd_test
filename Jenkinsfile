pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-token'  // Jenkins Credential ID
        IMAGE_NAME = 'jayunkim/ci_cd_test'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/JAYUN-KIM/ci_cd_test.git', branch: 'main', credentialsId: 'github-token'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:${IMAGE_TAG}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        docker.image("${IMAGE_NAME}:${IMAGE_TAG}").push()
                    }
                }
            }
        }
    }
}


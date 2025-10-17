pipeline {
    agent any

    environment {
        // Docker Hub 로그인 정보 (Jenkins Credentials ID)
        DOCKERHUB_CREDENTIALS = 'dockerhub-token'
        DOCKER_IMAGE_NAME = 'jayunkim/ci_cd_test'
        DOCKER_TAG = 'latest'
    }

    stages {
        stage('Git Clone') {
            steps {
                echo 'Cloning GitHub repository...'
                git branch: 'main',
                    url: 'https://github.com/JAYUN-KIM/ci_cd_test.git',
                    credentialsId: 'github-token'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_TAG}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_TAG}").push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}


pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIAL = 'docker-hub-cred'  // Jenkins에 저장한 Docker Hub Credential ID
        IMAGE_NAME = 'jayunkim/ci_cd_test'            // Docker Hub Repo
    }

    stages {
        stage('GitHub Push Detected') {
            steps {
                echo 'GitHub Push Detected!'
            }
        }

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

        stage('Deploy via Argo CD') {
            steps {
                echo 'Deploying to Kubernetes via Argo CD...'
                // 여기에 Argo CD CLI 호출 명령어 또는 kubectl apply 등 추가 가능
            }
        }
    }
}


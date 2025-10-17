pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "jayunkim/ci_cd_test"
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/JAYUN-KIM/ci_cd_test.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-cred') {
                        def app = docker.build("${DOCKER_IMAGE}:${env.BUILD_NUMBER}")
                        app.push()
                    }
                }
            }
        }
    }
}


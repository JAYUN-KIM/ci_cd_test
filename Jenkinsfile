pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "jayunkim/ci_cd_test:latest" // Docker Hub repo 이름
    }

    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/JAYUN-KIM/ci_cd_test.git',
                    credentialsId: 'github-token',
                    branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo "Building Project..."
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-cred') {
                        def app = docker.build(DOCKER_IMAGE)
                        app.push()
                    }
                }
            }
        }
    }
}


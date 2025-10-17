pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git credentialsId: 'git', url: 'https://github.com/JAYUN-KIM/ci_cd_test.git', branch: 'main'
            }
        }
        stage('Build') {
            steps {
                echo 'Building Project...'
                // docker.build('jenkins-docker:cli') // <- 현재 주석 처리
            }
        }
    }
}


pipeline {
    agent any

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    docker run --rm -v $PWD:/usr/src/app -w /usr/src/app node:16 npm install
                '''
            }
        }

        stage('Build') {
            steps {
                sh '''
                    docker run --rm -v $PWD:/usr/src/app -w /usr/src/app node:16 npm run build
                '''
            }
        }

        stage('Test') {
            steps {
                sh '''
                    docker run --rm -v $PWD:/usr/src/app -w /usr/src/app node:16 npm test
                '''
            }
        }

        stage('Security Scan') {
            steps {
                sh '''
                    docker run --rm -v $PWD:/usr/src/app -w /usr/src/app node:16 npm install -g snyk
                    docker run --rm -v $PWD:/usr/src/app -w /usr/src/app node:16 snyk test
                '''
            }
        }
    }
}

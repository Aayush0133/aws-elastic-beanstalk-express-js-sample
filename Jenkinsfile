pipeline {
    agent any // Use 'label' if you have a specific agent preference

    stages {
        stage('Install Dependencies') {
            steps {
                docker.image('node:16').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                    sh 'npm install' 
                }
            }
        }

        stage('Build') {
            steps {
                docker.image('node:16').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                    sh 'npm run build' 
                }
            }
        }

        stage('Test') {
            steps {
                docker.image('node:16').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                    sh 'npm test' 
                }
            }
        }

        stage('Security Scan') {
            steps {
                docker.image('node:16').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                    sh 'npm install -g snyk' 
                    sh 'snyk test' 
                }
            }
        }
    }
}

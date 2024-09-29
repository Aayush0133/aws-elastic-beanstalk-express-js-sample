pipeline {
    agent {
        docker {
            image 'node:16'
            args '-v /var/run/docker.sock:/var/run/docker.sock'  // Allows Docker to communicate with host
        }
    }
    stages {
        stage('Install Dependencies') {
            steps {
                // Install dependencies from package.json using npm
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
                // Build the Node.js application using npm
                sh 'npm run build'
            }
        }
        stage('Test') {
            steps {
                // Run tests defined in the Node.js project
                sh 'npm test'
            }
        }
        stage('Security Scan') {
            steps {
                // Install Snyk and perform a security scan
                sh 'npm install -g snyk'
                sh 'snyk test'
            }
        }
    }
}

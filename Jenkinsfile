pipeline {
    agent {
        docker {
            image 'node:16'   // Use Node.js 16 Docker image
            args '-v /var/run/docker.sock:/var/run/docker.sock'   // Mount Docker socket
        }
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'   // Install npm dependencies
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'  // Run the build process
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'  // Run the test process
            }
        }
        stage('Security Scan') {
            steps {
                sh 'npm install -g snyk'   // Install Snyk globally
                sh 'snyk test'   // Run the Snyk security scan
            }
        }
    }
}

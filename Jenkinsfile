pipeline {
    agent {
        docker {
            image 'node:16'   // Use Node.js 16 Docker image
            args '-v /var/run/docker.sock:/var/run/docker.sock'  // Mount Docker socket for container use if needed
        }
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'  // Install project dependencies
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'  // Run the build process
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'  // Run tests
            }
        }
        stage('Security Scan') {
            steps {
                sh 'npm install -g snyk'  // Install Snyk globally
                sh 'snyk test'  // Run a security scan on dependencies
            }
        }
    }
    post {
        always {
            echo 'Pipeline completed.'
        }
        success {
            echo 'Build, test, and security scan successful!'
        }
        failure {
            echo 'There was a problem with the pipeline.'
        }
    }
}

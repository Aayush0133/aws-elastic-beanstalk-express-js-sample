pipeline {
    agent any  // Use any available Jenkins agent
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
                sh 'snyk test'  // Run a security scan
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

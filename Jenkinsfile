pipeline {
    agent {
        any {
            image 'node:16'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'  // Install the project dependencies from package.json
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'  // Run the build script (if defined in package.json)
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'  // Run the test script (if defined in package.json)
            }
        }
        stage('Security Scan') {
            steps {
                sh 'npm install -g snyk'  // Install Snyk globally
                sh 'snyk test'  // Run Snyk to check for vulnerabilities in dependencies
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

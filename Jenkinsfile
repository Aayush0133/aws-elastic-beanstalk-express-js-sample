pipeline {
    agent {
        docker {
            image 'node:16'  // Use Node.js 16 Docker image as the build agent
            args '-u root:root'  // Run as root to avoid permission issues when installing dependencies
        }
    }
    environment {
        SNYK_TOKEN = credentials('snyk-api-token')  // Load Snyk API token from Jenkins credentials
    }
    stages {
        stage('Checkout Code') {
            steps {
                // Clone the repository from GitHub
                git branch: 'main', url: 'https://github.com/Aayush0133/aws-elastic-beanstalk-express-js-sample.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                // Install project dependencies using npm
                sh 'npm install --save'
            }
        }
        stage('Run Tests') {
            steps {
                // Run tests (if available in the package.json file)
                sh 'npm test'
            }
        }
        stage('Security Scan') {
            steps {
                // Install the Snyk CLI tool globally
                sh 'npm install -g snyk'
                // Authenticate with Snyk using the Snyk token
                sh 'snyk auth $SNYK_TOKEN'
                // Perform a security scan of project dependencies
                sh 'snyk test'
            }
        }
    }
    post {
        always {
            // Always archive any build logs, even if the build fails
            archiveArtifacts artifacts: 'logs/*.log', allowEmptyArchive: true
        }
        success {
            echo 'Build and test succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}

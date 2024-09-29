pipeline {
    agent {
        docker {
            image 'node:16'  // Using Node 16 as the agent
            args '-u root:root'  // Run as root to install dependencies
        }
    }
    environment {
        SNYK_TOKEN = credentials('snyk-api-token')  // Snyk API token from Jenkins credentials
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install --save'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test'  // Assuming there are tests in your application
            }
        }
        stage('Security Scan') {
            steps {
                sh 'npm install -g snyk'
                sh 'snyk auth $SNYK_TOKEN'
                sh 'snyk test'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('node-app-image:latest')  // Build Docker image of your Node.js app
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Command to deploy your app to a server or cloud platform like AWS or Elastic Beanstalk
                    sh 'echo "Deployment step goes here..."'
                }
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'logs/*.log', allowEmptyArchive: true
            junit '**/test-results.xml'
        }
        success {
            echo 'Pipeline succeeded!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}

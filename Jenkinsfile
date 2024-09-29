pipeline {
  agent { docker { image 'node:16' } }  // Use Node.js version 16 as the build agent

  stages {
    stage('Install Dependencies') {
      steps {
        sh 'npm install'  // Install all dependencies using npm
      }
    }

    stage('Build') {
      steps {
        sh 'npm run build'  // Build the application (if applicable)
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'  // Run tests (if defined in package.json)
      }
    }

    stage('Security Scan') {
      steps {
        sh 'npm install -g snyk'  // Install Snyk security tool globally
        sh 'snyk test'  // Scan for security vulnerabilities
      }
    }
  }
}

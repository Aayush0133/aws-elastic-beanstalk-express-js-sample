pipeline {
  agent { docker { image 'node:16' } } // Node.js 16 environment

  stages {
    stage('Install Dependencies') {
      steps {
        sh 'npm install'  // Install dependencies
      }
    }

    stage('Build') {
      steps {
        sh 'npm run build'  // Build the application
      }
    }

    stage('Test') {
      steps {
        sh 'npm test'  // Run tests
      }
    }
  }
}


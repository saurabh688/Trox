pipeline {
  agent {
    node {
      label 'build'
    }

  }
  stages {
    stage('build') {
      steps {
        sh 'npm build'
      }
    }

  }
}
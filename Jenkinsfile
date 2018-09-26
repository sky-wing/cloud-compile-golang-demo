pipeline {
  agent {
    docker {
      image 'centos'
    }

  }
  stages {
    stage('stage1') {
      parallel {
        stage('stage1') {
          steps {
            sh 'one'
          }
        }
        stage('stage2') {
          steps {
            echo '123'
          }
        }
      }
    }
    stage('stage3') {
      steps {
        sleep 3
      }
    }
  }
  environment {
    env = 'org'
  }
}
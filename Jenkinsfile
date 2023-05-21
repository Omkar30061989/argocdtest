pipeline {
  agent any
  
  environment {
    DOCKERHUB_USERNAME = credentials('dockerhub-username')
    DOCKERHUB_PASSWORD = credentials('dockerhub-password')
  }

  stages {
    stage('Build Docker Image') {
      steps {
        script {
          // Build the Docker image
          sh "docker build -t omkargujar30/firstrepo/my-image:21.5 ."
        }
      }
    }

    stage('Push Docker Image to Docker Hub') {
      steps {
          script {

            // Login to Docker Hub
            sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"

            // Push the Docker image to Docker Hub
            sh "docker push omkargujar30/firstrepo/my-image:21.5"
          }
        }
      }
    }
  }

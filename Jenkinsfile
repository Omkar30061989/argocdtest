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
          sh "docker build -t my-image:21.5 ."
        }
      }
    }

    stage('Push Docker Image to Docker Hub') {
      steps {
          script {

            // Login to Docker Hub
            sh "docker login -u ${dockerhubUsername} -p ${dockerhubPassword}"

            // Push the Docker image to Docker Hub
            sh "docker push my-image:21.5"
          }
        }
      }
    }
  }
}

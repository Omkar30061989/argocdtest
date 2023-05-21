pipeline {
  agent any

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
        withCredentials([file(credentialsId: 'dockerhub', variable: 'DOCKERHUB_CREDENTIALS')]) {
          script {
            def credentialsContent = readFile(file: "${DOCKERHUB_CREDENTIALS}")
            def credentials = credentialsContent.split(':')
            def dockerhubUsername = credentials[0].trim()
            def dockerhubPassword = credentials[1].trim()

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

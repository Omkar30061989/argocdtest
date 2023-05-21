pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t gcr.io/alert-vista-383906/my-first-nodejs:1.0 .'
            }
        }
        
   stage('Authenticate Docker with Google Cloud Registry') {
      steps {
        // Configure Docker to authenticate with Google Cloud Registry
        withCredentials([string(credentialsId: 'gcr-service-account-key', variable: 'GCR_KEY')]) {
          sh '''
            echo $GCR_KEY | base64 --decode > /tmp/key.json
            docker login -u _json_key --password-stdin https://gcr.io < /tmp/key.json
          '''
        }
      }
    }

    stage('Push Docker Image to Artifact Registry') {
      steps {
        script {
          // Push the Docker image to Artifact Registry
          sh 'docker push gcr.io/alert-vista-383906/my-first-nodejs:1.0'
        }
      }
    }
  }
}

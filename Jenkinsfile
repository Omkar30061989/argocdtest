pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t gcr.io/alert-vista-383906/my-first-nodejs:1.0 .'
            }
        }

    stage('Configure Google Cloud SDK') {
      steps {
        // Install and configure Google Cloud SDK
        // Make sure you have the necessary Google Cloud credentials and set up the required permissions.
        // You may need to install additional Jenkins plugins for this step.
        withGoogleCloudSDK(credentialsId: 'gcr-service-account-key', installation: 'your-gcloud-installation') {
          // Set the Google Cloud project ID
          sh 'gcloud config set project alert-vista-383906'
        }
      }
    }

        
   stage('Authenticate Docker with Google Cloud Registry') {
      steps {
        // Configure Docker to authenticate with Google Cloud Registry
        withCredentials([file(credentialsId: 'gcr-service-account-key', variable: 'GCR_KEY')]) {
          sh '''
            echo $GCR_KEY | base64 --decode > /tmp/key.json
            gcloud auth activate-service-account --key-file=/tmp/key.json
            gcloud auth configure-docker
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

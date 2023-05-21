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
        withGoogleCloudSDK(credentialsId: 'your-gcp-credentials-id', installation: 'your-gcloud-installation') {
          // Set the Google Cloud project ID
          sh 'gcloud config set project alert-vista-383906'
        }
      }
    }

    stage('Push Docker Image to Artifact Registry') {
      steps {
        script {
          // Configure Docker to authenticate with Google Cloud Registry
          sh 'gcloud auth configure-docker --quiet'

          // Push the Docker image to Artifact Registry
          sh 'docker push gcr.io/alert-vista-383906/my-first-nodejs:1.0'
        }
      }
    }
  }
}

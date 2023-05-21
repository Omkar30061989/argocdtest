pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t gcr.io/alert-vista-383906/my-first-nodejs:1.0 .'
            }
        }

     stage('Push Docker Image to GCR') {
      steps {
        script {
          // Authenticate Docker with GCR
          withCredentials([file(credentialsId: 'my-gcp-credentials-id', variable: 'GCR_KEY')]) {
            sh '''
              docker login -u _json_key --password-stdin ${GCR_HOST} < $GCR_KEY
              docker push gcr.io/alert-vista-383906/my-first-nodejs:1.0
              }
         }
     }

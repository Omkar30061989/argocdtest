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
              cp $GCR_KEY /tmp/key.json
              gcloud auth activate-service-account --key-file=/tmp/key.json
              gcloud auth configure-docker
              docker push gcr.io/alert-vista-383906/my-first-nodejs:1.0
              '''
              }
         }
     }
   }
  }
}

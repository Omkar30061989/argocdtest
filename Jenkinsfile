pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t gcr.io/alert-vista-383906/my-first-nodejs:1.0 .'
            }
        }
        
        stage('Push to GCR') {
            steps {
                withCredentials([string(credentialsId: 'gcr-service-account-key', variable: 'GCR_SERVICE_ACCOUNT_KEY')]) {
                    sh 'echo $GCR_SERVICE_ACCOUNT_KEY | base64 --decode > gcr-key.json'
                    sh 'gcloud auth activate-service-account --key-file=gcr-key.json'
                    sh 'gcloud auth configure-docker'
                    sh 'docker push docker build -t gcr.io/alert-vista-383906/my-first-nodejs:1.0'
                }
            }
        }
    }
}

pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t <gcr-hostname>/<project-id>/<image-name>:<tag> .'
            }
        }
        
        stage('Push to GCR') {
            steps {
                withCredentials([string(credentialsId: 'gcr-service-account-key', variable: 'GCR_SERVICE_ACCOUNT_KEY')]) {
                    sh 'echo $GCR_SERVICE_ACCOUNT_KEY | base64 --decode > gcr-key.json'
                    sh 'gcloud auth activate-service-account --key-file=gcr-key.json'
                    sh 'gcloud auth configure-docker'
                    sh 'docker push <gcr-hostname>/<project-id>/<image-name>:<tag>'
                }
            }
        }
    }
}

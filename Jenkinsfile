pipeline {
  agent any
  environment {
    CLOUDSDK_CORE_PROJECT='laboratorio-final-410316'
  }
  stages {
    stages ('test'){
      steps{
        withCredentials([file(credentialsID: 'lab-final-gcp', variable: 'LAB_FINAL_GCP')]){
          sh '''
            gcloud version
            gcloud auth activate-service-account --key-file="$LAB_FINAL_GCP"
            gcloud compute zones list
          '''        

      }
    }
  }
}





pipeline {
  agent any
  environment {
    CLOUDSDK_CORE_PROJECT='laboratorio-final-410316'
    CLIENT_EMAIL='lab-final@laboratorio-final-410316.iam.gserviceaccount.com'
  }
    stage('Conect with gcloud') {
      steps {
        withCredentials([file(credentialsID: 'lab-final-gcp', variable: 'LAB_FINAL_GCP')]){
          sh '''
            gcloud version
            gcloud auth activate-service-account --key-file="$LAB_FINAL_GCP"
          '''
        }
      }
    } 
post {
  always {
    sh 'gcloud auth revoke $CLIENT_EMAIL'
  }
}

    stage('Plan changes') {
      steps {
        sh 'terraform init'
        sh "terraform plan -target=google_compute_instance -var-file=\"vars/${params.environment}.tfvars\""
      }
    }

    stage('Apply changes') {
      when {
        expression { return input.result == 'yes' || input.result == 'true' }
      }
      steps {
        sh "terraform apply -target=google_compute_instance -var-file=\"vars/${params.environment}.tfvars\""
      }
    }

/*    stage('Destroy resource') {
      steps {
        sh "terraform destroy -target=google_compute_instance -var-file=\"vars/${params.environment}.tfvars\""
      }
    }
  }*/

  post {
    success {
      echo 'VM deployed and destroyed successfully!'
    }
    failure {
      echo 'Deployment or destruction failed! Investigate the logs.'
    }
  }
}



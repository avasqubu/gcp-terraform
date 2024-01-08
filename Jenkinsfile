pipeline {
  agent any
  tools{
    terraform 'Terraform'
  }
  environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials ('lab-final-gcp')
  }
  stages {

    stage('Plan changes') {
      steps {
        sh 'terraform init'
        sh "terraform plan"
      }
    }

    stage('Review changes (optional)') {
      input message: 'Do you want to apply the changes?', submitButton: 'Apply'
    }

    stage('Apply changes') {
      when {
        expression { return input.result == 'yes' || input.result == 'true' }
      }
      steps {
        sh "terraform apply -target=google_compute_instance -var-file=\"vars/${params.environment}.tfvars\""
      }
    }

 /*   stage('Destroy resource') {
      steps {
        sh "terraform destroy -target=google_compute_instance -var-file=\"vars/${params.environment}.tfvars\""
      }
    }
  }

  post {
    success {
      echo 'VM deployed and destroyed successfully!'
    }
    failure {
      echo 'Deployment or destruction failed! Investigate the logs.'
    }
  }*/
}
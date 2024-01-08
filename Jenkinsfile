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

    stage('Apply changes') {
      steps {
        sh "terraform apply -auto-approve"
      }
    }

    stage('Destroy resource') {
      steps {
        sh "terraform destroy -auto-approve"
      }
    }
  }
}
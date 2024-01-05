pipeline {
  agent any

  parameters {
    string(name: 'project_id', defaultValue: 'maquina-virtual', description: 'GCP project ID')
    string(name: 'region', defaultValue: 'us-central1', description: 'GCP region')
    string(name: 'zone', defaultValue: 'us-central1', description: 'GCP zone')
    string(name: 'machine_type', defaultValue: 'n1-standard-1', description: 'GCP machine type')
    string(name: 'os_image', defaultValue: 'debian-cloud/debian-11', description: 'GCP OS image')
    string(name: 'ssh_key_file', defaultValue: '/path/to/ssh/key/file', description: 'Path to SSH key file')
  }

  stages {
    stage('Checkout code') {
      steps {
        git branch: 'master'
      }
    }

    stage('Plan changes') {
      steps {
        sh 'terraform init'
        sh "terraform plan -target=google_compute_instance -var-file=\"vars/${params.environment}.tfvars\""
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

    stage('Destroy resource') {
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
  }
}

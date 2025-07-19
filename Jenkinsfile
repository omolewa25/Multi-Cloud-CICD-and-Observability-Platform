pipeline {
  agent any

  environment {
    AWS_REGION = 'us-east-1'
    TF_VAR_github_repo = 'multi-cloud-platform'
  }

  options {
    timestamps()
    ansiColor('xterm')
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Init Terraform') {
      steps {
        sh 'terraform init'
      }
    }

    stage('Validate') {
      steps {
        sh 'terraform validate'
      }
    }

    stage('Format Check') {
      steps {
        sh 'terraform fmt -check'
      }
    }

    stage('Lint and Security Checks') {
      steps {
        sh 'tflint'
        sh 'tfsec .'
        sh 'checkov -d .'
      }
    }

    stage('Terraform Plan') {
      steps {
        sh 'terraform plan'
      }
    }

    stage('Terraform Apply') {
      when {
        branch 'main'
      }
      steps {
        sh 'terraform apply -auto-approve'
      }
    }
  }

  post {
    always {
      echo 'Pipeline execution completed.'
    }
  }
}

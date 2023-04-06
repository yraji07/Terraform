
pipeline {
    agent { lable 'JDK-17' }
    
    stages { 
        stage ('build') {
            steps {
                git url: "https://github.com/yraji07/Terraform.git",
                    branch: 'main'
            }
        }
        stage ('steps') {
            steps {
                sh 'terraform init'
                sh 'terraform fmt'
                sh 'terraform validate'
                sh 'terraform apply --auto-approve'
            }
        }
    }
    
}
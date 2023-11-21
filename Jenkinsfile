pipeline{
    
    agent{
        label 'workernode1'
    }
    stages{
        stage('Git Checkout'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Research-Associate-Internship/Vault-Rac3.git']])
            }
        }
        stage('Terraform init'){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: 'aws_credentials']]) {
                    
                    sh 'terraform init -upgrade' // initializes your terraform env
              }
            }
        }
        stage('Terraform plan'){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: 'aws_credentials']]) {
                    sh 'terraform plan '
                }
            }
        }
        stage('Terraform apply'){
            steps{
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding',credentialsId: 'aws_credentials']]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        
        
    }
}

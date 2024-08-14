@Library('my-shared-lib') _
pipeline {
    agent any
    
    // environment {
    //     KUBECONFIG = credentials('kubeconfig-id') // Use Jenkins credentials for Kubernetes
    //     DOCKER_IMAGE = "my-app-image:latest"
    //     DEPLOYMENT_NAME = "my-app-deployment"
    //     NAMESPACE = "my-app-namespace"
    // }
    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/Destroy' ) 
        }


    stages {
        stage('Checkout') {
            when {expression { params.action=='create'}}
            steps {
                // git 'https://github.com/prafullb007/JAVA-MAVEN-WEB-APP.git'
                gitCheckout(
                    branch: "master",
                    url: "https://github.com/prafullb007/JAVA-MAVEN-WEB-APP.git"
                )
            }
        }
        
        stage('Unit Testing') {
            when {expression { params.action=='create'}}
            steps {
                script{
                    mvnTest()
                }
                
            }
        }
        
        stage('Maven Integration') {
            when {expression { params.action=='create'}}
            steps {
                script{
                    mvnintegrationTest()
                }
                
            }    
        }
        stage('Static Code Analysis: Sonaqube') {
            when {expression { params.action=='create'}}
            steps {
                script{
                    def sonarqubecredentialsId='sonarcube-api'
                    statiCodeAnalysis(sonarqubecredentialsId)
                }
                
            }    
        }
        stage('Quality Gates Status Check: Sonaqube') {
            when {expression { params.action=='create'}}
            steps {
                script{
                    def sonarqubecredentialsId='sonarcube-api'
                    statiCodeAnalysis(sonarqubecredentialsId)
                }
                
            }    
        }
    }
    
}

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
        when {expression { choice.action=='create'
        }}
        stage('Checkout') {
            steps {
                // git 'https://github.com/prafullb007/JAVA-MAVEN-WEB-APP.git'
                gitCheckout(
                    branch: "master",
                    url: "https://github.com/prafullb007/JAVA-MAVEN-WEB-APP.git"
                )
            }
        }
        when {expression { choice.action=='create'
        }}
        stage('Unit Testing') {
            steps {
                script{
                    mvnTest()
                }
                
            }
        }
        when {expression { choice.action=='create'
        }}
        stage('Maven Integration') {
            steps {
                script{
                    mvnintegrationTest()
                }
                
            }    
        }
    }
    
}

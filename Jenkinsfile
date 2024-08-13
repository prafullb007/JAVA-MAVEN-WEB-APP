pipeline {
    agent any
    
    // environment {
    //     KUBECONFIG = credentials('kubeconfig-id') // Use Jenkins credentials for Kubernetes
    //     DOCKER_IMAGE = "my-app-image:latest"
    //     DEPLOYMENT_NAME = "my-app-deployment"
    //     NAMESPACE = "my-app-namespace"
    // }

    stages {
        stage('Checkout') {
            steps {
                // git 'https://github.com/prafullb007/JAVA-MAVEN-WEB-APP.git'
                gitCheckout{
                    branch: "master",
                    url: "https://github.com/prafullb007/JAVA-MAVEN-WEB-APP.git"
                }
            }
        }
    }
}

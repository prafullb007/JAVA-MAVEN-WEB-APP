@Library('my-shared-lib') _
pipeline {
    agent any
    parameters{
        choice(name: 'action', choices: 'create\ndelete', description: 'choose create/Destroy' ) 
        string(name: 'ImageName', description: 'name of the docker build', defaultValue: 'springboot')
        string(name: 'ImageTag', description: 'tag of the docker build', defaultValue: 'v1')
        string(name: 'DockerHubUser', description: 'name of the appliction', defaultValue: 'prafullb007')
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
        
        // stage('Unit Testing') {
        //     when {expression { params.action=='create'}}
        //     steps {
        //         script{
        //             mvnTest()
        //         }
                
        //     }
        // }
        
        // stage('Maven Integration') {
        //     when {expression { params.action=='create'}}
        //     steps {
        //         script{
        //             mvnintegrationTest()
        //         }
                
        //     }    
        // }
        // stage('Static Code Analysis: Sonaqube') {
        //     when {expression { params.action=='create'}}
        //     steps {
        //         script{
        //             def sonarqubecredentialsId='sonarcube-api'
        //             statiCodeAnalysis(sonarqubecredentialsId)
        //         }
                
        //     }    
        // }
        // stage('Quality Gates Status Check: Sonaqube') {
        //     when {expression { params.action=='create'}}
        //     steps {
        //         script{
        //             def sonarqubecredentialsId='sonarcube-api'
        //             QualityGateStatus(sonarqubecredentialsId)
        //         }
                
        //     }    
        // }
        // stage('Maven Build : Maven') {
        //     when {expression { params.action=='create'}}
        //     steps {
        //         script{
        //             mvnBuild()
        //         }
                
        //     }
        // }
        stage('Docker Image Build') {
            when {expression { params.action=='create'}}
            steps {
                script{
                    dockerBuild("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
                }
                
            }
        }
        stage('Docker Image Scan') {
            when {expression { params.action=='create'}}
            steps {
                script{
                    dockerImageScan("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
                }
                
            }
        }
        stage('Docker Image Push') {
            when {expression { params.action=='create'}}
            steps {
                script{
                    dockerImagePush("${params.ImageName}","${params.ImageTag}","${params.DockerHubUser}")
                }
                
            }
        }
    }
    
}

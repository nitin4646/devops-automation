pipeline {
    agent any
    tools{
        maven 'Maven2802'
    }
      stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nitin4646/devops-automation']]])
                bat "mvn clean install"
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t nitin4646/git-docker-k8spipeline231223i .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'DockerHubk8s1', variable: 'dockerhubpswd1')]){
                    bat "docker login -u nitin4646 -p ${dockerhubpswd1}"
                    }
                    bat 'docker push nitin4646/git-docker-k8spipeline231223i'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    kubernetesDeploy (configs: 'deploymentservice.yaml', kubeconfigId: "awsk8snew2")
                }
            }
        }
    }
}

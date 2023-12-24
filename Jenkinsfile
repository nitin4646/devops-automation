pipeline {
    agent any
    tools{
        maven 'Maven2802'
    }
      stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/nitin4646/devops-automation']]])
                sh "mvn clean install"
            }
        }
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker build -t nitin4646/git-docker-k8spipeline231223i .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'DockerHub123', variable: 'dockerhubpswd1')]){
                    sh "docker login -u nitin4646 -p ${dockerhubpswd1}"
                    }
                    sh 'docker push nitin4646/git-docker-k8spipeline231223i'
                }
            }
        }
        stage('Deploy to k8s'){
            steps{
                script{
                    sh 'kubectl apply -f deploymentservice.yaml'
    // some block
}
            }
        }
    }
}

pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
              // Get some code from a GitHub repository
              git 'https://github.com/rahul-inti/Game.git'  
            }
        }
        stage('Build') {
            steps {
              // Run Maven on a Unix agent.
              sh "mvn -Dmaven.test.failure.ignore=true clean package"
            }
        }
        stage('Docker installing') {
            steps {
              // Installing doker.
              //sh "sudo apt-get update"
              //sh "sudo apt-get remove -y docker docker-engine docker.io"
              //sh "sudo apt install -y docker.io"
              sh "sudo docker --version"
              echo " Buidnumber ${env.BUILD_NUMBER} Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
            }
        }
        stage('Build Docker image') {
            steps {
              // Run Maven on a Unix agent.
              sh "sudo docker build -t rahulinti123/my-app:${env.BUILD_NUMBER} ."
               
            }
        }

        stage('Push Docker image') {
            steps { 
               withCredentials([string(credentialsId: 'Dockerpass', variable: 'Dockerhub')]) {
               sh "sudo docker login -u rahulinti123 -p ${Dockerhub}"
               sh "sudo docker push rahulinti123/my-app:${env.BUILD_NUMBER}"
               sh "sudo docker run -p 8083:8080 -d rahulinti123/my-app:${env.BUILD_NUMBER}"
          }
        }  
       }   
    }
}   
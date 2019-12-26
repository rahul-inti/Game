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
              sh "sudo apt-get update"
              sh "sudo apt-get remove docker docker-engine docker.io"
              sh "sudo apt install -y docker.io"
            }
        }
    }
}
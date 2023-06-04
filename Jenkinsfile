pipeline {
    agent any 
    tools {
        maven "Maven 3.8.5"
    
    }
    stages {
        stage('Compile and Clean') { 
            steps {
               sh "mvn clean compile"
            }
        }
        stage('deploy') { 
            steps {
                sh "mvn clean package"
            }
        }
        
        stage('Build Docker image'){
            steps {
              
                sh 'docker build -t  anvbhaskar/docker_jenkins_springboot:${BUILD_NUMBER} .'
            }
        }
        stage('Docker Login'){
            
            steps {
                 withCredentials([string(credentialsId: 'Dockerid', variable: 'Dockerpwd')]) {
                    sh "docker login -u raghumugali -p ${Dockerpwd}"
                }
            }                
        }
        stage('Docker Push'){
            steps {
                sh 'docker push raghumugali/docker_jenkins_springboot:${BUILD_NUMBER}'
            }
        }
        stage('Docker deploy'){
           steps{
             sh 'docker run -itd -p 9090:9090 raghumugali/docker_jenkins_springboot:${BUILD_NUMBER}'
          }
       }
        stage('Archving') { 
            steps {
                 archiveArtifacts '**/target/*.jar'
            }
        }
    }
}

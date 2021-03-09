#!groovy
// Run docker build

properties([disableConcurrentBuilds()])

pipeline {
    agent any
    triggers { pollSCM('* * * * *') }
    options {
	    	buildDiscarder(logRotator(numToKeepStr: '10', artifactNumToKeepStr: '10'))
	    	timestamps()
	}
    stages {
         stage("Docker Login") {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker_creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    echo " ============== docker login =================="
                    sh '''
                    docker login -u $USERNAME -p $PASSWORD
                    '''
                }
            }
        }
        stage('Build docker image for App') {
            steps{
                    
                    echo " ============== docker build =================="
                    sh '''
                    docker build -t voopnok/oms-db:latest . 
                    '''
                    
                
            }
        }
        stage("Docker Push") {
            steps {
                echo " ============== start pushing image =================="
                sh '''
                docker push voopnok/oms-db:latest
                '''
            }
        }
    }
}

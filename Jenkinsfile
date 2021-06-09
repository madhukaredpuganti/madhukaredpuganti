pipeline {
    
    agent any

    tools {
        maven 'maven 3.8.1'
        jdk 'jdk8'
    }
    
    stages {
        
        stage('Test Pipeline') {            
            steps {
                sh 'echo "My project is under test state"'                
            }            
        }
        
        stage('Clone') {            
            steps {
                git branch: 'main', changelog: true, poll: true, url: 'git@github.com:madhukaredpuganti/madhukaredpuganti.git'             
            }            
        }

        stage('Build') {
            
            steps {
                withMaven {
                    sh "mvn clean verify"
                }
            }
            
        }
    }
    
    post {
        always {
            echo "Alway send notify"
        }
        success {
            echo "Build Success"
        }
        failure {
            echo "Build failure"
        }
    }
    
    
    
}
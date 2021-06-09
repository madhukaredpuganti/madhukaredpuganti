pipeline {
    
    agent any

    tools {
        maven 'MAVEN_SERVICE'
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

        stage('Build & Package') {            
            steps {
                withMaven {
                    sh "mvn clean package"
                }
            }            
        }

        stage('Cloud Build') {            
            steps {
               googleCloudBuild \
                    credentialsId: 'my-project',
                    source: local('src'),
                    request: file('cloudbuild.yaml'),
                    substitutions: [
                      _CUSTOM1: message,
                      _CUSTOM2: "Lorem ipsum, dolor sit amet."
                 ]  
            }            
        }

        stage

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
pipeline {
    
    agent any

    tools {
        maven 'MAVEN_SERVICE'
        jdk 'jdk8'
    }
    
    environment {
        PROJECT_ID = 'cto-opus-frictionless-lab'
        CLUSTER_NAME = 'kube'
        LOCATION = 'test'
        CREDENTIALS_ID = 'cto-opus-frictionless-lab'
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

        stage('Image') {            
            steps {
              googleCloudBuild credentialsId: 'cto-opus-frictionless-lab-47f9', request: file('cloudbuild.yaml')
//                googleCloudBuild credentialsId: 'cto-opus-frictionless-lab-47f9', request: inline('''steps:
//   - name: ubuntu
//     args: [echo]''')
            }            
        }

        stage('Deploy TO gke') {

          steps {
                       sh 'echo "My project is under test state"'     
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
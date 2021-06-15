pipeline {
    
    agent any

    tools {
        maven 'MAVEN_SERVICE'
        jdk 'jdk8'
    }
    
    environment {
        PROJECT_ID = 'cto-opus-frictionless-lab-47f9'
        CLUSTER_NAME = 'example-private-cluster'
        LOCATION = 'northamerica-northeast1-a'
        CREDENTIALS_ID = 'cto-opus-frictionless-lab-47f9'
        VERSION = '1.0.2'
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
                    //sh "mvn clean package"
                    sh '''
                    ls
                    pwd
                    '''
                }
            }            
        }

        stage('Image') {            
            steps {
                googleCloudBuild credentialsId: 'cto-opus-frictionless-lab-47f9', request: file('cloudbuild.yaml'), source: local('/bitnami/jenkins/home/workspace/microservice-build-deploy'), substitutions: [_SUB_VALUE: '1.0.4']
                //googleCloudBuild credentialsId: 'cto-opus-frictionless-lab-47f9', request: file('cloudbuild.yaml'), source: local('/bitnami/jenkins/home/workspace/microservice-build-deploy')
                //googleCloudBuild credentialsId: 'cto-opus-frictionless-lab-47f9', request: file('cloudbuild.yaml'), source: repo(branch: 'dev', projectId: 'cto-opus-frictionless-lab-47f9', repoName: 'github_telus-csd-tvs_testrepo')
              //googleCloudBuild credentialsId: 'cto-opus-frictionless-lab-47f9', request: file('cloudbuild.yaml')
//                googleCloudBuild credentialsId: 'cto-opus-frictionless-lab-47f9', request: inline('''steps:
//   - name: ubuntu
//     args: [echo]''')
            }            
        }

        stage('Deploy TO gke') {

          steps {
                       sh 'echo "My project is under test state"'  
                      
                            step([
                            $class: 'KubernetesEngineBuilder',
                            projectId: env.PROJECT_ID,
                            clusterName: env.CLUSTER_NAME,
                            location: env.LOCATION,
                            manifestPattern: 'manifest.yaml',
                            credentialsId: env.CREDENTIALS_ID,
                            verifyDeployments: true])  
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
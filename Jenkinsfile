pipeline {
    
    agent any
    
    stages {
        
        stage('Test Pipeline') {
            
            steps {
                sh 'echo "My project is under test state"'
                
            }
            
        }
        
        stage('Clone') {
            
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'git@github.com:madhukaredpuganti/madhukaredpuganti.git'
                sh 'echo "Clone stage"'
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
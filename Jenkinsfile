pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/Srinivasdhanu/jenkins-demo.git'
            }
        }
        
        stage('Maven Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        
        stage('Docker Build') {
            steps {
                sh 'docker build . -t srinivaskollipaka/test:1.0.4'
            }
        }
        
        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'Docker', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u srinivaskollipaka -p ${dockerhubpwd}'
                }
                sh 'docker push srinivaskollipaka/test:1.0.4'
            }
        }
    }
}

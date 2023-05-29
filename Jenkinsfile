pipeline {
    
    agent any

    stages {
        stage('clone the repo') {
            steps {
                git 'https://github.com/prasadnl/dockerContent.git'
            }
        }
        stage('build the image') {
            steps {
                sh 'docker build -t myimage03 .'
            }
        }
        stage('push the image to dockerhub') {
            steps {
                sh 'docker login -u admin -p admin'
                sh 'docker tag myimage03 prasadnl/myimage03'
                sh 'docker push prasadnl/myimage03'
            }
        }
        stage('create container') {
            steps {
                sh 'docker run -d -P -v myhtml:/usr/local/apache2/htdocs myimage03'
            }
        }

    }
}

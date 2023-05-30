pipeline {
    
    agent any
    parameters {
        string(name: "IMAGE_NAME", defaultValue: "myimage01", trim: true, description: "Name of the Docker Image to be created")
    }

    stages {
        stage('clone the repo') {
            steps {
                git 'https://github.com/prasadnl/dockerContent.git'
            }
        }
        stage('build the image') {
            steps {
                sh 'docker build -t ${params.IMAGE_NAME} .'
            }
        }
        stage('push the image to dockerhub') {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_HUB_PWD', variable: 'DOCKER_HUB_PWD')]) {
                    sh 'docker login -u prasadnl -p ${DOCKER_HUB_PWD}'
                }
                sh 'docker tag myimage01 prasadnl/${params.IMAGE_NAME}'
                sh 'docker push prasadnl/${params.IMAGE_NAME}'
            }
        }
        stage('create container') {
            steps {
                sh 'docker run -d -P -v myhtml:/usr/local/apache2/htdocs ${params.IMAGE_NAME}'
            }
        }

    }
}

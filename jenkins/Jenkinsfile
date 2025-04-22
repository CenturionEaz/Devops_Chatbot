pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'chatbot-app'
        CONTAINER_NAME = 'chatbot'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/CenturionEaz/Devops_Chatbot.git'
            }
        }

        stage('Install Requirements') {
            steps {
                sh '''
                    docker run --rm -v "$PWD":/app -w /app python:3.8 pip install -r requirements.txt
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build -t $DOCKER_IMAGE .
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker stop $CONTAINER_NAME || true
                    docker rm $CONTAINER_NAME || true
                    docker run -d -p 5000:5000 --name $CONTAINER_NAME $DOCKER_IMAGE
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Deployment successful!'
        }
        failure {
            echo '❌ Build or deployment failed!'
        }
    }
}

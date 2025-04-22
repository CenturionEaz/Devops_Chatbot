pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "chatbot-app"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your Git repository
                git branch: 'main', url: 'https://github.com/CenturionEaz/Devops_Chatbot.git'
            }
        }

        stage('Install Requirements') {
            steps {
                // Install dependencies via pip
                script {
                    sh 'pip install -r requirements.txt'  // Make sure pip and Python are installed on Jenkins
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build Docker image
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'  // This assumes the Dockerfile is in the root directory
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                // Run the Docker container from the built image
                script {
                    sh 'docker run -d -p 5000:5000 --name chatbot-container $DOCKER_IMAGE'
                }
            }
        }
    }
}

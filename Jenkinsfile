pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('ab2d93db-6315-4fa3-8fe2-af733bd2c86d') // defined in Jenkins
        IMAGE_NAME = "centurioneaz/chatbot
"
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/CenturionEaz/Devops_Chatbot.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Deploy Locally') {
            steps {
                script {
                    // Stop existing container if running
                    sh 'docker rm -f chatbot-container || true'

                    // Pull the latest image
                    sh "docker pull ${IMAGE_NAME}:latest"

                    // Run the container on port 5000
                    sh "docker run -d --name chatbot-container -p 5000:5000 ${IMAGE_NAME}:latest"
                }
            }
        }
    }
}

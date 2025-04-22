pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('ab2d93db-6315-4fa3-8fe2-af733bd2c86d')
        DOCKER_IMAGE = "centurioneaz/chatbot"  // Make sure the image name is quoted properly
    }
    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build(DOCKER_IMAGE)
                }
            }
        }
        stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKERHUB_CREDENTIALS) {
                        docker.image(DOCKER_IMAGE).push()
                    }
                }
            }
        }
        stage('Deploy to Render') {
            steps {
                script {
                    // Use Render API or manually trigger the deployment if needed
                    echo "Deploying to Render..."
                }
            }
        }
    }
}

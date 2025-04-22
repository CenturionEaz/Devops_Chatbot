pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "chatbot-app"
    }

    stages {
        stage('Clone') {
            steps {
                git url: 'https://github.com/CenturionEaz/Devops_Chatbot.git', branch: 'main'
            }
        }

        stage('Install Requirements') {
            steps {
                sh 'pip install -r requirements.txt'
            }
        }

        stage('Lint Check') {
            steps {
                sh 'pip install flake8 && flake8 .'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name chatbot-container $DOCKER_IMAGE'
            }
        }
    }
}

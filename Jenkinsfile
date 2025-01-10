pipeline {
    agent {
        docker { image 'python:3.9-slim' } // Use Docker agent with Python image
    }

    environment {
        DOCKER_IMAGE = 'https://github.com/poornima2605/CI-CD-Pipeline.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Pull the code from GitHub
                git branch: 'main', url: 'https://github.com/poornima2605/CI-CD-Pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-credentials-id') {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy the container locally (for testing)
                    sh 'docker run -d -p 5000:5000 ${DOCKER_IMAGE}:latest'
                }
            }
        }
    }

    post {
        always {
            // Clean up Docker containers and images
            script {
                sh 'docker ps -q | xargs -r docker stop'
                sh 'docker images -q | xargs -r docker rmi -f'
            }
        }
    }
}

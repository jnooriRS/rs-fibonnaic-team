pipeline {
    // agent {
    //     docker { image 'ubuntu:latest' }
    // }
    
    environment {
       app =''
    }
    stages {
        stage('Clone repository') {
            /* Let's make sure we have the repository cloned to our workspace */
            steps {
                checkout scm
            }
            
        }

        stage('Build image') {
            /* This builds the actual image; synonymous to
            * docker build on the command line */
            steps {
                script {
                    app = docker.build("asadmk97/rs-fibonnaic-team")
                }
            }
        }

        stage('Push image') {
            steps {
                script {
                        docker.withRegistry('https://registry.hub.docker.com', 'Dockerhub') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
   }
}
pipeline {
    agent any
    
    stages {
        stage('Build') {
              steps {
                echo 'Running build automation'
                sh './gradlew build --no-daemon'
                archiveArtifacts artifacts: 'dist/trainSchedule.zip'
            }
        }
        
        stage('Build Docker image'){
                       
            steps {
                script {
                    app = docker.build("world2enjoy/node-app")
                    app.inside {
                        sh 'echo $(curl localhost:8081)'
                    }
                }
            }
            
        }
        
        stage('Push docker image'){
           
            steps{
                script {
                    docker.withRegistry('https://registry.hub.docker.com','docker_hub_login'){
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
        
    }
}

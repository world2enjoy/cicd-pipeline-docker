pipeline {
    agent any
    tools {
            gradle 'gradle5.2'
                 
      }
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh './gradlew -Dskip.tests build --no-daemon'
                archiveArtifacts artifacts: 'dist/trainSchedule.zip'
            }
        }
        
        stage('Build Docker image'){
            when {
                branch 'master'
            }
            
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
            when {
                branch 'master'
            }
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

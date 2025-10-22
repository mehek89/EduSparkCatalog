pipeline {
    agent any

    tools {
        maven 'Maven-3'  // Name of Maven from Global Tool Configuration
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/mehek89/EduSparkCatalog.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(
                    credentialsId: 'tomcatServer',  // your Jenkins credentials for Tomcat
                    url: 'http://localhost:8081/manager/text',
                    path: '/EduSparkCatalog'
                )],
                war: '**/target/EduSparkCatalog.war'
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed!'
        }
    }
}

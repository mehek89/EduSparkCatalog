pipeline {
    agent any

    environment {
        
        TOMCAT_CRED_ID = 'TomcatServer'          // Jenkins credential ID
        TOMCAT_URL = 'http://localhost:8081/manager/text' // Tomcat manager URL
        WAR_PATH = '**/target/EduSparkCatalog.war'    // Path to WAR file
        CONTEXT_PATH = '/EduSparkCatalog'             // Context path in Tomcat
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/mehek89/EduSparkCatalog.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                bat "mvn clean package"
            }
        }

        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9x(
                    url: "${TOMCAT_URL}",
                    credentialsId: "${TOMCAT_CRED_ID}",
                    path: "${CONTEXT_PATH}"
                )],
                war: "${WAR_PATH}"
            }
        }
    }

    post {
        success {
            echo " Build and Deployment successful!"
        }
        failure {
            echo " Deployment Failed! Check Jenkins and Tomcat logs."
        }
    }
}

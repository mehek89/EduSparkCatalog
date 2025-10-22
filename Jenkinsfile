pipeline {
    agent any

    environment {
        // Maven tool configured in Jenkins
        MAVEN_HOME = "C:\\Program Files\\Maven\\maven-mvnd-1.0.3-windows-amd64\\mvn"
        // Tomcat manager URL
        TOMCAT_URL = "http://localhost:8081/manager/text"
        // Tomcat credentials (user with manager-script role)
        TOMCAT_USER = "admin"
        TOMCAT_PASS = "admin123"
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git url: 'https://github.com/mehek89/EduSparkCatalog.git', branch: 'main', credentialsId: '9547ac26-588c-4feb-b618-8e7aa2603a83'
            }
        }

        stage('Build') {
            steps {
                // Clean and package WAR using Maven
                bat "${MAVEN_HOME}\\bin\\mvn clean package"
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // WAR file path
                    def warPath = "${env.WORKSPACE}\\target\\EduSparkCatalog.war"

                    // Use curl to deploy WAR via Tomcat manager-text
                    bat """
                    curl --upload-file "${warPath}" --user ${TOMCAT_USER}:${TOMCAT_PASS} "${TOMCAT_URL}/deploy?path=/EduSparkCatalog&update=true"
                    """
                }
            }
        }
    }

    post {
        success {
            echo "Deployment successful! Visit: http://localhost:8080/EduSparkCatalog"
        }
        failure {
            echo "Deployment Failed! Check Jenkins and Tomcat logs."
        }
    }
}

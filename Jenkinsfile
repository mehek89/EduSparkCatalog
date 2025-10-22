pipeline {
    agent any

    environment {
        // ⚙️ Paths to tools
        MAVEN_HOME = "C:\\Program Files\\Maven\\maven-mvnd-1.0.3-windows-amd64\\mvn"
        TOMCAT_URL = "http://localhost:8081/manager/text"
        DEPLOY_PATH = "/EduSparkCatalog"  // Change if you want another app name
        TOMCAT_USER = "admin"
        TOMCAT_PASS = "admin123"
    }

    stages {

        stage('Checkout') {
            steps {
                echo "📦 Checking out source code..."
                git branch: 'main', url: 'https://github.com/mehek89/EduSparkCatalog.git'
            }
        }

        stage('Build') {
            steps {
                echo "🏗️ Building WAR package with Maven..."
                bat "\"${MAVEN_HOME}\\bin\\mvn\" clean package"
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "🚀 Deploying WAR to Apache Tomcat..."
                    // Check if curl exists
                    bat 'where curl || echo ❌ curl not found'

                    // Deploy using curl
                    bat """
                    curl -u %TOMCAT_USER%:%TOMCAT_PASS% -T target/EduSparkCatalog.war "%TOMCAT_URL%/deploy?path=%DEPLOY_PATH%&update=true"
                    """
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful! Visit: http://localhost:8080%DEPLOY_PATH%"
        }
        failure {
            echo "❌ Deployment Failed! Check Jenkins or Tomcat logs."
        }
    }
}

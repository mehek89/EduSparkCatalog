pipeline {
    agent any

    environment {
        MAVEN_HOME = tool name: 'Maven-3.9.9', type: 'maven'
        JAVA_HOME = tool name: 'JDK21', type: 'jdk'
        TOMCAT_URL = 'http://localhost:8081/manager/text'
        TOMCAT_USER = 'admin'
        TOMCAT_PASSWORD = 'admin123'
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/mehek89/EduSparkCatalog.git'
            }
        }

        stage('Build') {
            steps {
                withEnv(["PATH+MAVEN=${MAVEN_HOME}/bin", "JAVA_HOME=${JAVA_HOME}"]) {
                    bat 'mvn clean package'
                }
            }
        }

        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(
                    credentialsId: '',
                    path: '/EduSparkCatalog',
                    url: "${TOMCAT_URL}",
                    username: "${TOMCAT_USER}",
                    password: "${TOMCAT_PASSWORD}"
                )], contextPath: '/EduSparkCatalog', war: '**/target/EduSparkCatalog.war'
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful! Open http://localhost:8081/EduSparkCatalog'
        }
        failure {
            echo 'Deployment Failed! Check Jenkins logs and Tomcat logs.'
        }
    }
}

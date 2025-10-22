pipeline {
    agent any

    tools {
        maven 'Maven-3.9.9'
        jdk 'JDK21'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/mehek89/EduSparkCatalog.git'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'TomcatServer', path: '', url: 'http://localhost:8081')], 
                contextPath: '/EduSparkCatalog', war: '**/target/EduSparkCatalog.war'
            }
        }
    }
}

pipeline {
    agent any

    tools {
        maven 'Maven-3.9.9'
        jdk 'JDK21'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mehek89/EduSparkCatalog.git'
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
                    credentialsId: 'TomcatServer',
                    path: '',
                    url: 'http://localhost:8080'
                )],
                contextPath: '/EduSparkCatalog',
                war: '**/target/EduSparkCatalog.war'
            }
        }

    } // End of stages
} // End of pipeline

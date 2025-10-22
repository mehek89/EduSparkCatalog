pipeline {
    agent any

    tools {
        maven 'Maven-3'  // name of Maven installation in Jenkins
        jdk 'JDK21'    // name of JDK installation in Jenkins
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
                    credentialsId: 'tomcat-credentials', 
                    url: 'http://localhost:8081/manager/text',
                    path: '/EduSparkCatalog'
                )],
                war: '**/target/EduSparkCatalog.war'
            }
        }
    }

    post {
        success {
            echo 'Build and Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed! Check Jenkins and Tomcat logs.'
        }
    }
}

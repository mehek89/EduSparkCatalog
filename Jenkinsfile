pipeline {
    agent any

    tools {
        maven 'Maven-3.9.9'   // Name from Global Tool Configuration
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/mehek89/EduSparkCatalog.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                
                 bat 'mvn clean package'  // for Windows agents
            }
        }

        stage('Deploy') {
            steps {
                deploy adapters: [tomcat9x(
                    url: 'http://localhost:8081/manager/text',
                    credentialsId: 'TomcatServer',
                    path: '/EduSparkCatalog'
                )],
                war: '**/target/EduSparkCatalog.war'
            }
        }
    }
}

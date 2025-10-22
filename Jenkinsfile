pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/mehek89/EduSparkCatalog.git'
            }
        }

        stage('Build') {
            steps {
                bat '"C:\\Program Files\\Maven\\maven-mvnd-1.0.3-windows-amd64\\mvn\\bin\\mvn" clean package'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Check if curl exists before trying to deploy
                    def curlCheck = bat(
                        script: 'where curl',
                        returnStatus: true
                    )

                    if (curlCheck != 0) {
                        echo '❌ ERROR: curl command not found. Please install curl or add it to PATH.'
                        error('Deployment stopped — curl missing.')
                    } else {
                        echo '✅ curl found — continuing deployment...'

                        // Deploy WAR file to Tomcat
                        bat """
                        curl --upload-file "C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\EduSparkCatalog-Pipeline\\target\\EduSparkCatalog.war" ^
                        --user admin:admin123 ^
                        "http://localhost:8081/manager/text/deploy?path=/EduSparkCatalog&update=true"
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Build and Deployment Successful!'
        }
        failure {
            echo '❌ Deployment Failed! Check Jenkins or Tomcat logs.'
        }
    }
}

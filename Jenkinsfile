pipeline {
    agent any
    stages {
        stage ('Initialize-Variables') {
            steps {
                bat '''
                    echo "PATH = %PATH%"
                    echo "M2_HOME = %M2_HOME%"
                '''
            }
        }
        stage ('Build') {
            steps {
                    bat 'mvn install'
            }
        }
        stage ('Docker-Build') {
            steps {
                    bat 'cd projectmanagement-service && mvn package docker:build'
            }
        }
    }
}

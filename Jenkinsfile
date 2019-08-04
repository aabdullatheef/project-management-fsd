pipeline {
    agent any
    tools {
        maven 'Maven'
        jdk 'Java 8'
    }
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
                    bat 'mvn install -DskipTests=true'
            }
        }
        stage ('Docker-Build') {
            steps {
                    bat 'cd projectmanagement-service && mvn package docker:build'
            }
        }
    }
}

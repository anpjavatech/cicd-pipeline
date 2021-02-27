pipeline{

    agent any
    tools{
        maven 'Maven'
    }

    stages {

        stage('Build') {
            steps {
                echo 'Steps to Build the code..'
                sh 'mvn -Dmaven.test.failure.ignore=true clean install'
            }
        }

        stage('Test'){
            steps{
                echo 'Step to Test the code..'
                sh 'mvn test'
            }
        }

        stage('Deploy'){
            steps{
                echo 'Steps to Deploy the code...'
            }
        }

    }
}
pipeline{

    agent any
    tools{
        Maven
    }

    stages {

        stage('Build') {
            steps {
                echo 'Steps to Build the code..'
                sh 'mvn --version'
                sh 'mvn clean install'
            }
        }

        stage('Test'){
            steps{
                echo 'Step to Test the code..'
            }

        }

        stage('Deploy'){
            steps{
                echo 'Steps to Deploy the code...'
            }
        }

    }
}
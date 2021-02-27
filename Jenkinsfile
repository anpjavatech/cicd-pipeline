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

        stage('Build Docker Image'){
            steps{
                echo 'Building docker image started..'
            }
        }

        stage('Deploy'){
            steps{
                echo 'Steps to Deploy the code...'
            }
        }

    }

    //Post section is for the pipeline and not for the stages.
    post {
         always {
            echo 'This will always run'
         }
         success {
            echo 'This will run only if successful'
         }
         failure {
            echo 'This will run only if failed'
         }
         unstable {
            echo 'This will run only if the run was marked as unstable'
         }
         changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
         }
    }
}
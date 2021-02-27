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

        post{
            failure{
                echo 'Build Failed !!!..'
            }
            success{
                echo 'Build is Successful !!..'
            }
        }

        stage('Test'){
            steps{
                echo 'Step to Test the code..'
                sh 'mvn test'
            }
        }

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

        stage('Build Docker Image'){
            steps{
                echo 'Building docker image started..'
            }
        }

        post{
            success{
                echo 'Building of Docker image is successful !!..'
            }
            failure{
                echo 'Building of Docker Image Failed !!!!!!..'
            }
        }

        stage('Deploy'){
            steps{
                echo 'Steps to Deploy the code...'
            }
        }

        post{
             success{
                echo 'Building of Docker image is successful !!..'
             }
             failure{
                echo 'Building of Docker Image Failed !!!!!!..'
             }
        }

    }
}
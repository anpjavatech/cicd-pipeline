pipeline{
    agent any
    environment {
            DOCKER_IMAGE_NAME = "anpks/anpksdockerhub"
        }
    tools{
        maven 'Maven'
    }

    stages {
        stage('Maven Build') {
            steps {
                echo 'Step to Build the code..'
                sh 'mvn clean install -DskipTests'
            }
        }

        //stage('Maven Test'){
            //steps{
               // echo 'Step to Test the code..'
               // sh 'mvn test'
           // }
       // }

        stage('Build Docker Image'){
            steps{
                echo 'Building docker image started..'
                script{
                    dockerImage = docker.build "${DOCKER_IMAGE_NAME}:$BUILD_NUMBER"
                }
                echo 'Building docker image completed..'
            }
        }

        stage('Image to Docker Hub'){
            when{
                expression{
                    BRANCH_NAME == 'main'
                }
            }
            steps{
                echo 'Ready to push the image to docker hub..'
                script{
                    docker.withRegistry('https://registry.hub.docker.com/', 'docker_hub_login'){
                        dockerImage.push()
                    }
                }
                echo 'Docker Image pushed to Registry..'
            }
        }

        stage('Deploy to Dev'){
            steps{
                echo 'Steps to Deploy the code...'
                kubernetesDeploy(kubeconfigId: 'kubeconfig', configs: 'cicdpipeline-kube.yml', enableConfigSubstitution: true)
            }
        }

    }

    //Post section is for the pipeline and not for the stages.
    post {
         always {
            echo 'To clean the workspace..'
            cleanWs()
         }
         success {
            echo 'Initial Pipeline is successful !!!...'
         }
         failure {
            echo 'Initial Pipeline Failed !!!...'
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
pipeline {
   agent any

   environment {

     SERVICE_NAME = "fin-trading-app-mongodb"
     REPOSITORY_TAG="${YOUR_DOCKERHUB_USERNAME}/${ORGANIZATION_NAME}-${SERVICE_NAME}:${BUILD_ID}"
   }

   stages {
      stage('Preparation') {
         steps {
            cleanWs()
            git credentialsId: 'GitHub', url: "https://github.com/${ORGANIZATION_NAME}/${SERVICE_NAME}"
         }
      }
      stage('Build') {
         steps {
            sh '''echo No build required for Mongodb'''
         }
      }

      stage('Build and Push Image') {
         steps {
           sh 'echo No docker image for Mongodb'
         }
      }

      stage('Deploy to Cluster') {
          steps {

                    sh 'envsubst < ${WORKSPACE}/deploy.yml | kubectl apply -f -'

          }
      }
   }
}
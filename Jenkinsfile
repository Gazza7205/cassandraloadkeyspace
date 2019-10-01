pipeline {
    agent any

    environment {
        NEW_IMAGE_NAME = 'cassandraloadkeyspace'
        NEW_IMAGE_TAG = "latest"
        NEW_IMAGE_REGISTRY_REPOSITORY = 'docker-hosted'
    }

    stages {
        stage('Build Image with Docker') {
            steps {
                sh """docker build -t  ${env.NEW_IMAGE_NAME}:${env.NEW_IMAGE_TAG} . """
            }
        }
	   stage('Login Docker, Tag and push docker image to Nexus') {
            steps {
		        sh """docker login ${env.NEW_IMAGE_REGISTRY_HOSTNAME} -u ${params.NEW_IMAGE_REGISTRY_USER} --password ${params.NEW_IMAGE_REGISTRY_PASSWORD}
                     docker tag ${env.NEW_IMAGE_NAME}:${env.NEW_IMAGE_TAG} ${env.NEW_IMAGE_REGISTRY_HOSTNAME}/repository/${env.NEW_IMAGE_REGISTRY_REPOSITORY}/${env.NEW_IMAGE_NAME}:${env.NEW_IMAGE_TAG}
			         docker push ${env.NEW_IMAGE_REGISTRY_HOSTNAME}/repository/${env.NEW_IMAGE_REGISTRY_REPOSITORY}/${env.NEW_IMAGE_NAME}:${env.NEW_IMAGE_TAG}
			         docker inspect ${env.NEW_IMAGE_REGISTRY_HOSTNAME}/repository/${env.NEW_IMAGE_REGISTRY_REPOSITORY}/${env.NEW_IMAGE_NAME}:${env.NEW_IMAGE_TAG}"""
            }
        }
    }
}
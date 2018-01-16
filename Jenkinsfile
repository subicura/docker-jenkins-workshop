node {
    git poll: true, url: 'https://github.com/subicura/docker-jenkins-workshop.git'
    
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub',
usernameVariable: 'DOCKER_USER_ID', passwordVariable: 'DOCKER_USER_PASSWORD']]) {
        stage('Pull') {
            git 'https://github.com/subicura/docker-jenkins-workshop.git'
        }
        stage('Unit Test') {
            sh(script: 'docker-compose run --rm unit')
        }
        stage('Build') {
            sh(script: 'docker-compose build app')
        }
        stage('Tag') {
            sh(script: 'docker tag ${DOCKER_USER_ID}/ruby-app ${DOCKER_USER_ID}/ruby-app:${BUILD_NUMBER}')
        }
        stage('Push') {
            sh(script: 'docker login -u ${DOCKER_USER_ID} -p ${DOCKER_USER_PASSWORD}')
            sh(script: 'docker push ${DOCKER_USER_ID}/ruby-app:${BUILD_NUMBER}')
            sh(script: 'docker push ${DOCKER_USER_ID}/ruby-app:latest')
        }
        stage('Deploy') {
            sh(script: 'docker-compose up -d production')
        }
    }
}

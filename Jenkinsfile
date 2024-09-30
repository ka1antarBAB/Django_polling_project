pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                sh 'test -d venv || python3 -m venv venv'
                sh '. venv/bin/activate && pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'echo testing'
                sh '. venv/bin/activate && python3 manage.py test'
            }
        }
        stage('Deploy to staging') {
            steps {
                sh 'echo Deploying....'
                sh 'ssh deploy@192.168.1.104 -o StrictHostKeyChecking=no "bash /var/www/polling/script/deploy.sh"'
            }
        }
        stage('Deploy to Production') {
            input {
                message "shall we deploy to production?"
                ok "Yes please"
            }
            steps {
                sh 'echo Deploying....'
                sh 'ssh deploy@192.168.1.107 -o StrictHostKeyChecking=no "bash /var/www/polling/script/deploy.sh"'
            }
        }
    }
    // apply to the whole pipeline

    post {
     // send email notification the specified addresses if the build fails
        failure {
             mail bcc: '', body: "<b>Failed Jenkins Build</b><br>Project: ${env.JOB_NAME} \
             <br>Build Number: ${env.BUILD_NUMBER} <br> URL of the build: ${env.BUILD_URL}", cc: '', \
             charset: 'UTF-8', from: 'jenkins@jenkins.test', mimeType: 'text/html', replyTo: 'put@youremail.com', \
             subject: "ERROR CI: Project name -> ${env.JOB_NAME}", \
             to: "notifs@henkins.test";  \
         }
    }
}

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
        stage('Deploy') {
            steps {
                sh 'echo Deploying....'
                sh 'ssh deploy@192.168.1.194 -o StrictHostKeyChecking=no "bash /var/www/polling/script/deploy.sh"'


            }
        }
    }
}

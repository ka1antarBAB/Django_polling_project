# Installation instructions

### Docker enviroment


1. Make sure docker engine and docker compose on your dev machine 
2. clone the repository 
3. CD into your project code dir
4. copy 'env.example' into '.env'
5. Generate a secret key and assign the value to 'SECRECT_KEY' variable
6. Assign values to your database variables accordingly 
7. Run 'docker docker-compose build'
8. Run 'docker-compose up'
9. Run 'docker-compose exec polling python3 manage.py migrate'
10. Run 'docker-compose exec polling python3 manage.py createsuperuser'



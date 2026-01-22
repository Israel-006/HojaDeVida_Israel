set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --noinput
python manage.py migrate
echo "from django.contrib.auth import get_user_model; \
User = get_user_model(); \
User.objects.filter(username='Israel').exists() or \
User.objects.create_superuser('Israel', 'israel@gmail.com', '12345')" \
| python manage.py shell
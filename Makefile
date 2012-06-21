clean:
	@find . -name "*.pyc" -delete

deps:
	@pip install -r requirements.txt

test: deps clean
	@python manage.py test

setup: deps
	@python manage.py syncdb
	@python manage.py migrate
	@python manage.py loaddata {{ project_name }}/fixtures/initial_data.json

settings:
	@test -e {{ project_name }}/settings_local.py || cp {{ project_name }}/settings_local.py{.example,}

run:
	@python manage.py runserver 0.0.0.0:8000

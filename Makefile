clean:
	@find . -name "*.pyc" -delete

deps:
	@pip install -r requirements.txt

test: deps clean
	@python manage.py test

setup: deps
	@python manage.py syncdb
	@python manage.py migrate
	@python manage.py loaddata vim_guide_survivor/fixtures/initial_data.json

settings:
	@test -e vim_guide_survivor/settings_local.py || cp vim_guide_survivor/settings_local.py{.example,}

run:
	@python manage.py runserver 0.0.0.0:8000

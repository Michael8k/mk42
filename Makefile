# mk42
# Makefile

create-virtualenv:
	virtualenv .env/`arch`

pip-install:
	pip install -r requirements/dev.txt

messages: makemessages compilemessages

makemessages:
	../dev-scp/messages.sh

compilemessages:
	../dev-scp/messages.sh compilemessages

runserver:
	./manage.py runserver 0.0.0.0:8080 --settings=$(shell basename $(CURDIR)).settings.dev --traceback

celeryd:
	./manage.py celeryd --settings=$(shell basename $(CURDIR)).settings.dev -l INFO --traceback --autoreload

migrate:
	./manage.py migrate --settings=$(shell basename $(CURDIR)).settings.dev --traceback

makemigrations:
	./manage.py makemigrations --settings=$(shell basename $(CURDIR)).settings.dev --traceback

static: collectstatic compress

collectstatic:
	./manage.py collectstatic --settings=$(shell basename $(CURDIR)).settings.dev --traceback --noinput

shell:
	./manage.py shell --settings=$(shell basename $(CURDIR)).settings.dev --traceback

dbshell:
	./manage.py dbshell --settings=$(shell basename $(CURDIR)).settings.dev --traceback

merge-and-push-all:
	git co master && git merge dev && git co test && git merge master && git co dev && git push --all && git push --tags

clear:
	../dev-scp/clear.sh

update-geoip-db:
	cd tmp && wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz && gunzip GeoIP.dat.gz && mv GeoIP.dat ../data/GeoIP/GeoIP.dat

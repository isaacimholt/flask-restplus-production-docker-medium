# Use an official Python runtime as an image
FROM python:3

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /docker_app/requirements.txt

EXPOSE 5000

WORKDIR /docker_app

RUN pip install -r requirements.txt

COPY . /docker_app

# CMD python app/manage.py db migrate
# CMD python app/manage.py db upgrade
# CMD python app/manage.py run
CMD python app/manage.py test
# CMD cd app && ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'

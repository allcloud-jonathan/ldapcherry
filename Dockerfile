FROM alpine

# Update
RUN apk add --update python py-pip gcc python-dev musl-dev openldap-dev

COPY . /src/ldapcherry

WORKDIR /src/ldapcherry

RUN pip install -r requirements.txt

RUN python setup.py install

CMD /usr/bin/ldapcherryd --config=/etc/ldapcherry/ldapcherry.ini

EXPOSE 8080

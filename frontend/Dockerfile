FROM ubuntu/apache2:2.4-24.04_beta
ENV PYTHONUNBUFFERED=1
RUN apt-get update
RUN apt-get install python3-pip python3-setuptools git apache2 apache2-dev gcc python3-venv \
  libc-dev wget make ffmpeg python3-dev libjpeg-dev libtiff-dev libffi-dev \ 
  build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
 default-libmysqlclient-dev \
  curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev -y

RUN chown -R 1000:33 /var/www/html && chmod -R g+w /var/www/html

WORKDIR /tmp
COPY install.sh .
RUN chmod +x install.sh
RUN wget https://github.com/GrahamDumpleton/mod_wsgi/archive/refs/tags/5.0.2.tar.gz && \
  wget https://github.com/secretisdead/persephone/raw/refs/heads/master/persephone_install.venv.sh && \ 
  chmod +x persephone_install.venv.sh && tar xvfz 5.0.2.tar.gz
WORKDIR mod_wsgi-5.0.2
RUN ./configure --with-python=/usr/bin/python3 && make && make install
RUN echo 'LoadModule wsgi_module /usr/lib/apache2/modules/mod_wsgi.so' | tee /etc/apache2/mods-available/wsgi.load
RUN a2enmod wsgi
RUN make clean
WORKDIR /tmp

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80

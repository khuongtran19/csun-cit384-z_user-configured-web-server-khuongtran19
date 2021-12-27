#install apache2
FROM ubuntu

RUN export DEBIAN_FRONTEND=noninteractive
ENV TZ=US
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update
RUN apt-get install -y apache2

# enable userdir
RUN a2enmod userdir
RUN printf '<IfModule mod_userdir.c> \n UserDir public_html \n UserDir disabled root \n <Directory ~/public_html> \n AllowOverride FileInfo AuthConfig Limit Indexes \n Options MultiViews Indexes SymLinksIfOwnerMatch IncludesNoExec \n Require method GET POST OPTIONS \n </Directory> \n </IfModule>' >> /etc/apache2/mods-enabled/userdir.conf
RUN printf 'Options Indexes' >> .htaccess
RUN useradd kvt87373 && echo "ServerName localhost" >> /etc/apache2/apache2.conf

COPY ./ /usr/local/apache2/htdocs/
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

FROM mysql:8.0

COPY ./my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod go-w /etc/mysql.conf.d/my.cnf
RUN mkdir /var/log/mysql
RUN chown mysql:mysql /var/log/mysql
RUN mkdir /var/run/mysql
RUN chown mysql:mysql /var/run/mysql

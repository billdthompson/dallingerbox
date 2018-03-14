# start postgres and redis
/etc/init.d/postgresql start \
&& sudo -u postgres psql --command "CREATE USER dallinger WITH SUPERUSER PASSWORD 'dallinger';" \
&& sudo -u postgres createdb -O dallinger dallinger \
&& echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.3/main/pg_hba.conf \
&& echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf \
&& redis-server &



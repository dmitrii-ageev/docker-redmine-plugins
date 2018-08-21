FROM busybox
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

# Declare enviroment variables
ENV REDMINE_PLUGINS /usr/src/redmine/plugins
ENV INITDB /docker-entrypoint-initdb.d

# Install plugins
COPY plugins/* ${REDMINE_PLUGINS}/
RUN \
    mkdir -p ${REDMINE_PLUGINS} \
    && cd ${REDMINE_PLUGINS} \
    && ls *.zip | xargs -n1 unzip -qo \
    && mv Redmine\ 3.4\ and\ higher/* . \
    && rm -fr Redmine\ 3.* \
    && rm -f *.zip

# Change owner to redmine:redmine
RUN chown -R 999:999 ${REDMINE_PLUGINS}
RUN chmod 775 ${REDMINE_PLUGINS}

# Copy database files
COPY initdb ${INITDB}
RUN chmod 777 ${INITDB}/redmine-db.sql

# Declare volumes
VOLUME ${REDMINE_PLUGINS}
VOLUME ${INITDB}

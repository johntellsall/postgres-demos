FROM postgres:9.4

RUN apt-get update > /dev/null \
    && apt-get install -y \
    curl gcc make libhiredis-dev postgresql-server-dev-9.4 unzip

RUN curl -s > redis_fdw.zip -L https://github.com/pg-redis-fdw/redis_fdw/archive/REL9_4_STABLE.zip
RUN unzip redis_fdw.zip

# WORKDIR /redis_fdw-REL9_5_STABLE
RUN make -C /redis_fdw*9_4* USE_PGXS=1 install
# https://github.com/pg-redis-fdw/redis_fdw/archive/REL9_5_STABLE.zip
COPY initdb.d/ /docker-entrypoint-initdb.d/

# ENTRYPOINT ["/docker-entrypoint.sh"]
# ENTRYPOINT ["bash", "-x", "/docker-entrypoint.sh"]
# ENTRYPOINT ["bash", "-c", "ls", "/docker-entrypoint-initdb.d"]
# ENTRYPOINT ["/bin/bash"]
# CMD bash

FROM redis:7.2.4-bookworm

# RUN echo "vm.overcommit_memory=1" | tee -a /etc/sysctl.conf && sysctl -p

COPY redis.conf /usr/local/etc/redis/redis.conf
COPY users.acl /usr/local/etc/redis/users.acl
CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]

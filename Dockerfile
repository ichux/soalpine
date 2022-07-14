FROM alpine:edge

# Install packages
RUN apk add --update --no-cache python3 curl netcat-openbsd

COPY entrypoint.sh /bin/entrypoint.sh
WORKDIR /involved

EXPOSE 8000

# HEALTHCHECK CMD curl --fail http://127.0.0.1:8000 || exit 0
# HEALTHCHECK CMD nc -z 127.0.0.1 8000 || exit 0

ENTRYPOINT ["/bin/sh", "/bin/entrypoint.sh"]

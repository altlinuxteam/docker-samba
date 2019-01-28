# Build

```sh
docker build -t alt-samba-dc .
```

# Run

```sh
docker run -d --cap-add SYS_ADMIN --name dc0 \
  -e SAMBA_HOSTNAME=dc0.domain.alt \
  -e SAMBA_HOST=dc0 \
  -e SAMBA_REALM=DOMAIN.ALT \
  -e SAMBA_DOMAIN=DOMAIN \
  alt-samba-dc
```

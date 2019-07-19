# haport
Simple port forwarding using HAProxy.

## Example

Forward `0.0.0.0:9000` to `192.168.0.1:8000`:

```sh
docker run --rm -it -e TARGET=192.168.0.1:8000 -p 9000:8000 gongzhang/haport
```

Or:

```yaml
version: "3"
services:
  haport:
    image: gongzhang/haport
    environment:
      - TARGET=192.168.0.1:8000
    ports:
      - 9000:8000
```

> Note that the internal port of the container is always same with the port in `TARGET`.

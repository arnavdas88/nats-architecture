# nats-architecture



```bash
$ go install github.com/nats-io/nkeys/nk@latest
$ go install github.com/nats-io/nsc/v2@latest
```

```bash
$ nsc init -H ./nats-config/ -d ./nats-config/ -n <OPERATOR>
$ nsc edit operator -H ./nats-config/ --keystore-dir ./nats-config/ -u http://localhost:9090/jwt/v1
$ nsc edit operator -H ./nats-config/ --keystore-dir ./nats-config/ --account-jwt-server-url nats://localhost:4222
$ nsc generate config -H ./nats-config/ --keystore-dir ./nats-config/ --nats-resolver --config-file ./nats-server/resolver.conf
```

```bash
$ nsc add user -H ./nats-config/ --keystore-dir ./nats-config/ -a <OPERATOR>  -n <ACCOUNT> --allow-pub pub.acc1 --allow-sub pub.acc1
```

```bash
$ chmod 777 ./nats-config/creds/<OPERATOR>/SYS/sys.creds
$ chmod 777 ./nats-config/creds/<OPERATOR>/<OPERATOR>/<ACCOUNT>.creds
```

# start nats-server with server.conf

```bash
$ nsc push -H ./nats-config/ --keystore-dir ./nats-config/ --all
```



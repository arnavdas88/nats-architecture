go install github.com/nats-io/nkeys/nk@latest
go install github.com/nats-io/nsc/v2@latest

nsc init -H ./nats-config/ -d ./nats-config/ -n iifon
nsc edit operator -H ./nats-config/ --keystore-dir ./nats-config/ -u http://localhost:9090/jwt/v1
nsc edit operator -H ./nats-config/ --keystore-dir ./nats-config/ --account-jwt-server-url nats://localhost:4222
nsc generate config -H ./nats-config/ --keystore-dir ./nats-config/ --nats-resolver --config-file ./nats-server/resolver.conf

nsc add user -H ./nats-config/ --keystore-dir ./nats-config/ -a iifon  -n ACC-1 --allow-pub pub.acc1 --allow-sub pub.acc1

chmod 777 ./nats-config/creds/iifon/SYS/sys.creds
chmod 777 ./nats-config/creds/iifon/iifon/ACC-1.creds

# start nats-server with server.conf

nsc push -H ./nats-config/ --keystore-dir ./nats-config/ --all




go install github.com/nats-io/nkeys/nk@latest
go install github.com/nats-io/nsc/v2@latest

nsc init -H ./nats-config/ -d ./nats-config/ -n iifon
nsc edit operator -H ./nats-config/ --keystore-dir ./nats-config/ -u http://localhost:9090/jwt/v1
nsc edit operator -H ./nats-config/ --keystore-dir ./nats-config/ --account-jwt-server-url nats://localhost:4222
nsc generate config -H ./nats-config/ --keystore-dir ./nats-config/ --nats-resolver --config-file ./nats-server/resolver.conf

# start nats-server with server.conf

nsc push -H ./nats-config/ --keystore-dir ./nats-config/ --all
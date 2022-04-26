# example docker to initialize ksql commands
Run in a docker.
Check if dummy file exists. If not, do initialization.
When done, touch dummy file so it does not initialize again.
That should make it initialize only once.

## initialize.sh

Add ksql statements to initialize in here.

```bash
#/bin/bash

KSQL_SERVER=$1
sleep 2
echo "This is where initializtion should happen."

./ksql.sh $KSQL_SERVER ksql "create or replace stream answers_raw (hash string, answer string) with (kafka_topic='answer', value_format='delimited', value_delimiter=':');"
```

## ksql.sh

```bash
#!/bin/bash

KSQL_SERVER=$1
sqltype=$2
statement=$3

curl -X "POST" "http://$KSQL_SERVER/$sqltype" \
     -H "Content-Type: application/json; charset=utf-8" \
     -d "{
     \"ksql\": 
       \" $statement \"
}"
echo
```

## entry.sh

Configure `$KSQLDB` to point to ksqldb server API.
TODO: figure out authentication

```bash
#!/bin/bash

KSQLDB=172.17.0.1:8088

ls .init 2>/dev/null
if [ $? != 0 ]; then
  while [ 1 ]; do
    curl $KSQLDB
    if [ $? == 0 ]; then
      echo "Beginning initialization..."
      ./initialize.sh $KSQLDB
      result=$?
      echo "Finished initialization. $result"
      touch .init
      exit $result
    fi
    sleep 5
  done
fi
```

## Dockerfile

```Dockerfile
FROM kalilinux/kali-rolling

WORKDIR /work

# iproute2 = ip
# net-tools = ifconfig
RUN apt update && apt install -y kafkacat socat net-tools iproute2 git curl python3 python3-pip

COPY entry.sh .
COPY initialize.sh .
COPY ksql.sh .
RUN ls -al

ENTRYPOINT /work/entry.sh
```

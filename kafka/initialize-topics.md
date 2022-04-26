# Initialize topics in dockers
Add environment variable `KAFKA_CREATE_TOPICS`.
Format is `topic_name:partitions:replicas?`
```yaml
version: "3.8"
services:
  kafka:
    image: wurstmeister/kafka
    restart: always
    expose:
      - "9092:9092"
    ports:
      - "9092:9092"
    environment:
      DOCKER_API_VERSION: 1.22
      KAFKA_ADVERTISED_HOST_NAME: kafka
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_CREATE_TOPICS: "md5_bloom:1:1,md5_query:1:1,sha1_bloom:1:1,sha1_query:1:1,answer:1:1,ingest_raw:1:1,files_raw:1:1"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # TODO: can we get rid of this?
      - ./volumes/kafka:/kafka
```

## Full example
```yaml
version: "3.8"
services:
  zookeeper:
    image: wurstmeister/zookeeper
    ports:
      - "2181:2181"
    restart: always
  kafka:
    image: wurstmeister/kafka
    restart: always
    expose:
      - "9092:9092"
    ports:
      - "9092:9092"
    environment:
      DOCKER_API_VERSION: 1.22
      KAFKA_ADVERTISED_HOST_NAME: kafka
      KAFKA_ZOOKEEPER_CONNECT: zookeeper:2181
      KAFKA_CREATE_TOPICS: "md5_bloom:1:1,md5_query:1:1,sha1_bloom:1:1,sha1_query:1:1,answer:1:1,ingest_raw:1:1,files_raw:1:1"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # TODO: can we get rid of this?
      - ./volumes/kafka:/kafka
  ksqldb-server:
    image: confluentinc/cp-ksqldb-server:7.0.0
    hostname: ksqldb-server
    container_name: ksqldb-server
    depends_on:
      - kafka
    ports:
      - "8088:8088"
    environment:
      KSQL_CONFIG_DIR: "/etc/ksql"
      KSQL_BOOTSTRAP_SERVERS: "kafka:9092"
      KSQL_HOST_NAME: ksqldb-server
      KSQL_LISTENERS: "http://0.0.0.0:8088"
      KSQL_CACHE_MAX_BYTES_BUFFERING: 0
      #KSQL_KSQL_SCHEMA_REGISTRY_URL: "http://schema-registry:8081"
      KSQL_PRODUCER_INTERCEPTOR_CLASSES: "io.confluent.monitoring.clients.interceptor.MonitoringProducerInterceptor"
      KSQL_CONSUMER_INTERCEPTOR_CLASSES: "io.confluent.monitoring.clients.interceptor.MonitoringConsumerInterceptor"
      #KSQL_KSQL_CONNECT_URL: "http://connect:8083"
      KSQL_KSQL_LOGGING_PROCESSING_TOPIC_REPLICATION_FACTOR: 1
      KSQL_KSQL_LOGGING_PROCESSING_TOPIC_AUTO_CREATE: 'true'
      KSQL_KSQL_LOGGING_PROCESSING_STREAM_AUTO_CREATE: 'true'
    volumes:
      - ./content/ksqldb:/init
    restart: always
  ksqldb-cli:
    image: confluentinc/cp-ksqldb-cli:7.0.0
    container_name: ksqldb-cli
    depends_on:
      - kafka
      - ksqldb-server
    network_mode: host
    entrypoint: ["/bin/ksql", "http://localhost:8088"]
    tty: true
  schema-registry: # kafka-connect might need this
    image: confluentinc/cp-schema-registry:5.0.0
    environment:
      SCHEMA_REGISTRY_KAFKASTORE_CONNECTION_URL: "zookeeper:2181"
      SCHEMA_REGISTRY_HOST_NAME: schema-registry
    depends_on:
      - zookeeper
      - kafka
    expose:
      - 8081
    ports:
      - '8081:8081'
```


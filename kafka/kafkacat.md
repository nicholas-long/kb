# kafkacat

## add data to topic
The option `-u` makes it unbuffered.
If you do not do this, then it could keep data in a buffer indefinitely.
```bash
cat datafile | kafkacat -b $KAFKA -P -u -t topic_name
```

### include keys
By providing CSV separator for key and values with `-K`

```bash
echo "$fileid:$filename" | kafkacat -b $KAFKA -P -t topic_name -u -K ':'
```

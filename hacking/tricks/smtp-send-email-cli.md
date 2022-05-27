# send email over SMTP from command line with swaks
```bash
sudo apt install swaks
swaks -s $IP -f from@sender.com -t to@recipient.com --header "Subject: this is the subject" --body 'body text here' --attach $FILE
```

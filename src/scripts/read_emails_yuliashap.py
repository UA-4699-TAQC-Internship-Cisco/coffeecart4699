# -*- coding: utf-8 -*-
import email
import mailbox
import os

MAILBOX_PATH = '/var/spool/mail/yuliasha'

# with open('/var/spool/mail/yuliasha', 'r') as f:
#     print(f.read(500))

if not os.path.exists(MAILBOX_PATH):
    print("Mailbox file does not exist:", MAILBOX_PATH)
    exit(1)

mbox = mailbox.mbox(MAILBOX_PATH)

print("Reading mailbox: {}\n".format(MAILBOX_PATH))

for message in mbox:
    subject = message['subject']
    sender = message['from']

    if message.is_multipart():
        parts = []
        for part in message.walk():
            content_type = part.get_content_type()
            if content_type == 'text/plain':
                parts.append(part.get_payload(decode=True))
        body = b''.join(parts).decode('utf-8', 'ignore')
    else:
        body = message.get_payload(decode=True)
        if body:
            body = body.decode('utf-8', 'ignore')
        else:
            body = ''

    print("From: {}".format(sender))
    print("Subject: {}".format(subject))
    print("Body snippet: {}".format(body[:100].replace('\n', ' ')))
    print("-" * 40)

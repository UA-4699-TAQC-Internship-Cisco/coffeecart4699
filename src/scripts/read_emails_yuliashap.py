import mailbox
import os
import subprocess
import sys

# Define the remote user, host, and mailbox file path on the CentOS VM
REMOTE_USER = "yuliasha"
REMOTE_HOST = "192.168.0.149"
REMOTE_PATH = "/var/spool/mail/yuliasha"
# Define the local file path where the mailbox will be saved on the Mac
LOCAL_PATH = "yuliasha_mailbox"


def scp_mailbox():
    """
        Copy the mailbox file from the remote CentOS machine to the local Mac machine
        using the SCP (Secure Copy) command. This allows us to read and process the mail
        locally without needing direct remote access during mailbox parsing.
        """
    subprocess.check_call(["scp", "{}@{}:{}".format(REMOTE_USER, REMOTE_HOST, REMOTE_PATH), LOCAL_PATH])


def read_mailbox():
    if not os.path.exists(LOCAL_PATH):
        print "Mailbox file does not exist:", LOCAL_PATH
        sys.exit(1)

    mbox = mailbox.mbox(LOCAL_PATH)
    for message in mbox:
        sender = message['from']
        subject = message['subject']

        if message.is_multipart():
            body_parts = [part.get_payload(decode=True) for part in message.walk() if
                          part.get_content_type() == 'text/plain']
            body = ''.join(body_parts)
        else:
            body = message.get_payload(decode=True)

        if body:
            body = body.decode('utf-8', 'ignore')

        print "From: {}".format(sender)
        print "Subject: {}".format(subject)
        print "Body snippet: {}".format(body[:100].replace('\n', ' ').replace('\r', ' '))
        print "-" * 40


if __name__ == "__main__":
    scp_mailbox()
    read_mailbox()

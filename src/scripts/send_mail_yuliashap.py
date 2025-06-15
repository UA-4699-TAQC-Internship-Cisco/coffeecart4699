import smtplib

from email.mime.text import MIMEText

sender = "python@localhost"
recipient = "yuliasha@localhost"

subject = "Message from Python2"
body = "Hello! This is a second test email sent from a Python script."

msg = MIMEText(body)
msg['Subject'] = subject
msg['From'] = sender
msg['To'] = recipient


server = smtplib.SMTP("192.168.0.149", 25)
server.sendmail(sender, [recipient], msg.as_string())
server.quit()



import smtplib
import csv
from pathlib import Path

home = str(Path.home())

SES_AWS_ACCESS_KEY = ''
SES_AWS_SECRET = ''

# with open(home+'/aws_ses_creds.csv','rt')as f:
# 	data = csv.reader(f)

# 	for row in data:
# 		SES_AWS_ACCESS_KEY = row[0]
# 		SES_AWS_SECRET = row[1]

# 	# SES_AWS_ACCESS_KEY = data[0][0]

# print(SES_AWS_ACCESS_KEY)

def sendSummitEmail(name, email_id):
	
	header  = 'From: RAH InfoTech<karuna.kochar@rahinfotech.com>\n'
	header += 'To: ' + email_id + '\n'
	header += 'Subject: [Confirmation] Security & Performance Summit 2019\n\n'

	message = "Hi " + name + ",\n\n"
	message += "Thank you for your interest in the Security & Performance Summit 2019. Your registration has been confirmed.\n\n"
	message += "Should you have any questions, please do not hesitate to contact us.\n\n"
	message += "Regards,\nRAH InfoTech Team"

	message = header + message

	try:
		server = smtplib.SMTP('email-smtp.us-east-1.amazonaws.com', 587)
		server.starttls()
		server.login(SES_AWS_ACCESS_KEY, SES_AWS_SECRET)
	
		problems = server.sendmail('karuna.kochar@rahinfotech.com', email_id, message)
		
		# print('Email sent')
		server.quit()

		return True
	except Exception as e:
		print(time.time(), e)

		return False

# print(sendSummitEmail("Suraj", "surajjana2@gmail.com"))
""" Email Notification Keywords
    Defines keyword that interact with email notofications.

"""
import imaplib
import email
from bs4 import BeautifulSoup
from time import sleep, time
import Credentials as cred

email_user = cred.SIGN_UP_EMAIL_O
email_pass = cred.SIGN_UP_PASS
email_act_not = cred.NOTIF_EMAIL
imap_url = 'outlook.office365.com'


def get_url(subject, link_title, timeout=60, poll_frequency=5):
    mail = signin(imap_url, email_user, email_pass)
    end_time = time() + timeout
    while time() < end_time:
        status, data = mail.search(
            None, '(FROM "' + email_act_not + '" SUBJECT "' + subject + '" UNSEEN)')
        id_list = data[0].split()
        if status == 'OK' and len(id_list) > 0:
            for email_id in id_list:
                status, data = mail.fetch(email_id, '(RFC822)')
                for response_part in data:
                    if isinstance(response_part, tuple):
                        msg = email.message_from_string(
                            list(response_part)[1].decode('utf-8'))
                        for part in msg.walk():
                            if (part.get_content_type() == "text/html"):  # ignore attachments/html
                                soup = BeautifulSoup(part.get_payload(
                                    decode=True).decode('utf-8', 'ignore'), 'html.parser')
                                reset_link = soup.find(
                                    'a', attrs={'title': link_title})
                                print(reset_link.get('href'))
                                signout(mail)
                                return reset_link.get('href')

        if time() < end_time:
            sleep(poll_frequency)
    signout(mail)
    raise AssertionError("Timeout: No email received within %ss" % timeout)


def signin(imap_url, email, password):
    mail = imaplib.IMAP4_SSL(imap_url)
    mail.login(email, password)
    mail.select('inbox')
    return mail


def signout(mail):
    mail.close()
    mail.logout()


# get_url('Welcome to Activity', 'Log in to Activity')

pysendgmaillib
==============

`pysendgmaillib` is a Python 2 (>=2.7) library for sending email with attachments using GMail.  It has a Pythonic interface and is very simple to use.


Sample Usage
------------

```python
import glob  # not required by pysendgmaillib, used for demo
from pysendgmaillib import gmailsender
with gmailsender('mygmailaccount@gmail.com', 'mypassword') as s:
    # send one email
    s.new_mail('the subject',
               ['list of recipients'],
               ccaddrs=['list of secondary recipients'])
    s.set_plain_body('what I want to say in mail body')
    for image in glob.glob('*.jpg'):  # assume total size <= 10 MB
        s.add_attachment(image)
    s.send()

    # send another email
    s.new_mail('the subject of another mail',
               ['another list of recipients'])  # no Cc
    s.set_plain_body('Hi there')
    s.send()
```

Mechanism
---------

The main component is the context manager `gmailsender`.  It's based on `smtplib` and `email` to send emails.  To function, the corresponding GMail account has to be set to "allow less secure apps". Either personal GMail account (ending with "@gmail.com") or G Suite account (ending with "@organization.name") can be used with `pysendgmaillib`.

Limitations
-----------

- Sticked to Python 2, due to imcompatibility of `email` package with Python 3
- Attachment size limit of 10 MB, though the limit can be changed by modifying the source file "pysendgmaillib.py". 
- Though not a limitation of this library, sending too much email in short time leads to account disabled by Google temporarily; so use this library with care.

References
----------

 - http://naelshiab.com/tutorial-send-email-python/
 - https://mail.python.org/pipermail/python-list/2012-November/635909.html
 - https://stackoverflow.com/questions/26582811/gmail-python-multiple-attachments

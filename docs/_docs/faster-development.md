---
title: Faster Development
---

Development speed with AWS Lambda can be slow due to having to upload the Ruby interpreter and gems as part of the deployment package. The recommendation for this is to use [Cloud9](https://aws.amazon.com/cloud9/) to take advantage of the blazing EC2 internet pipe.

EC2 Instance Internet Speed:

    $ curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
    Testing download speed............................................................
    Download: 2399.01 Mbit/s
    Testing upload speed..................................................................
    Upload: 1103.04 Mbit/s
    $

Typical Home Internet Speed:

    $ curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -
    Testing download speed...................................................................
    Download: 100.50 Mbit/s
    Testing upload speed......................................................................
    Upload: 6.78 Mbit/s
    $

In these case there's a 162x upload speed difference. There is no comparison. It's the upload speed that destroys productivity. I've actually come to enjoy using Cloud9 and have been pretty happy with it, it even has some nice built-in Lambda local debugging features.

Another approach for a team is to set up a CI/CD pipeline that will deploy when git commits are pushed.

Would like to improve the speed of the deploying these large packages though and would love to try some ideas around this.

<a id="prev" class="btn btn-basic" href="{% link _docs/debug-ruby-errors.md %}">Back</a>
<a id="next" class="btn btn-primary" href="{% link _docs/upgrading.md %}">Next Step</a>
<p class="keyboard-tip">Pro tip: Use the <- and -> arrow keys to move back and forward.</p>

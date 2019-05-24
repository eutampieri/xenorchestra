---
name: Bug report
about: Create a report to help us help you
title: ''
labels: ''
assignees: ''

---

**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

**Expected behavior**
A clear and concise description of what you expected to happen.

**Screenshots**
If applicable, add screenshots to help explain your problem.

**Desktop/Server details (please complete the following information):**
 - OS: [e.g. iOS]
 - Browser [e.g. chrome, safari]
 - Version [e.g. 22]

**Additional context**
Add any other context about the problem here.

**Confirm XOCE services are running**
Please run ```systemctl status xo-server.service``` and paste the resulting output below. 

**Provide the output of journalctl logs**
Please run ```journalctl -u xo-server -f -n 50``` and paste the resulting output below. 

**Provide answers to these questions:**
* Is this a fresh install or an upgrade?
* Version of XOCE server and web interface you're running
* What OS is XOCE running on?
* What method you used to install XOCE (xo_install.sh, manual installation, etc)
* What specific XOCE page you're on, and what specific element you're interacting with to trigger the error
* If a stacktrace is provided in the error, include that too.
* Any errors that appear in your browser's error console.
* Include what you've done so far in the installation, and if you got any error messages along the way.
* Indicate whether or not you've manually edited any data directly.

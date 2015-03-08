A puppet setup for a Flask app with nginx and redis in vagrant
==============================================================================
## Configure Environment
Tested with CentOS7.0(3.10.0-123.20.1.el7.x86_64)
```bash
	# install ruby vagrant virtualbox
	[root@localhost ~] ./init.sh
    # Bring the box up
    vagrant up
```

Site should then be available over port 8000 at `http://localhost:8000/`.
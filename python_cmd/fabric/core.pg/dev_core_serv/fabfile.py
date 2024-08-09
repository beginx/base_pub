#!/usr/bin/env python
# -*- conding: utf-8 -*-

from __future__ import with_statement
from fabric.api import *
#from fabric.api import env, local, settings, cd, run
from fabric.contrib.console import confirm
from StringIO import StringIO
import pprint
import time

# env -----------------------------------------------------------------------
#env.use_ssh_config = True
#env.disable_known_hosts  = True

env.gateway = 'cloud@pg:10022'
env.hosts = ['cloud@dcos-api.sk.com']
env.password = 'cloud000@';
env.key_filename = '/Users/basie/.ssh/id_rsa.pub'

#env.use_ssh_config = True;

a = '/Users/basie/tros_os_core/tros-root/tros-document/target/tros.war'

def dev_core(): # must root
    put('/Users/basie/tros_os_core/tros-root/tros-api/target/tros.war', '/svc/tcore/was/tomcat/coreSvr11/webapps');
    with cd('/svc/tcore/was/tomcat/coreSvr11/bin/'):
        run('./shutdown.sh')
        run('./startup.sh')


def aaa():
    run('hostname');

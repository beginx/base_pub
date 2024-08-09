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
env.hosts = ['cloud@pg:10022']
env.password = 'cloud000@';
#env.key_filename = '/Users/basie/.ssh/id_rsa.pub'

#env.use_ssh_config = True;

a = '/Users/basie/tros_os_core/tros-root/tros-document/target/tros.war'

def pg_core():
    put('/Users/basie/tros_os_core/tros-root/tros-api/target/tros.war', '/home/cloud/deployment');
    with cd('/home/cloud/'):
        run('./tros_v3_deployment_start.sh core')


def aaa():
    run('hostname');

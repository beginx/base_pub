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
env.disable_known_hosts  = True

env.roledefs = {
    'dev': {
        'hosts': ['id@host'],
    }
}

AWS_EC2_01 = 'pg:10022'  # Running
#AWS_EC2_02 = '172.31.xx.xxx'  # Running
#AWS_UTIL = '172.31.x.xx'  # Running

PROJECT_DIR = '/svc/tros_v3/process/osec'
APP_DIR = '%s/app' % PROJECT_DIR

env.user = 'cloud'
#env.hosts = [AWS_EC2_01, AWS_EC2_02]
env.hosts = [AWS_EC2_01]
env.key_filename = '/Users/basie/.ssh/id_rsa.pub'

# functions --------------------------------------------------------------

def pack():
    local('git push origin master', capture=False)

def a():
#    local('pip freeze > build/requirements.txt', capture=False )
    local('pip wheel -r build/requirements.txt --wheel-dir=./tmp')

def pg_core():
    put('/Users/basie/tros_os_core/tros-root/tros-api/target/tros.war', '/home/cloud/deployment');
    with cd('/home/cloud/'):
        run('./tros_v3_deployment_start.sh core')

def snd():
    local('scp -P 10022 ./*.py *.properties cloud@pg:/svc/tros_v3/process/osec/', capture=False)

def deploy():
#    put('bbb', '%s/bbb' % PROJECT_DIR);
    with settings(warn_only=True):
        with cd(PROJECT_DIR):
            run('./osec status')
            run('./osec stop')
            run('./osec start')
#        with cd('/svc/tros_v3/process/osec/logs'):
#            run('rm osec.log.?')

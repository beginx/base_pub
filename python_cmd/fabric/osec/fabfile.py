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
env.gateway = 'cloud@pg:10022'
env.hosts = ['cloud@dcos-api.sk.com']
env.password = 'cloud000@';

s_path = "/Users/basie/var/vm_home/osec"
t_path = "/svc/tros_v3/process/osec";

def pack():
    local('git push origin master', capture=False)

def a():
#    local('pip freeze > build/requirements.txt', capture=False )
    local('pip wheel -r build/requirements.txt --wheel-dir=./tmp')

def snd_ssh():
    local('scp -P 10022 ./*.py *.properties cloud@pg:/svc/tros_v3/process/osec/', capture=False)

def deploy():
#    put('bbb', '%s/bbb' % PROJECT_DIR);
    with settings(warn_only=True):
        with cd(t_path):
            run('./osec status')
            run('./osec stop')
            run('./osec start')
#        with cd('/svc/tros_v3/process/osec/logs'):
#            run('rm osec.log.?')

def rcf():
    get(t_path + "/*.py", s_path);
    get(t_path + "/*.properties", s_path);

def snd():
    put(s_path + "/*.py", t_path);

def gets():
    get("/svc/tros_v3/process/osec.170120.tar", "/Users/basie/");


#def dep_osec():
#    put(s_path, t_path);
#    get(t_path + "/bbb", "/Users/basie/var/vm_home/osec");
#    with cd(t_path):
#        run('./osec stop')
#        run('./osec start')

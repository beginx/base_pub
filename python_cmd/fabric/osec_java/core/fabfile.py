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

#s_path = "/Users/basie/var/vm_home/osec"
s_path = "/Users/basie/Downloads/demo/target"
#t_path = "/svc/tros_v3/process/osec";
t_path = "/home/cloud";

y_path = "/Users/basie/tros_os_core/tros-root/tros-api/target"

def deploy():
#    put('bbb', '%s/bbb' % PROJECT_DIR);
    with settings(warn_only=True):
        with cd(t_path):
            run('./osec status')
            run('./osec stop')
            run('./osec start')
#        with cd('/svc/tros_v3/process/osec/logs'):
#            run('rm osec.log.?')

#def rcf():
#    get(t_path + "/*.py", s_path);

def snd():
    put(s_path + "/*.jar", t_path);

def snd_war():
    put(y_path + "/*.war", t_path);

def snd_demo():
    put(s_path + "/*.jar", t_path);


#def dep_osec():
#    put(s_path, t_path);
#    get(t_path + "/bbb", "/Users/basie/var/vm_home/osec");
#    with cd(t_path):
#        run('./osec stop')
#        run('./osec start')

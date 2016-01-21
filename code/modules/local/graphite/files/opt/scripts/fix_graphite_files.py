#!/usr/bin/env python2.7

import shutil
import os
import glob
from boto import ec2
from determine_active_cluster import determineActiveIndex

def getProdNodes(region="us-west-1"):
    conn = ec2.connect_to_region('us-west-1')
    filters = [{'Name':'instance-state-name', 'Values':['running']}]
    reservations = conn.get_all_instances()
    instances = [i for r in reservations for i in r.instances]
    ret = []; 
    for instance in instances:
        if (instance.__dict__['tags']['Name'] == "app-prod-2") or (instance.__dict__['tags']['Name'] == "app-prod-1"):
            bname = instance.__dict__['tags']['Name'] #bname is short for beanstalk name
            iname = instance.id.rsplit('-', 1)[1]  #iname is short for instance id name
            hostname = 'collectd-' + bname + '-' + iname + "-p-usw1-local-com"
            ret.append(hostname)
    return ret;

def getDirs():
    directories = [];
    storage = os.listdir('/opt/graphite/storage/whisper')
    graphFiles = glob.glob('collectd-app-prod-*')
    for theFiles in graphFiles:       
        directories.append(theFiles)
    return directories;

def removeOldDirs():
    prod = getProdNodes()
    directories = getDirs()
    prod = set(prod)
    directories = set(directories)
    oldFolders = set(directories).difference(prod)
    os.chdir('/opt/graphite/storage/whisper')
    for mvFolders in oldFolders:
        shutil.move(mvFolders,"./backup-prod-nodes")

if __name__ == '__main__':
    removeOldDirs()


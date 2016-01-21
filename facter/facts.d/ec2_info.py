#!/usr/bin/python27
# http://boto.readthedocs.org/en/latest/ref/ec2.html#module-boto.ec2.instance
# python get_id.py -r us-east-1 -i i-b608d84b

import boto.ec2, json, argparse, os
from pprint import pprint

def getNodes(region, instance):
    # Use boto to get all reservations
    ec2_connection = boto.ec2.connect_to_region(region)
    reservations = ec2_connection.get_all_reservations(instance_ids=instance)

    # Parse reservations for instances
    instances = [];
    for r in reservations:
        instances.extend(r.instances);

    # Distill instance objects into dicts
    ret = {};
    regions = {
        'us-east-1' : 'use1',
        'us-west-1' : 'usw1',
        'us-west-2' : 'usw2',
        'ap-southeast-1' : 'ase1'
    }

    for item in instances:
        token=item.tags.get("Name").split("-")
        token2=item.tags.get("Name").split(".")
        if len(token) > 2:
            ret["server_class"]     = item.tags.get("Name").split("-")[0]
            ret["server_role"]      = item.tags.get("Name").split("-")[1]
        else:
            ret["server_class"]     = "None"
            ret["server_role"]      = "None"
        ret["env_short"]            = item.tags.get("Environment").split()[0][0]
        if len(token2) > 1: 
            ec2_connection.create_tags([instance], {"Name": item.tags.get("Name").split("-")[0] + "-" + item.tags.get("Name").split("-")[1] + "-" + item.tags.get("Name").split("-")[2].split(".")[0]})
        ret["region_short"]         = regions[item.tags.get("Region")]
        if (item.tags.get("elasticbeanstalk:environment-id")):
            # only add the instance-id to beanstalk nodes
            ret["hostname_full"]   = item.tags.get("Name").split("-")[0] + "-" + item.tags.get("Name").split("-")[1] + "-" + item.tags.get("Name").split("-")[2].split(".")[0] + "." + instance.split("-")[1] + "." + ret["env_short"] + "." + ret["region_short"] + "." + "local.com"
        else:
            ret["hostname_full"]    = item.tags.get("Name").split("-")[0] + "-" + item.tags.get("Name").split("-")[1] + "-" + item.tags.get("Name").split("-")[2].split(".")[0] + "." + ret["env_short"] + "." + ret["region_short"] + "." + "local.com"
        ret["architecture"]         = item.architecture
        ret["availability_zone"]    = item._placement
        ret["vpc_id"]               = item.vpc_id
        ret["instance_id"]          = instance
        ret["private_ip"]           = item.private_ip_address
        ret["private_dns"]          = item.private_dns_name
        if not (item.ip_address):
            ret["public_ip"]        = "None"
        else:
            ret["public_ip"]        = item.ip_address
        if not (item.public_dns_name):
            ret["public_dns"]       = "None"
        else:
            ret["public_dns"]       = item.public_dns_name
        ret["launch_time"]          = item.launch_time
        ret["vpc_id"]               = item.vpc_id
        ret["image_id"]             = item.image_id
        ret["key_name"]             = item.key_name
        ret["subnet_id"]            = item.subnet_id
        ret["instance_type"]        = item.instance_type
        ret["availability_zone"]    = item.placement
        ret["monitoring_state"]     = item.monitoring_state
        ret["monitored"]            = item.monitored
        ret["state"]                = item.state
        ret["root_device_type"]     = item.root_device_type
        ret["root_device_name"]     = item.root_device_name
        ret["tag_name"]             = item.tags.get("Name").split("-")[0] + "-" + item.tags.get("Name").split("-")[1] + "-" + item.tags.get("Name").split("-")[2].split(".")[0]
        ret["tag_environment"]      = item.tags.get("Environment")
        ret["tag_region"]           = item.tags.get("Region")
        ret["tag_site_name"]        = item.tags.get("SiteName")
        ret["tag_beanstalk_id"]     = item.tags.get("elasticbeanstalk:environment-id")
        ret["tag_beanstalk_name"]   = item.tags.get("elasticbeanstalk:environment-name")
    ec2_connection.close()
    return json.dumps(ret)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('-r', '--region',   nargs='?', metavar='', default="",help='' )
    parser.add_argument('-i', '--instance', nargs='?', metavar='', default="",help='' )
    parser.add_argument('-f', '--field', nargs='?', metavar='', default="",help='' )
    args = parser.parse_args()
    if not (args.region) or not (args.instance):
        r = os.popen("curl -s http://169.254.169.254/latest/dynamic/instance-identity/document |grep region | awk -F\\\" '{print $4}'")
        i = os.popen("curl -s http://169.254.169.254/latest/meta-data/instance-id/")
        args.region = r.read().rstrip()
        args.instance = i.read().rstrip()
    json_data = getNodes(args.region, args.instance)
    data = json.loads(json_data)
    if (args.field == "json"):
        print json_data
    elif not(args.field):
        for k,v in data.items():
            print "%s=%s" % (k,v)
    else:
        print data[args.field]
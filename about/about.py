#!/usr/bin/env python3
import json
import os
import argparse
import getpass

parser = argparse.ArgumentParser(description="Get bio information about other users")
parser.add_argument("--edit", type=str)
parser.add_argument("user", default="", nargs="?")
args = parser.parse_args()

def load_user_json(username):
    with open(os.path.join("/opt/pub/about", username + ".json")) as f:
        return json.load(f)
def save_user_json(username, info):
    with open(os.path.join("/opt/pub/about", username + ".json"), "w") as f:
        json.dump(info, f)

if args.edit:
    data = load_user_json(getpass.getuser())
    with open(0) as stdin:
        new_data = stdin.read().rstrip()
    if args.edit not in data.keys():
        print(f"{args.edit}: not a vaild field")
        exit(2)
    data[args.edit] = new_data
    save_user_json(getpass.getuser(), data)
elif args.user:
    data = load_user_json(args.user)
    print(f"username: \033[31m{data['username']}\033[0m")
    print(f"full name: \033[32m{data['full_name']}\033[0m")
    print(f"nickname: \033[32m{data['nick']}\033[0m")
    print(f"pronouns: \033[33m{data['pronouns']}\033[0m")
    print(f"working on: \033[34m{data['working_on']}\033[0m")
    print(f"bio: \033[35m{data['bio']}\033[0m")
    print(f"irc: \033[36m{data['irc']}\033[0m")
    print(f"email: \033[36m{data['username']}@tilde.hackclub.com\033[0m")
else:
    print("Exactly one of --edit or USER must be given")
    parser.print_usage()
    exit(1)

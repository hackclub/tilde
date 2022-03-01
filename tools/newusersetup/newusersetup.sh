#!/usr/bin/env bash
set -e
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"

USERNAME="$(id -nu)"
ID="$(grep "^$USERNAME:" /etc/passwd)"
REAL_NAME="$(cut -d: -f5 <<< $ID)"
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
cat << EOF
${BOLD}     ___                              __
    / / |                            / /
   / /| |__   ___  _ __ ___   ___   / / 
  / / | '_ \ / _ \| '_ \` _ \ / _ \ / /  
 / /  | | | | (_) | | | | | |  __// /   
/_/   |_| |_|\___/|_| |_| |_|\___/_/${NORMAL}
Welcome to the Hack Club Tilde!
This is the 'first-time' setup program, which will setup your ~ for you.
First things first:
EOF

BAD_ERR="Oh no!
This means that Madeline probably messed something up along the way...
Contact them on slack (@swlittle7) to fix this."

while :; do
read -p "Is this your username? $USERNAME [Y/n] " USERNAME_VAILD
if [[ "$USERNAME_VAILD" = "n" ]]; then
   echo "$BAD_ERR"
   exit 1
fi
if [[ "$USERNAME_VAILD" = "y" ]]; then
   break
fi
echo "That's not a vaild answer, you need to type 'y' or 'n'"
done

while :; do
read -p "Is this correct? $REAL_NAME [Y/n] " NAME
if [[ "$NAME" = "n" ]]; then
   echo "$BAD_ERR"
   exit 1
fi

if [[ "$NAME" = "y" ]]; then
	break
fi
echo "That's not a valid answer, you need to type 'y' or 'n'"
done

cat <<EOF

Now, we have a system to give some basic info about a user (like Slack profiles).
Don't worry, you can always change these later with \`$ about --edit\`
To get another user's info, run \`$ about USERNAME\`
EOF

read -p "What's your name? " FULLNAME
read -p "What's your nickname (if any)? " NICK
read -p "What's your timezone offset from UTC (in hours, with decimal (5.0, 3.5))? " OFFSET
printf "Enter your pronouns, one per line: (Press Ctrl+d when you're done)\n"
PRONOUNS=$(cat)
printf "Anything else to put (press Ctrl+d when you're done)\n"
BIO=$(cat)
about --init --edit fullname "${USERNAME}" <<< "$FULLNAME"
about --edit nickname "${USERNAME}" <<< "$NICK"
about --edit timezone "${USERNAME}" <<< "$OFFSET"
about --edit pronouns "${USERNAME}" <<< "$PRONOUNS"
about --edit about "${USERNAME}" <<< "$BIO"

AST="${BOLD}*${NORMAL}"
cat << EOF

Now that we know that your username and real name is correct, let's choose your shell.
There are three shells:
$AST ${RED}Bash${NORMAL}
$AST ${GREEN}ZSH${NORMAL}
$AST ${YELLOW}Fish${NORMAL}

${RED}Bash${NORMAL} is a simple shell, without lots of features set up out of the box. Its syntax looks like:
${BLUE}\$ while :; do; foo; done${NORMAL}
${GREEN}ZSH${NORMAL} is pretty similar to Bash, except it has more features set up and frameworks to help you manange it. It looks like bash:
${BLUE}\$ while :; do; foo; done${NORMAL}
${YELLOW}Fish${NORMAL} has lots of features and is easy to set up, but it differs from bash in several ways. Fish looks like:
${BLUE}\$ while true
>       foo
> end${NORMAL}
(You'll need to enter your password to change your shell)
EOF

while :
do
   read -p "What shell do you want? [fish/zsh/bash] " NEWSHELL;
   if [[ "$NEWSHELL" = "fish" ]]; then
      echo "exec $(which fish)" >> ~/.bash_profile
      echo "exec $(which fish)" >> ~/.bashrc
      break;
   elif [[ "$NEWSHELL" = "zsh" ]]; then
      echo "exec $(which zsh)" >> ~/.bash_profile
      echo "exec $(which zsh)" >> ~/.bashrc
      break;
   elif [[ "$NEWSHELL" = "bash" ]]; then
      break;
   else
      echo "Sorry, that's not a shell, please enter 'bash', 'zsh' or 'fish'";
   fi; done
cat << EOF

${BOLD}                                  __
                                 / /
__      ____      ____      __  / / 
\ \ /\ / /\ \ /\ / /\ \ /\ / / / /  
 \ V  V /  \ V  V /  \ V  V / / /   
  \_/\_/    \_/\_/    \_/\_(_)_/
${NORMAL}
It's time to set up your (free) web hosting now!
(Note, it only supports static HTML/CSS/JS)
EOF
while :; do
read -p "Do you want to setup web hosting? [Y/n] " WEB
if [[ "$WEB" = "y" ]]; then
cat << EOF
There are a few rules:
- The CORS disallows loading from CDN's  external scrips
- Only static HTML/CSS/JS
- Don't be evil
To add files, drop them into \~/public/www
EOF
   while :; do
     read -p "Got it? [Y/n] " GOTIT
     if [[ "$GOTIT" = "y" ]]; then
         break
     fi
     echo "Please say 'y'"
   done
   if [[ ! -d ~/public ]]; then
      mkdir ~/public
   fi
   ln -s /srv/pub/www/$USER ~/public/www
   break
elif [[ "$WEB" = "n" ]]; then
   break
fi
echo "$WEB isn't a 'y' or an 'n'"
done

cat << EOF
${BOLD}                 _       __
                (_)     / /
  __ _ _ __ ___  _     / / 
 / _\` | '_ \` _ \| |   / /  
| (_| | | | | | | |_ / /   
 \__, |_| |_| |_|_(_)_/    
  __/ |                    
 |___/${NORMAL}
There's also Gemini hosting (also free)!
If you haven't heard of Gemini, check it out at https://gemini.circumlunar.space 
EOF

while :; do
   read -p "Do you want to setup your gemini hosting? [Y/n] " GEMINI
   if [[ "$GEMINI" = "y" ]]; then
cat << EOF
To put files into geminispace, drop them into ~/public/gmi
The only rule is 'Don't be evil'
EOF
   while :; do
     read -p "Got it? [Y/n] " GOTIT
     if [[ "$GOTIT" = "y" ]]; then
         break
     fi
     echo "Please say 'y'"
   done
      if [[ ! -d ~/public ]]; then
         mkdir ~/public
      fi
      ln -s /srv/pub/$USER/gmi ~/public/gmi
      break
   elif [[ "$GEMINI" = "n" ]]; then
      break
   fi
done
cat <<EOF
To check your local mail, use neomutt.
Mail is stored in ~/mail.
More info is under \`hcwiki tilde/email\`.
EOF

cat > ~/.muttrc <<EOF
set mbox_type=Maildir
set folder="~/mail"
set spoolfile="~/mail"
set mbox="~/mail"
set mask="!^\\.[^.]"
set sendmail="/run/wrappers/bin/sendmail"
EOF

cat << EOF

You're cleared for liftoff! To find out more, try doing \`wiki tilde/intro\`
If you need to contact an admin, they are:
Madeline: maddie on IRC, madeline@tilde.hackclub.com

${BOLD}
  /\\
  ||
  ||
 /||\\
/:||:\\
|:||:|
|/||\|
${RED}  **
  **
${NORMAL}
(You'll need to log out to have these changes take effect)
Hit enter to log out...
EOF
read NOTHING
sed -e 's/exec newusersetup//' -i ~/.bash_profile
exit

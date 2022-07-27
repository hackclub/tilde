![~Hack](https://user-images.githubusercontent.com/19589006/181282256-3f32dca2-0733-46b4-807b-d2ac53175a01.png#gh-dark-mode-only)
![~Hack](https://user-images.githubusercontent.com/19589006/181281659-3bcf85cc-0830-47e9-a0d2-4976e8199083.png#gh-light-mode-only)

This is the repo containing the [NixOS](https://nixos.org) configuration for the [hack club tilde](https://tilde.hackclub.com).
If you've come here looking to join the tilde, you should first join the [hack club](https://hackclub.com) slack.
When you are in the hackclub slack, join the `#tilde` channel and ask politely to join, providing a SSH key to login.

## Instructions to rebuild
Due to a bug in Nix3, using `--flake github:hackclub/tilde` doesn't work unless you collect garbage first.
The current workaround is to issue:
```bash
$ git clone https://github.com/hackclub/tilde
$ sudo nixos-rebuild switch --flake ./tilde/
```

## Joining / Adding a user
The current system of web and gemini hosting depends on certain directories being created. Currently, this is automated with the `addusr` script (`:/tools/addusr/addusr.sh`).

***Currently, all PR's to add a user will be rejected because of this***

This rule does _not_ apply to modifying a user.

The proper method of joining is to join `#tilde` on the [hack club](https://hackclub.com) slack and ask nicely.

## Services offered
Currently, the only internet-facing services offered are static HTTP hosting and static Gemini hosting. The CORS policy is set to _disallow_ loading remote resources- everything should be on the slack.
Each users has a `/srv/pub/www/${USER}` and a `/srv/pub/gmi/${USER}` which is accessible at `https://tilde.hackclub.com/~${USER` or `gemini://tilde.hackclub.com/~${USER}`
In addition, if your development workflow is missing something, chances are we'll be happy to install it.

## Rules of the server
All interactions on the tilde server must abide by the [hack club code of conduct](https://github.com/hackclub/hackclub/blob/main/CODE_OF_CONDUCT.md).
This means:
- IRC messages
- HTTP content
- Gemini content
- `wall` / `write`

In addition, you should not:

- Look at other people's files without their permission
- Move / Copy / Delete other people's files
- Use the tilde to compile large packages (compiling small stuff is okay, though)
- Use the tilde as your personal file storage server

These rules are not the only rules you are beholden to, if someone asks you to stop doing something, stop.


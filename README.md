# Dotfiles

## Setup
```
curl https://raw.githubusercontent.com/zjp/dotfiles/main/.config/zjp/setup.sh > setup.sh
```

Then inspect `setup.sh` for correctness and ensure it has not been modified by
a MITM attack before running it.

## What's up with the 4 different distros in your setup script?
OK, I promise there's a few good reasons for this. I need the WSL section for
Windows, obviously. I like to play video games sometimes, some games that I want
to play don't always place nice with VMs, if they use instructions that are hard
for a VM to execute.

I'm NEVER giving up my Gentoo dotfiles because if I ever wanted to go back to it
it's a huge pain to get back to that exact configuration. Long after it's a dead
distro (should it ever die) I'm leaving them up as a point of pride.

### But you don't HAVE to give them up -- THAT'S THE POINT OF GIT!
I hear you, but the cost of not having to deal with git in this instance is very
cheap -- around 100 kilobytes of text.

```
$ cd ~/.config/portage
$ cat */*/* | wc -c
87134
```

### So what do you use now?
NixOS, but I keep Guix dotfiles just in case.

I can't really decide whether I like NixOS or Guix more. I don't have a
religious opposition to SystemD, but on the other hand using a full programming
language has its advantage over a DSL. But then again, having to port all the
nonfree software I want to use to Guix.

Pros for Guix:
- Was less of a PITA to get a GUI
- Fully programmable
- No SystemD

Pros for NixOS
- SystemD familiarity
- Software availability

I will probably stay on NixOS for now, but I have _high_ hopes for Guix.

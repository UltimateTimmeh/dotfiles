# UltimateTimmeh's .dotfiles repository

Welcome to my personal dotfiles repository. Feel free to use anything you see
here, but do so at your own risk! This dotfiles repository includes a
procedure for automatically installing a bunch of software items and their
configuration files. It is intended to be used on Debian Buster with Xfce4
desktop environment, so beware!

## Installation procedure quickguide

Assuming a fresh installation of Debian Buster with Xfce4 desktop environment,
do the following:

1. Open a terminal.
1. `su -`
1. `nano /etc/apt/sources.list`
1. Include contrib and non-free at the end of each line, exit with Ctrl+X,
   save the file.
1. `apt update`
1. `apt install sudo`
1. `adduser <user> sudo`
1. Log out and back in.
1. Open a terminal.
1. `sudo apt install apt-transport-https make git`
1. `git clone https://github.com/UltimateTimmeh/dotfiles.git ~/.dotfiles`
1. `cd ~/.dotfiles`
1. `make install`
1. Follow instructions to install desired software and configuration items.

## Installation procedure details

### Installation modules

To make it easier to add or remove software items, the installation procedure
has been split into several 'modules'. Each module deals with a single
software item and its configuration files. In essence, each module is a batch
script named `install_<softwareitem>` with two functions defined inside: (i)
`software`, for installing the software item itself, its dependencies and
perhaps extras, and (ii) `config`, for installing the configuration files
relevant to the software item.

If you want to add your own installation modules, you can use the
`scripts/template` file to get started.

### Running the installation procedure

Running the installation procedure is best done using `make`. There are four
make targets:

- `make software`: Installs all software items by executing the `software`
  function in all installation modules. All installation modules included in
  this repository install software in one of three ways: (i) using the package
  manager, (ii) by downloading and installing a .deb file or (iii) by cloning
  a Git repository. As expected, the first two typically require root
  priviliges.

- `make config`: Installs the configuration files of all software items by
  executing the `config` function in all installation modules. All installation
  modules included in this repository install configuration files by creating a
  symlink, pointing to the relevant file in the dotfiles repository, at the
  location where the software item expects to find it. If a file already exists
  at that location (e.g. previously existing configuration files), then the
  existing file is first moved to the configuration file backup directory
  `~/.dotfilesbak` with a timestamp appended to it.

- `make clean`: Removes the configuration file backup directory
  `~/.dotfilesbak`.

- `make install`: Executes all three of the above in the given order.

Note that the default installation procedure in this dotfiles repository
always asks for permission before installing each software item or its
configuration files. This safeguard is programmed into the installation
modules themselves, not the outer scope!

### Included software items

This repository includes installation modules for the following software items:

- **GIMP**: The poor man's Photoshop. Installed with the package manager (gimp).

- **Git**: Version control system. Also installs gitk, a graphical visualizer
  for Git repositories. Installed with the package manager (git gitk).
  Configuration available.

- **Google Chrome**: My preferred web browser. Installed from the official .deb
  file downloaded from Google.

- **LibreOffice**: The poor man's Office suite. Installed with the package
  manager (libreoffice).

- **mlocate**: Uses a routinely-updated database of the filesystem to search for
  files more quickly than with the `find` command. Installed with the package
  manager (mlocate).

- **PCManFM**: My preferred file manager. Installed with the package manager
  (pcmanfm). Configuration available.

- **Qalculate!**: A powerfull calculator. Installed with the package manager
  (qalculate).

- **ssh**: Provides secure access to and from remote machines. Also installs
  sshfs, for mounting remote filesystems. Installed with the package manager
  (ssh sshfs). Configuration available.

- **Sublime Text**: My preferred text editor. Installed from the Sublime Text
  package repositories (sublime-text). Configuration available.

  *Note:* Installation of the Sublime Text configuration sets up automatic
  installation of Package Control and a number of Sublime Packages, applied when
  starting Sublime Text for the first time.

- **Xfce4**: My preferred desktop environment. Doesn't install software items
  (because I'm assuming those are already installed), but includes installation
  of the following configuration:
  - .bashrc
  - xfce4-terminal

### Testing

The installation procedure is periodically tested on a virtual machine with a
fresh installation of Debian Bullseye with Xfce4 desktop environment.

## Extras

Following is a whole bunch of extras and Debian tips/tricks I've collected over
the years.

### Keyboard Shortcuts

I find the following keyboard shortcuts useful. They can be configured in
`Application menu` > `Settings` > `Keyboard` > `Application Shortcuts`:

| Key(s)      | Command                      | Effect                     |
|:----------- |:---------------------------- |:-------------------------- |
| Ctrl+Alt+T  | xfce4-terminal               | Open a terminal window     |
| Ctrl+Alt+F  | pcmanfm                      | Open a file manager window |
| Ctrl+Alt+S  | subl                         | Launch Sublime Text        |
| Calculator  | qalculate                    | Launch Qalculate!          |
| PrntScrn    | xfce4-screenshooter          | Take a screenshot          |

### Compose key

To type characters like `é` and `ç` using a QWERTY keyboard layout, you need to
configure the `compose` key. This can be done by editing the following line in
the file /etc/default/keyboard (only possible with root permissions, of
course)::

    XKBOPTIONS="compose:rctrl"

This will set the `Right Ctrl` key as the compose key. Here's a list of all
compose key possibilities:

    compose:ralt    Right Alt
    compose:lwin    Left Win
    compose:rwin    Right Win
    compose:menu    Menu
    compose:lctrl   Left Ctrl
    compose:rctrl   Right Ctrl
    compose:caps    Caps Lock
    compose:102     &lt;Less/Greater&gt;
    compose:paus    Pause
    compose:prsc    PrtSc
    compose:sclk    Scroll Lock

You need to reboot for the change to take effect. Once restarted, you can try
typing an `é`. Open a text editor. While holding the compose key, type the `'`
key. Release the compose key and then type `e`. The result should be `é`. Try
different combinations! Can you figure out how to type `ç`?

### Install Linux kernel headers

Every now and then, updating Debian packages includes installing a new kernel.
When running Debian through Virtual Box, this means the guest additions will no
longer work properly, and you have to re-install them. Before you can do that,
however, you first need to install new Linux kernel headers. You can do so
with this command::

    sudo apt install linux-headers-$(uname -r)

## To do

- Include setting up the behavior of the PgUp key (or automate).
  This is found in the file `/etc/inputrc`.
- Installation of templates (python script, pyformex script, libreoffice docs, etc...).

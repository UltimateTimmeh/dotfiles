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

- **LibreOffice**: The poor man's Office suite. Installed with the package
  manager (libreoffice).

- **Linux kernel headers**: The latest Linux kernel headers, needed to build the
  VirtualBox Guest Additions.

- **mlocate**: Uses a routinely-updated database of the filesystem to search for
  files more quickly than with the `find` command. Installed with the package
  manager (mlocate).

- **PCManFM**: My preferred file manager. Installed with the package manager
  (pcmanfm). Configuration available.

- **ssh**: Provides secure access to and from remote machines. Also installs
  sshfs, for mounting remote filesystems. Installed with the package manager
  (ssh sshfs). Configuration available.

- **Xfce4**: My preferred desktop environment. Doesn't install software items
  (because I'm assuming those are already installed), but includes installation
  of the following configuration:
  - .bashrc
  - xfce4-terminal

### Testing

The installation procedure is periodically used on a virtual machine with a
fresh installation of the latest Debian release with Xfce4 desktop environment.

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
| Ctrl+Alt+S  | code                         | Launch Visual Studio Code  |

### Compose key

To type characters like `é` and `ç` using a QWERTY keyboard layout, you need to
configure the `compose` key. In Xfce this can be done by navigating to
`Settings -> Keyboard`, selecting the `Layout` tab and specifying the `Compose
key` to your key of choosing. You may have to disable `Use system defaults` to
be able to select a compose key. My preference goes to `Caps Lock`, since I
otherwise don't really use it anyway.

After configuring the compose key, try typing an `é`. Open a text editor. After
tapping the compose key, type the `'` key followed by the `e` key. The result
should be `é`. Try different combinations! Can you figure out how to type `ç`?
There are many possible and very useful combinations.

You can usually find a full list in the following file, every line starting
with `<Multi_key>` can be typed using the compose key:

    /usr/share/X11/locale/en_US.UTF-8/Compose

### Install Linux kernel headers

Every now and then, updating Debian packages includes installing a new kernel.
When running Debian through Virtual Box, this means the guest additions will no
longer work properly, and you have to re-install them. Before you can do that,
however, you first need to install new Linux kernel headers. There is an
installation module for this included in the dotfiles, or you can do so
manually with this command:

    sudo apt install linux-headers-$(uname -r)

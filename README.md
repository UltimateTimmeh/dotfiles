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

- **Deluge**: BitTorrent client. Installed with the package manager (deluge).
  Configuration available.

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

- **PulseAudio**: Better sound input/output/volume control. Installed with the
  package manager (pulseaudio pavucontrol).

- **pyFormex**: For manipulating geometrical structures and setting up FEA/CFD
  simulations. Installed from the developer Git repository (credentials
  required). Also installs a lot of dependencies using the package manager
  (python-numpy python-opengl python-qt4 python-pyside python-qt4-gl python-dev
  libglu1-mesa-dev libfreetype6-dev python-matplotlib pkg-config libgts-dev
  libglib2.0-dev gcc docutils-common admesh paraview vtk6 python-vtk6 vmtk
  python-vmtk units python-scipy python-dicom) and some extras included in
  the source of pyFormex itself. Configuration available.

  *Note:* Importing VTK while running pyFormex can cause segmentation faults
  in pyFormex. This is caused by a conflict between the VTK and pyFormex QT
  bindings. To prevent this from happening, comment out the import of the `dl`
  module in VTK's `__init__.py` file. This is not a proper fix, and because of
  that it should be temporary and not automated.

- **Qalculate!**: A powerfull calculator. Installed with the package manager
  (qalculate).

- **scrot**: Simple command line screen capture utility. Installed with the
  package manager (scrot).

- **ssh**: Provides secure access to and from remote machines. Also installs
  sshfs, for mounting remote filesystems. Installed with the package manager
  (ssh sshfs). Configuration available.

- **Sublime Text 3**: My preferred text editor. Installed from the Sublime Text
  package repositories (sublime-text). Configuration available.

  *Note:* Installation of the Sublime Text 3 configuration sets up automatic
  installation of Package Control and a number of Sublime Packages, applied when
  starting Sublime Text 3 for the first time.

- **Thunderbird**: Mail client. Also installs Lightning, for calendar support in
  Thunderbird, and the Google Calendar provider for Lightning. Installed with
  the package manager (thunderbird lightning calendar-google-provider).

- **VLC Media Player**: My preferred media player. Installed with the package
  manager (vlc).

- **Xfce4**: My preferred desktop environment. Doesn't install software items
  (because I'm assuming those are already installed), but includes installation
  of the following configuration:
  - .bashrc
  - xfce4-terminal

### Testing

The installation procedure is periodically tested on a virtual machine with a
fresh installation of Debian Buster with Xfce4 desktop environment.

## Extras

Following is a whole bunch of extras and Debian tips/tricks I've collected over
the years. Note that this list was started back when I was still running Debian
Jessie, so some of it may be outdated and/or irrelevant by now.

### Keyboard Shortcuts

I find the following keyboard shortcuts useful. They can be configured in
`Application menu` > `Settings` > `Keyboard` > `Application Shortcuts`:

| Key(s)      | Command                      | Effect                     |
|:----------- |:---------------------------- |:-------------------------- |
| Ctrl+Alt+T  | xfce4-terminal               | Open a terminal window     |
| Ctrl+Alt+F  | pcmanfm                      | Open a file manager window |
| Ctrl+Alt+B  | google-chrome                | Launch Google Chrome       |
| Ctrl+Alt+S  | subl                         | Launch Sublime Text 3      |
| Calculator  | qalculate                    | Launch Qalculate!          |
| PrntScrn    | scrot                        | Take a screenshot          |
| Mute        | pactl set-sink-mute 0 toggle | Toggle mute                |
| Vol. Down   | pactl set-sink-volume 0 -2%  | Decrease volume            |
| Vol. Up     | pactl set-sink-volume 0 +2%  | Increase volume            |
| Ctrl+Alt+A  | pavucontrol                  | Open volume controls       |
| Ctrl+Alt+V  | nvidia-settings              | Open NVIDIA settings       |

### Volume control

If there is no sound, or audio is otherwise difficult to control, the package
`pavucontrol` can be installed. This package allows extensive control over all
things audio (both in- and output) and can most likely be used to fix whatever
is preventing sound from coming out of the laptop's speakers.

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

### Low resolution

It's possible that, after completing the operating system's installation
process, it appears as though the resolution of your applications is wrong
(e.g. the desktop resolution looks fine but the text in the menus is bigger
than you expected, everything in your browser looks huge, etc...). This might
not be a problem with resolution at all, but with the DPI setting.

To fix this, open `Application Menu` > `Settings` > `Appearance`. In the tab
`Fonts`, you can change the DPI setting. A good default setting is 96. If
it already is 96, then just change it to whatever (e.g. 97) and change it
back. This will trigger an update to the correct DPI setting, and you should
immediately see the size of text in the `Appearance` menu change to something
that looks better. For the changes to take effect in other applications (such
as your browser), you might have to restart the application. A full reboot
should not be necessary.

If the "resolution" of the Debian login screen also looks incorrect, then the
previously mentioned steps won't fix that. Here you need to manually configure
the DPI setting in the `/etc/X11/xorg.conf` file (using root privileges). In
the `Monitor` section, add the following:

    Section "Monitor"
        ...
    Option         "DPI"   "96 x 96" (<-- add this line)
    EndSection

Of cource you can use whatever you want instead of 96. Now reboot, and your
login screen should look OK.

### Abaqus

Abaqus is installed by copying it from a FEops server. Of course this means
you need to have a user account at FEops. As root, do the following::

    # mkdir -pv /usr/local/abaqus/Commands
    # rsync user@server:/usr/local/abaqus/VER /usr/local/abaqus -av[n]

In the second command VER is one of 6.10-1, 6.11-1, 6.12-1, 6.13-5, 6.14-1,
6.5-4, 6.6-2, 6.7-3, 6.8-1, 6.9-2, 6.9-EF1. The second command should be
repeated for every version you wish to install. The optional n parameter is
to execute a dry run of the rsync operation, to make sure what will be copied
is correct.

Then, to create the abaqus links and choose a default version, do the
following (still as root)::

    # rsync user@feops1:/usr/local/sbin/abq_links /usr/local/sbin
    # rsync user@feops1:/usr/local/bin/abq_lic /usr/local/bin
    # abq_links

That should be it!

### Dualboot clock setup

When switching between Windows and Debian, there can be a few problems
concerning the clock showing an incorrect time on either Debian or Windows.
For me the problem was as follows; I manually set the hardware clock to
UTC, because Debian assumes the hardware clock to be UTC and then adjusts that
to local time depending on the configured time zone. But when I switch to
Windows, the clock on Windows would be one hour behind (because it assumes
the hardware clock to be local time). After a while (and if there is an
internet connection), Windows will update the hardware clock to the correct
local time. If I switch back to Debian, the clock there will now be one hour
ahead. To get the correct time back on Debian, I have to reboot into the
BIOS and manually set the hardware clock back to UTC. That's just plain
annoying, so I figured out this permanent fix:

1.  Install NTP (I'm not actually sure this step is required for this fix
    to work). This package is supposed to automatically set the clock over
    the internet. However, since I always had to go into the BIOS to manually
    set the hardware clock back to UTC if I wanted the correct time back on
    Debian after having switched to Windows, I'm not entirely sure this works
    properly for me:

        # apt-get install ntp

1.  Edit the file `/etc/adjtime` to make Debian look at the hardware clock
    as local time instead of UTC:

        # nano /etc/adjtime

        Change 'UTC' to 'LOCAL' and save the file.

1.  Reboot. After restarting, Debian will assume the hardware clock to be
    local time and no offset will be applied (just like Windows does). From
    now on, the time should always be the same on both operating systems. If
    this time is currently incorrect, then you will either have to wait for
    Debian to update the clock using NTP (if it works), switch to Windows and
    let it update the clock or jump into the BIOS and do it yourself.

### Multiple monitors

When using multiple monitors, open the `nvidia-settings` application with root
permissions. Go to the `Display Configuration` tab. Activate the `Advanced...`
settings and check `Enable Base Mosaic`. Now select the secondary screen, and
set its `Position` to the correct relative setting.

Save the settings to the X Configuration File (don't merge with existing).
Apply the changes. Workspaces should now be stretched to include the second
monitor.

### Indirect GLX contexts

To enable the indirect GLX contexts, which are necessary for running OpenGL
applications (e.g. pyFormex) remotely over SSH with X11 forwarding, do the
following:

    # nano /usr/share/lightdm/lightdm.conf.d/01_debian.conf

    Add the line 'xserver-command=X -core +iglx' to the bottom of the file,
    save and restart.

## To do

- Include setting up the behavior of the PgUp key (or automate).
  This is found in the file `/etc/inputrc`.
- Add "Debian tips and tricks" to this file.
- Installation of templates (python script, pyformex script, libreoffice docs, etc...).
- Installation of nvidia-driver nvidia-settings (?)

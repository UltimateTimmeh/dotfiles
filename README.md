# UltimateTimmeh's .dotfiles repository

Welcome to my personal dotfiles repository. Feel free to use anything you see
here, but do so at your own risk! This dotfiles repository includes a
procedure for automatically installing a bunch of software items and their
configuration files. It is intended to be used on Debian Stretch with Xfce4
desktop environment, so beware!

## Installation procedure quickguide

1. `git clone https://github.com/UltimateTimmeh/dotfiles.git ~/.dotfiles`
1. `cd ~/.dotfiles`
1. `make install`

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

- **Emacs 24**: My preferred terminal text editor. Installed with the package
  manager (emacs24). Configuration available.

- **GIMP**: The poor man's Photoshop. Installed with the package manager (gimp).

- **Git**: Version control system. Also installs gitk, a graphical visualizer
  for Git repositories. Installed with the package manager (git gitk).
  Configuration available.

- **Google Chrome**: My preferred web browser. Installed from the official .deb
  file downloaded from Google.

- **LibreOffice**: The poor man's Office suite. Installed with the package
  manager (libreoffice).

- **MITRALguide-pp**: pyFormex application for pre- and postprocessing of
  MITRALguide case FEA and CFD simulations. Installed from the developer Git
  repository (credentials required).

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

- **TAVIguide-pp**: pyFormex application for pre- and postprocessing of
  TAVIguide case FEA and CFD simulations. Installed from the developer Git
  repository (credentials required). Configuration available.

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
  - xfce4-keyboard-shortcuts

### Testing

The installation procedure is frequently tested on a virtual machine with a
fresh installation of Debian Stretch with Xfce4 desktop environment.

### Issues

1. Installing the keyboard shortcuts doesn't work. The symlink is created
   correctly, but the keyboard shortcuts are not picked up. Logging out and
   in doesn't fix this. Checking the application shortcuts in the keyboard
   menu shows that the shortcuts are indeed not there, and when adding one
   manually the symlink is overwritten.

## Keyboard Shortcuts

The Xfce4 installation module includes the installation of a set of keyboard
shortcuts. When installed, the following keyboard shortcuts become available:

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

## Debian Stretch installation guide

UNDER CONSTRUCTION.

The first thing you should do once Debian Stretch has been installed, is
execute the full installation procedure included in this dotfiles repository
(well, you should *probably* first configure the logical volume groups):

1. Open a terminal.
1. `su`
1. `nano /etc/apt/sources.list`
1. Include contrib and non-free at the end of each line, exit with Ctrl+X,
   save the file.
1. `apt-get update`
1. `apt-get install sudo`
1. `adduser <user> sudo`
1. Log out and back in.
1. Open a terminal.
1. `sudo apt-get install apt-transport-https make git`
1. `git clone https://github.com/UltimateTimmeh/dotfiles.git ~/.dotfiles`
1. `cd ~/.dotfiles`
1. `make install`

## To do

- Add full Debian Stretch installation procedure. Include setting up the
  behavior of the PgUp key (or automate).
- Add "Debian tips and tricks" to this file.
- Add installation of templates.
- Add more software items:
  - nvidia-driver nvidia-settings (?)

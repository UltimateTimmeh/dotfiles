# UltimateTimmeh's .dotfiles repository

This is my personal dotfiles repository. Feel free to use anything you see
here, but do so at your own risk!

## Fresh install quickguide.

Following is a quick step-by-step guide for installing this dotfiles
repository after a fresh installation of your OS. The installation scripts and
this guide were created for a fresh installation of Debian Stretch with Xfce
desktop environment.

1. Open a terminal.
1. `su`
1. Edit /etc/apt/sources.list to include contrib and non-free.
1. `apt-get update`, `apt-get install sudo`
1. `adduser <user> sudo`
1. Log out and back in.
1. Open a terminal.
1. `sudo apt-get install make git`
1. `git clone https://github.com/UltimateTimmeh/dotfiles.git $HOME/.dotfiles`
1. `cd $HOME/.dotfiles`
1. `make install`
1. When prompted, decide if you want to install the specified software or
   configuration.

**Installation of the following software is included:**

- Deluge: BitTorrent client. Installed with the package manager (deluge).

- Emacs 24: For when a proper terminal text editor is needed. Installed with
  the package manager (emacs24).

- GIMP: The poor man's Photoshop. Installed with the package manager (gimp).

- Git: Version control system. Also installs gitk, a graphical visualizer for
  Git repositories. Installed with the package manager (git gitk).

- Google Chrome: My preferred web browser. Installed from the official .deb
  file downloaded from Google's website.

- LibreOffice: The poor man's Office suite. Installed with the package
  manager (libreoffice).

- MITRALguide-pp: pyFormex application for pre- and postprocessing of
  MITRALguide case FEA and CFD simulations. Installed from the developer GIT
  repository (credentials required).

- mlocate: Uses a previously-created database of the filesystem to more quickly
  find files. Installed with the package manager (mlocate).

- PCManFM: Better file manager than Thunar. Installed with the package manager
  (pcmanfm). **Note:** Bind this package to 'Ctrl+Alt+F' for easy access.

- PulseAudio: Better sound input/output/volume control. Installed with the
  package manager (pulseaudio pavucontrol).

- pyFormex: For manipulating geometrical structures and setting up FEA/CFD
  simulations. Installed from the developer GIT repository (credentials
  required). Also installs a lot of dependencies using the package manager
  (python-numpy python-opengl python-qt4 python-pyside python-qt4-gl python-dev
  libglu1-mesa-dev libfreetype6-dev python-matplotlib pkg-config libgts-dev
  libglib2.0-dev gcc docutils-common admesh paraview vtk6 python-vtk6 vmtk
  python-vmtk units python-scipy python-dicom). **Note:** the GTS extras
  included in the pyFormex source are not yet automatically installed. Go to
  pyformex/pyformex/extra/gts and run `sudo make all` to install them.
  **Note:** Importing VTK while running pyFormex can cause segmentation faults
  in pyFormex. This is caused by a conflict between the VTK and pyFormex QT
  bindings. To prevent this from happening, comment out the import of the `dl`
  module in VTK's `__init__.py` file. To find this file, use
  `locate vtk/__init__.py`

- Qalculate!: A powerfull calculator. Installed with the package manager
  (qalculate). **Note:** Bind this package to the 'Calculator' key for easy
  access.

- scrot: Command line screen capture utility. Installed with the package
  manager (scrot). **Note:** Bind this package to the 'Print' key for easy
  access.

- ssh: Provides secure access to and from remote machines. Also installs sshfs,
  for mounting remote filesystems. Installed with the package manager (ssh
  sshfs).

- Sublime Text 3: For all the main programming and text editing tasks.
  Installed from the official .deb file downloaded from Sublime Text's website.
  **Note:** Packages are not yet automatically installed, but the 'User' config
  directory in the dotfiles repository contains a list. **Note:** Bind this
  package to 'Ctrl+Alt+S' for easy access.

- TAVIguide-pp: pyFormex application for pre- and postprocessing of TAVIguide
  case FEA and CFD simulations. Installed from the developer GIT repository
  (credentials required).

- Thunderbird: Mail client. Also installs Lightning, for calendar support in
  Thunderbird, and the Google Calendar provider for Lightning. Installed with
  the package manager (thunderbird lightning calendar-google-provider).

- VLC Media Player: The best all-round media player. Installed with the package
  manager (vlc).

**Configuration is included for the following software:**

- Deluge
- Emacs 24
- Git
- PCManFM
- pyFormex
- ssh
- Sublime Text 3
- TAVIguide-pp
- Xfce Terminal (includes installation of .bashrc)

## To do

- Add cleaner verbosity in installation scripts.
- Turn "Debian tips and tricks" into markdown instead of plain text.
- Add list of custom system keyboard shortcuts (e.g. Ctrl+Alt+F to open file manager).
- Add MITRALguide-pp and new TAVIguide-pp config files.
- Improve backup so files with the chance of files with the same name
  overwriting each other is lower.
- Make alias 'pyformex' general with $HOME.
- Automatically edit/replace vtk init file after installing pyFormex
  dependencies.
- Add instructions for setting the behavior of the 'PgUp' key in the terminal.
- Remove downloaded .deb file after installation.
- Add more automatic software installations:

  - pyformex extras
  - Sublime Text 3 Packages

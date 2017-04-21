# UltimateTimmeh's .dotfiles repository

This is my personal dotfiles repository. Feel free to use anything you see
here, but do so at your own risk!

## Fresh install quickguide.

Following is a quick step-by-step guide of what you have to do to install this
dotfiles repository after a fresh installation of your OS. This guide
was created assuming a fresh installation of Debian Stretch with XFCE4
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
1. When prompted, decide if you want to install the specified software.
   For safety, the default is always 'No'.

This procedure currently installs the following software (of course always asking permission first):

**General:**

- sshfs: For mounting remote filesystems. Installed with the package
  manager (sshfs). **Note:** A few aliases in .bash_aliases require this,
  but installing this package alone is not enough since the mountpoints don't
  exist in a fresh install.
- mlocate: Uses a database of the filesystem to more quickly find files.
  Installed with the package manager (mlocate).
- gitk: Graphical visualizer for Git repositories. Installed with the package
  manager (git gitk). **Note:** Also installs Git, if for some reason this is
  not yet installed.
- PCManFM: Better file manager than Thunar. Installed with the package manager
  (pcmanfm). **Note:** Bind this package to 'Ctrl+Alt+F' for easy access.
- Emacs 24: For when a proper terminal text editor is needed. Installed with
  the package manager (emacs24).
- Sublime Text 3: For all the main programming and text editing tasks.
  Installed from the .deb file downloaded from Sublime Text's official website.
  **Note:** Packages are not yet automatically installed, but the 'User' config
  directory in the dotfiles repository contains a list. **Note:** Bind this
  package to 'Ctrl+Alt+S' for easy access.
- PulseAudio: Better sound input/output/volume control. Installed with the
  package manager (pulseaudio pavucontrol).
- Thunderbird: Mail client. Installed with the package manager (thunderbird
  lightning calendar-google-provider).
- LibreOffice: The poor man's Office suite. Installed with the package
  manager (libreoffice).
- VLC Media Player: The best video player. Installed with the package
  manager (vlc).
- scrot: Command line screen capture utility. Installed with the package
  manager (scrot). **Note:** Bind this package to the 'Print' key for easy
  access.
- GIMP: The poor man's Photoshop. Installed with the package manager (gimp).
- Qalculate!: A powerfull calculator. Installed with the package manager
  (qalculate). **Note:** Bind this package to the 'Calculator' key for easy
  access.
- Deluge: BitTorrent client. Installed with the package manager (deluge).

**Work:**

- pyFormex dependencies: Required to successfully run pyFormex. Installed with
  the package manager (python-numpy python-opengl python-qt4 python-pyside
  python-qt4-gl python-dev libglu1-mesa-dev libfreetype6-dev python-
  pkg-config libgts-dev libglib2.0-dev gcc docutils-common admesh paraview vtk6
  python-vtk6 vmtk python-vmtk units python-scipy python-dicom).
- pyFormex: For manipulating geometrical structures and setting up FEA/CFD
  simulations. Installed from the developer GIT repository (credentials
  required). **Note:** the GTS extras included in the pyFormex source are not yet
  automatically installed. Go to pyformex/pyformex/extra/gts and run `sudo
  make all` to install them.
- TAVIguide-pp: pyFormex application for pre- and postprocessing of TAVIguide
  case FEA and CFD simulations. Installed from the developer GIT repository
  (credentials required).
- MITRALguide-pp: pyFormex application for pre- and postprocessing of
  MITRALguide case FEA and CFD simulations. Installed from the developer GIT
  repository (credentials required).

## To do

- Add cleaner verbosity in installation scripts.
- Turn "Debian tips and tricks" into markdown instead of plain text.
- Add list of custom system keyboard shortcuts (e.g. Ctrl+Alt+F to open file manager).
- Add MITRALguide-pp and new TAVIguide-pp config files.
- Improve backup so files with the chance of files with the same name
  overwriting each other is lower.
- Decouple installation of software and config/others.
- Make alias pyformex general with $HOME.
- Automatically edit/replace vtk init file after installing pyFormex
  dependencies.
- Add instructions for setting the behavior of the 'PgUp' key in the terminal.
- Add more automatic software installations:

  - google-chrome
  - pyformex extras

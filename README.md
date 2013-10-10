Dotfiles with bone2 adaptions
=============================

A collection of my dotfiles used on a Archlinux `x86_64` box.

A special focus is set on tools that use `vi`-like `hjkl` navigation. I use 
some of them (`vim`, `ncmpcpp`, `zathura`) and adapted these to the [bone2 
keyboard layout][1]. Additionally, some other programmes (`tmux`, `mplayer`, 
`muttator` or `vimperator`) offer vi-like modes where I sought to adapt these, 
too. Feel free to take and use whatever you like!

A Note of Caution
=================

Please note that you can't just copy and paste any option to your settings, 
some might need plugins installed, so be sure to research that.

ZSH
===

My zsh configuration is set to use `vi-mode` and the motion keys are of course 
adapted to bone2 as well.  You can find my `.zshrc` in my [prezto][2] 
repository under `runcoms`.

Installation
============

This is mainly for me to simplify setting up a familiar working environment:

  1. Clone the repository:

		git clone --recursive https://github.com/nasenatmer/dotfiles-bone2.git "$HOME/.dotfiles"

  2. Link dotfiles to `$HOME`:

		setopt EXTENDED_GLOB
		for rcfile in "${HOME}"/.dotfiles/^README.md(.N); do
		  ln -s "$rcfile" "${HOME}/.${rcfile:t}"
		done


Updating
========

Pull the latest changes and update submodules.

	git pull && git submodule update --init --recursive

[1]: http://wiki.neo-layout.org/wiki/Bone2
[2]: https://github.com/nasenatmer/prezto

< vim: set tw=78: >

# Dotfiles

## Setup

```bash
ln -sr .ackrc ~/
ln -sr .bash_aliases ~/
ln -sr .gitconfig ~/
ln -sr .vimrc ~/
ln -sr .vim ~/
```

Add to `.bashrc`:

```bash
echo -e "\n#\n# Personal config\n#\n. `pwd`/.bashrc" >> ~/.bashrc

```

or add to `.bash_profile`:

```bash
echo -e "\n#\n# Personal config\n#\n. `pwd`/.bashrc" >> ~/.bash_profile

```

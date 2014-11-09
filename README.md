# Dot Files

## Git

I have excluded my name and email from this config. I recommend that you add
them via system instead:

```
git config --system user.name "John Doe"
git config --system user.email "john.doe@example.com"
```
### Commit hooks

Run to install:

```
ln -s dotfiles/.git-templates ~
git config --global init.templatedir '~/.git-templates'
```

Do `git init` to copy in existing repos


## Vim

Install [vimified](https://github.com/zaiste/vimified), then link `*.vimrc`
files to `.vim` folder.



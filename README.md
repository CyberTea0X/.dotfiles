# Archlinux dotfiles

This .dotfiles uses [dotter](https://github.com/SuperCuber/dotter).
To deploy dotfiles install dotter and write `dotter deploy`

If you do not understand how the directories in this repository are related to real
configs, you should look at the files in the .dotter directory (.toml files), and also read
dotter [wiki](https://github.com/SuperCuber/dotter/wiki). 

To simply use global.toml as is you need to create local.toml in .dotter directory with following configuration:
```toml
packages=["default"]
```

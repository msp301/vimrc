# Contributing

This repo contains all my dotfiles, so like most others they're very opinionated to my coding style.

BUT DON'T BE PUT OFF!!

If you've found a useful addition that we could all benefit from, then please feel free to raise a pull request :-)

# Working with Git Subtrees

To try and keep installation of everything as hands-off as possible vim-plug ([https://github.com/junegunn/vim-plug](https://github.com/junegunn/vim-plug)) has been bundled in so that Neovim ([https://neovim.io/](https://neovim.io/)) can retrieve and install the plugins it requires out of the box.

`vim-plug` is included as a Git subtree rather than a submodule. A subtree is a complete copy of the code from a remote Git repo, whilst a submodule is a symlink to the remote code.

## How to update a subtree?

A remote has been added called `vimplug` which points to my fork of [vim-plug](https://github.com/msp301/vim-plug).
To update vim-plug to the latest version, we can do so with the following command below.

```
git pull -s vim-plug vimplug 0.9.1
```

## Read more about subtrees

[https://help.github.com/articles/about-git-subtree-merges/](https://help.github.com/articles/about-git-subtree-merges/)

[https://git-scm.com/book/en/v1/Git-Tools-Subtree-Merging](https://git-scm.com/book/en/v1/Git-Tools-Subtree-Merging)

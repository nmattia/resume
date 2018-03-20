# The Markdown Resume

Forked from [mszep/pandoc_resume](https://github.com/mszep/pandoc_resume)

### Tweak

``` shell
$ git clone https://github.com/nmattia/resume
$ cd resume
$ vim markdown/resume.md   # insert your own resume info
```

### Build

``` shell
$ nix-build
```

or

``` shell
$ nix-shell
[nix-shell]$ make
```

### Requirements

 * ConTeXt
 * pandoc
 * GNU make

The requirements can be provided by the nix-shell.

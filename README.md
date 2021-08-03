# Rails bulder

This is simple docker environment for build rails app.

#### environment
ruby v.2.6.3

bundler v.2.2.0
## Usage

#### build rails environment on docker
```bash
$ git clone git@github.com:shigehito7110/rails_builder.git
$ cd rails_builder
```
* runing codes on the git hosting services.
```bash
$ bash init.sh <git repogiroty url>

## specify branch
$ bash init.sh <git repogitory url> <branch name>
```
* runing codes existing on your environment.
```bash
$ mkdir Src
$ mv <directory path>/* ./Src
$ make restart
```

show help:
```bash
$ bash init.sh --help
 ## alias -h
```

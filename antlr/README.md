# Learning ANTLR4

Learn parsing using ANTLR4. Don't be serious about the shell script. I just learn how to make a better shell script for the project automation. `psr` means parser btw... Hahaha...

## How to use this repository?

You can install ANTLR4 using `psr` script inside this repository.

```bash
psr install
```

To uninstall it, just issuing

```bash
psr uninstall
```

To install the vscode extension, just issuing

```bash
psr vscode-ext
```

Or if you already have ANTLR4 inside your rig, you can just use `psr` to execute the grammar.

```bash
psr --lang=Python3 --out=python/output [antlr4-arguments]
```

## Is `psr` script portable?

Yes, you can copy it to another ANTLR4 project for helping you generating grammar. This script is just a wrapper btw..

## Experimental

This is nothing... I just learn how to create an activation script like `pipenv` do. To access `psr` command from another directory, you can use this experimental feature or 
just export the project directory to `$PATH` variable.

```bash
# If you use default install, then below command 
# is not required.
psr lite-install     # Generate activation script

source psr_activate

# To deactivate current environment
psr_stop
```

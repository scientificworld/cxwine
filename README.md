# crossover third-party script

### About it

This script invokes the command line tools in the application package of crossover, so that you can use crossover without purchasing it.

You can paste the contents of this script into the profile of your shell.

Notice this script only works on macOS, and it's ok if anyone wants to port it.

### How to use

First you need to create a bottle.

Use `cxcreate` command, For example:

```
cxcreate win7 # Create win7 bottle
cxcreate win10x64 win10_64 # Create win10x64 bottle, which type is win10_64
```

Then set the bottle to default:

```
cxswitch win7 # Set win7 bottle to default
```

And then, you can run your windows application with `cxwine`!

```
cxwine a.exe # Run a.exe
cxwine b.exe arg # Run b.exe with argument "arg"
```

If your application stucks, you can press Ctrl+C to terminate the program forcibly, And don't forget to run `cxfuck` command (in order to kill remaining process)

You can also use `cxdelete` to delete existing bottle.

Enjoy it!

### Bottle types

Here is a list of the types of bottles you can create.

- win98

- win2000

- winxp

- winxp\_64

- winvista

- winvista\_64

- win7

- win7\_64

- win8

- win8\_64

- win10

- win10\_64

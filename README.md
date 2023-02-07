gotoHyperDrive
==========

Custom Implementation of lando/Hyperdrive@v0.6.0
------------

This implementation is a custom implementation of [Hyperdrive](https://github.com/lando/hyperdrive).
The source code has been stripped down to include only the essential components, with an emphasis on updating the dependency versions to ensure compatibility with the latest software. Furthermore, a custom brand color scheme has been integrated to give the implementation a unique and distinctive look.

Todos:
* Update license, add adequate reference to lando/hyperdrive
* Update readme to include right URLs
* Publish similar to our [Scaffolding tool](https://www.npmjs.com/package/@gotoandplay/create-project) for easier install?

<hr style="border-top: 2px solid red; background: transparent;">
Further readme content is WIP:<br><br>
![Work in progress..](https://github.com/Vladislav-Stafinjak/gotoHyperDrive/blob/main/wip.gif)

Installation
------------
```bash
curl -Ls https://github.com/lando/hyperdrive/releases/download/v0.6.1/hyperdrive > /tmp/hyperdrive \
  && chmod +x /tmp/hyperdrive \
  && /tmp/hyperdrive
```

Or with options

```bash
curl -Ls https://github.com/lando/hyperdrive/releases/download/v0.6.1/hyperdrive > /tmp/hyperdrive \
  && chmod +x /tmp/hyperdrive \
  && /tmp/hyperdrive --vim -y
```

You can also download the script to your `$PATH` and then pass in options to make it non-interactive

```bash
curl -Ls https://github.com/lando/hyperdrive/releases/download/v0.6.1/hyperdrive > /usr/local/bin/hyperdrive \
  && chmod +x /usr/local/bin/hyperdrive
```
```bash
hyperdrive -h
  _    _                          _      _
 | |  | |                        | |    (_)
 | |__| |_   _ _ __   ___ _ __ __| |_ __ ___   _____
 |  __  | | | | '_ \ / _ \ '__/ _` | '__| \ \ / / _ \
 | |  | | |_| | |_) |  __/ | | (_| | |  | |\ V /  __/
 |_|  |_|\__, | .__/ \___|_|  \__,_|_|  |_| \_/ \___|
          __/ | |
         |___/|_|

Usage: ./hyperdrive.sh [-yh] [--name name] [--email email] [--vim]

Options:
  -h, --help                Show this help dialog
  -v, --version             Show the version
  -y, --yes                 Auto confirm all yes/no prompts

  --name                    My name eg "Jean Luc Picard"
  --email                   My email eg kirk@starfleet.mil
  --vim                     Install vim with hyperdrive conf

Examples:
  # Run bootscript interactively
  ./hyperdrive.sh

  # Show this usage dialog
  ./hyperdrive.sh -h

  # Run non-interactively with optional vim installation
  ./hyperdrive.sh -y --name "Lando" --email admin@thisfacility.com --vim

```

Environment Variables
---------------------

The above CLI options are also available as environment variables. Take care to `export` the variables. You can ensure that they are set correctly by running `env`.

```bash
export HYPERDRIVE_HELP=false
export HYPERDRIVE_YES=false
export HYPERDRIVE_NAME=James T. Kirk
export HYPERDRIVE_EMAIL=kirk@enterprise.mil
export HYPERDRIVE_VIM=false
```

Development
-----------

You can also warp to the frontier and use the latest dev version of the script.

```bash
# Get the project
git clone https://github.com/lando/hyperdrive.git

# Run the source
./hyperdrive.sh

# Build the compiled script that lives on the interwebs
./build.sh
./bin/hyperdrive

# Release a new version of hyperdrive
#
# NOTE: This will update the readme, make a commit, make a tag and push
# back to the repo
#
# Pass in the version you want to bump to with an optional tag annotation
./release.sh v4.4.4-alpha.12931 "Wretched hive of scum and villiany"
```

Other Resources
---------------

* [Best mountain climbing advice from hyperdrive :D](https://www.youtube.com/watch?v=tkBVDh7my9Q)
<hr style="border-top: 2px solid red; background: transparent;">
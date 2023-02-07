#!/bin/bash

# Do some cleanup
rm -rf ./bin/gotoHyperDrive

# Set some things
VERSION=$(git describe --tags --always --abbrev=0)
OUTPUT="./bin/gotoHyperDrive.sh"

# Set our headers
echo -e "Kicking off a build..."
echo -e "#!/bin/bash" > $OUTPUT

# Add our libraries to the top of things
for LIB in ./lib/*.sh; do
  echo -e "Loading in $LIB"
  echo -e "$(tail -n +2 $LIB)" >> $OUTPUT
done

# Add our checks next
for CHECK in ./checks/*.sh; do
  echo -e "Loading in $CHECK"
  echo -e "$(tail -n +2 $CHECK)" >> $OUTPUT
done

# Add our installers next
for INSTALLER in ./installers/*.sh; do
  echo -e "Loading in $INSTALLER"
  echo -e "$(tail -n +2 $INSTALLER)" >> $OUTPUT
done

# Finally, add in the hyperdrive
echo -e "Addiding in the core navicomputer"
echo -e "$(tail -n +2 ./gotohyper.sh)" >> $OUTPUT

# Set as executable
echo -e "Executing ./bin/gotoHyperDrive"
chmod +x $OUTPUT

echo -e "Done! Compiled script to ./bin/gotoHyperDrive"
echo -e "You can run the scipt now with ./bin/gotoHyperDrive"
exit 0

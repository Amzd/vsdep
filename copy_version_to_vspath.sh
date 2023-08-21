THIS=$(basename "$0")

if [ "$#" -ne 2 ]
then
  echo -e "Incorrect number of arguments. Expected use: \n\t./$THIS <version> <VS path> \n\t./$THIS 1.18.8 /usr/share/vintagestory/"
  exit 1
fi

VERSION=${1%/}
VSPATH=${2%/}

if [ ! -d "$VERSION" ]; then
  echo "Unsupported version ($VERSION). Fork this repo, run `add_new_version.sh` and create a PR or open an issue."
  exit 1
fi

err=0
trap 'err=1' ERR

mkdir -p "$VSPATH/Lib"
mkdir -p "$VSPATH/Mods"

cp -n "$VERSION/Lib/0Harmony.dll" "$VSPATH/Lib"
cp -n "$VERSION/VintagestoryAPI.dll" "$VSPATH"
cp -n "$VERSION/VintagestoryLib.dll" "$VSPATH"
cp -n "$VERSION/Mods/VSEssentials.dll" "$VSPATH/Mods"
cp -n "$VERSION/Mods/VSCreativeMod.dll" "$VSPATH/Mods"
cp -n "$VERSION/Mods/VSSurvivalMod.dll" "$VSPATH/Mods"

if [ $err == 0 ]; then
    echo "Added dependencies to $VSPATH folder"
else
    echo "Something went wrong"
    exit $err
fi

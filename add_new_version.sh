THIS=$(basename "$0")

if [ "$#" -ne 2 ]
then
  echo -e "Incorrect number of arguments. Expected use: \n\t./$THIS <version> <VS path> \n\t./$THIS 1.18.8 /usr/share/vintagestory/"
  exit 1
fi

VERSION=${1%/}
VSPATH=${2%/}

err=0
trap 'err=1' ERR

mkdir -p "$VERSION/Lib"
mkdir -p "$VERSION/Mods"

cp "$VSPATH/VintagestoryAPI.dll" "$VERSION"
cp "$VSPATH/VintagestoryLib.dll" "$VERSION"
cp "$VSPATH/Lib/0Harmony.dll" "$VERSION/Lib"
cp "$VSPATH/Mods/VSEssentials.dll" "$VERSION/Mods"
cp "$VSPATH/Mods/VSCreativeMod.dll" "$VERSION/Mods"
cp "$VSPATH/Mods/VSSurvivalMod.dll" "$VERSION/Mods"

if [ $err == 0 ]; then
    echo "Added dependencies to $VERSION folder"
else
    echo "Something went wrong"
    exit $err
fi

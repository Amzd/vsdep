# vsdep

This action copies the dlls from vintage story to the specified path which allows for compilation of mods on CI.

These dlls are not mine and this is just a partial reupload of the vintage story game to facilitate modders. In case this is not desired and you are the copyright holder, contact me to take this down.

This is a proof of concept. See https://github.com/Amzd/vsmods for usage.

TODO: This should probably download the dlls straight from vintagestory.net instead of requiring someone to upload them?

TODO: How to do mod dependencies?

# Usage

Currently only works on linux as `./file.sh` doesn't work on windows? 

```yaml
  steps:
    - name: Add VS dependencies
      uses: Amzd/vsdep@v1
      with:
        version: 1.18.8
        vspath: /usr/share/vintagestory # Where to put the dlls. This depends on what path you use in your csproj file
```

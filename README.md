# OpenHere

OpenHere is a dead simple tool to open your favorite apps from Finder, alot like OpenInTerminal-Lite.
You can create multiple different openers with the build script. see the pictures
<br>
these helpers will clone the icon of the app they will open

# pictures

build output for my personal opener helpers

<div>
  <img src="https://raw.githubusercontent.com/Complexicon/OpenHere/main/pics/example1.png" width="600px">
</div>

<br>

how they look in your toolbar

<div>
  <img src="https://raw.githubusercontent.com/Complexicon/OpenHere/main/pics/example2.png" width="600px">
</div>

# install

after building your apps with the build command place them somewhere comfy.
then drag them into your toolbar while holding down (Cmd)

> ⚠️ on first start macOS will ask for your permissions to access Finder. these openers need this permission to determine your current working directory

i am going to just steal this gif from OpenInTerminal-Lite

<div>
  <img src="https://user-images.githubusercontent.com/11001224/78590414-67215a80-7874-11ea-97a1-fb8996db6984.gif" width="600px">
</div>


# what you need
- the swiftc compiler
- some sort of terminal

thats it.

# getting a bundleid from an app

`osascript -e 'id of app "NotepadNext"'`

# examples

`usage: ./build <bundleid> <appname>`

```sh
./build com.googlecode.iterm2 "Open in Terminal" # create opener app for iterm2
./build com.microsoft.VSCode "Open in VSCode"
```

# credits
a part of this code is based on the amazing OpenInTerminal Project -> https://github.com/Ji4n1ng/OpenInTerminal
go there if you want more functionality

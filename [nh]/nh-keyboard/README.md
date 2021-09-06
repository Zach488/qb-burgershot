# nh-keyboard
Dynamic Keyboard Input NUI for FiveM

# Information
I created this resource because I couldn't find any good looking NUI resources to input text and have it return back for use, the menu is very dynamic and allows as many options as the screen allows, it's also Open source so feel free to pull request if you have any improvements.

![ShowCase](https://lithi.io/file/PpLF.png)
![ShowCase](https://lithi.io/file/STrt.png)
![ShowCase](https://lithi.io/file/aPqX.png)


# Setup
It's pretty simple, once you drop the nh-keyboard resource into your resources folder just make sure you put

ensure nh-keyboard

in your server.cfg. 

# Examples
If you want to have only one selection simply do something like this:
```
local keyboard = exports["nh-keyboard"]:KeyboardInput({
    header = "Add Item", 
    rows = {
        {
            id = 0, 
            txt = "Spawn Name"
        }
    }
})
if keyboard ~= nil then
    if keyboard[1].input == nil then return end
    TriggerEvent('additem', keyboard[1].input)
end
```
You can also add multiple listing and it would look something like this
```
local keyboard = exports["nh-keyboard"]:KeyboardInput({
    header = "Add Items", 
    rows = {
        {
            id = 0, 
            txt = "Spawn Name"
        },
        {
            id = 1, 
            txt = "Amount"
        }
    }
})

if keyboard ~= nil then
    if keyboard[1].input == nil or keyboard[2].input == nil then return end
    TriggerEvent('additem', keyboard[1].input, keyboard[2].input)
end
```

# Known Bugs
No known bugs

# Support
Feel free to report any issues you have in the GitHub [Issues](https://github.com/nerohiro/nh-keyboard/issues)

if you wish to add something to it, do a pull request on the github [Pull Requests](https://github.com/nerohiro/nh-keyboard/pulls)


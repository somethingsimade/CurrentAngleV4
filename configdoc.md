### "Use default animations"
When true, enables the default animations on the fake character

### "Fake character transparency level"
Level of transparency of the fake character

### "Disable character scripts"
Disable the (fake) character scripts when turned on

### "Fake character should collide"
If the fake character should collide, as of what i remember, this option is broken

### "Parent real character to fake character"
Set the parent of real character to the fake character, if you are trying to convert a script i suggest you set it to true

### "Respawn character"
Instantly reanimate the character, it should be `false` when running the script on AutoExec

### "Instant respawn"
This setting will only make the respawn look fancy, so you dont appear dead while loading, will still take the same time to load. Requires `replicatesignal`

### "Hide HumanoidRootPart"
Will make your `RootPart` be far away from the character, instead of following the fake character's RootPart.

### "PermaDeath fake character"
When `false`, will make the fake character respawn when dead after waiting `Players.RespawnTime`, You will not respawn to the fake character, the reanimate will be "turned off" when you die

### "R15 Reanimate"
This make the `fake character` be R15, so you can use R15 scripts. This does not mean that the reanimate (CurrentAngle V2.5) will work with R15

### "Click Fling"
⚠️ This setting is broken and will teleport you to the void ⚠️

When clicking a player, will attempt fling their character.

### "Hide RootPart Distance"
Will only apply when `Hide HumanoidRootPart` is `true`

Default is CFrame.new(255, 255, 0)

### "Names to exclude from transparency"
Will make those parts not be applied the transparency
Table example:
{
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
}

### "Mode for tool reanimate"
2 Choices: (default is "RightShoulderDestroy")
1. "RightShoulderDestroy"
2. "PermaDeath"

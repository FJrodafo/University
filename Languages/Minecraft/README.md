<div align="center">
    <a href="https://www.minecraft.net/" target="_blank">
        <img alt="logo" width="270" src="https://raw.githubusercontent.com/FJrodafo/University/main/Languages/Minecraft/Assets/Logo.svg" />
    </a>
</div>

## Index

1. [Minecraft Command Language](#minecraft-command-language)
2. [Useful game rules for servers](#useful-game-rules-for-servers)
3. [Pacomeda](#pacomeda)
4. [Target selector variables](#target-selector-variables)
5. [Efects ID](#efects-id)
6. [Colors ID](#colors-id)
7. [Emojis](#emojis)
8. [Websites](#websites)
9. [Custom heads](#custom-heads)
10. [Custom shields](#custom-shields)
11. [Custom potions](#custom-potions)
12. [Invisible items](#inivisible-items)
13. [Rain on the players](#rain-on-the-players)
14. [Drop the owner's skull upon death](#drop-the-owners-skull-upon-death)
15. [Additional information](#additional-information)

## Minecraft Command Language

```sh
# Command Block
/give UserName minecraft:command_block

# Structure Block
/give UserName minecraft:structure_block
```

```sh
# Force load a chunk so commands work anywhere
/forceload 0 0 0
```

## Useful game rules for servers

```sh
# Prevent spam from command messages
/gamerule commandBlockOutput false
```

```sh
# Log used commands
/gamerule logAdminCommands true
```

```sh
# Keep your inventory on death
/gamerule keepInventory true
```

```sh
# Prevent mobs from breaking the environment
/gamerule mobGriefing false
```

```sh
# Prevent fires
/gamerule doFireTick false
```

## Pacomeda

Seed: `7334907763147734721`

```sh
# 1.15.0+

/give @p minecraft:elytra{display:{Name:'{"text":"ナヤイシャ","color":"yellow","italic":false}'},Unbreakable:1b,Enchantments:[{}]} 1

/scoreboard objectives add UserName minecraft.used:minecraft.netherite_pickaxe

/give @p netherite_pickaxe{display:{Name:'{"text":"ナヤイシャ","color":"yellow","italic":false}'},Unbreakable:1b,Enchantments:[{id:binding_curse,lvl:1},{id:vanishing_curse,lvl:1},{id:looting,lvl:4},{id:fortune,lvl:4}]} 1

effect give @a[nbt={Inventory:[{id:"minecraft:netherite_pickaxe",tag:{display:{Name:'{"text":"ナヤイシャ","color":"yellow","italic":false}'}}}]}] minecraft:saturation 2 0 true

execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_pickaxe",Count:1b,tag:{display:{Name:'{"text":"ナヤイシャ","color":"yellow","italic":false}'}}}},scores={UserName=1..}] at @s run execute as @e[distance=..10,limit=1,nbt=!{HurtTime:0s}] at @s run particle minecraft:ambient_entity_effect ~ ~1 ~ 1 1 1 .1 9 force

scoreboard players set @a UserName 0
```

```sh
# Lobby
/tp UserName 0 68 23 -180 0
```

```sh
# Island
/tp UserName -9775 69 15614 -180 0
```

```sh
# Map
/tp UserName -9776 14.2 15551 180 90
```

```sh
# Home
/tp UserName -9770 11 15540 90 90
```

## Target selector variables

| Variable     | Selects                                                      |
| :----------: | :----------------------------------------------------------- |
| `@p`         | the nearest player                                           |
| `@r`         | a random player                                              |
| `@a`         | all players                                                  |
| `@e`         | all entities                                                 |
| `@s`         | the entity executing the command                             |
| `@c`         | the player's agent [Minecraft Education only]                |
| `@v`         | all agents [Minecraft Education only]                        |
| `@initiator` | the player who clicks an NPC dialogue button [BE & edu only] |

## Efects ID

```
absorption
bad_omen
blindness
conduit_power
dolphins_grace
fire_resistence
glowing
haste
health_boost
hero_of_the_village
hunger
instant_damage
instant_health
invisibility
jump_boost
levitation
luck
mining_fatigue
nausea
night_vision
poison
regeneration
resistence
saturation
slow_falling
slowness
speed
strength
unluck
water_breathing
weakness
wither
```

## Colors ID

```
black 0
dark_blue 170
dark_green 43520
dark_aqua 43690
dark_red 11141120
dark_purple 11141290
gold 16755200
gray 11184810
dark_gray 5592405
blue 5592575
green 5635925
aqua 5636095
red 16733525
light_purple 16733695
yellow 16777045
white 16777215

By default "HTML Color Code" (FFFFFF) (FF00FF) (000000)
```

## Emojis

```
⛏🔱🪓🛡🗡🏹🎣⚗🧪🔥⛄🌧⛈❌⭐☘❤⚡✎☠⚠⌛⌚⚓✝☃🌊☮☯ⓂℹΩ☽☀❄☁☂☔☄☺☹☻♀♂♫♩♪♬⚀⚁⚂⚃⚄⚅→←↓↑←↔☞☜⊻⊼⊽⌀⌂™©®☑☒✔✘⏏◆◇■□♠♤♣♧♥♡♦♢★☆¢ψ∞▲△▼▽○◎●Δʊღ₪∧∨∩⊂⊃⊥∀ΞΓΣΠ
```

```
ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ
ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ
⓪①②③④⑤⑥⑦⑧⑨⑩⑪⑫⑬⑭⑮⑯⑰⑱⑲⑳
```

```
⁰¹²³⁴⁵⁶⁷⁸⁹
₀₁₂₃₄₅₆₇₈₉
⅟½⅓¼⅕⅙⅐⅛
```

```
██■▓〓≡╝╚╔╗╬═╓╩┌┐└┘┇▀▄█▌▐░▒▁▂▃▄█
```

```
⏭ ⏯ ⏮ ⏸ ⏹ ⏺
```

## Websites

[Wiki](https://minecraft.fandom.com/wiki/Commands)

[Command Block](https://minecraft.fandom.com/wiki/Command_Block)

[Commands](https://www.minecraft.net/en-us/article/minecraft-commands)

[Data component format](https://minecraft.wiki/w/Data_component_format)

[Custom mobs](https://www.digminecraft.com/generators/summon_mob.php)

[Custom skins](https://www.minecraftskins.com/)

[Custom heads](https://minecraft-heads.com/custom-heads)

[Custom shields](https://minecraft.tools/en/shield-galery.php)

[Book editors](https://minecraft.tools/en/book.php)

[1.20.4→1.20.5 Command Converter](https://docs.papermc.io/misc/tools/item-command-converter)

## Custom heads

```sh
# Your own head

# 1.15.0+
/give @s minecraft:player_head{SkullOwner:UserName}

# 1.20.6+
/give @p minecraft:player_head[minecraft:profile={name:"UserName"}]
```

## Custom shields

```sh
# Shield color

# 1.20.6+
/give @p minecraft:shield[minecraft:base_color="white"]
```

```sh
# Pirate

# 1.15.0+
/give @s minecraft:shield{BlockEntityTag:{Base:15,Patterns:[{Color:7,Pattern:"cbo"},{Color:15,Pattern:"sc"},{Color:15,Pattern:"bri"},{Color:15,Pattern:"bri"},{Color:0,Pattern:"sku"}]}}

# 1.20.6+
/give @p minecraft:shield[minecraft:base_color="black",minecraft:banner_patterns=[{color:"gray",pattern:"minecraft:curly_border"},{color:"black",pattern:"minecraft:straight_cross"},{color:"black",pattern:"minecraft:bricks"},{color:"black",pattern:"minecraft:bricks"},{color:"white",pattern:"minecraft:skull"}]]
```

## Custom potions

[<img src="https://raw.githubusercontent.com/FJrodafo/University/aa24c97c45949504597fe5aa29ca9f769817ffb9/Languages/Minecraft/Assets/Warning.svg" alt="Warning!" width="40" height="40" align="center" />](https://raw.githubusercontent.com/FJrodafo/University/aa24c97c45949504597fe5aa29ca9f769817ffb9/Languages/Minecraft/Assets/Warning.svg "Warning!")
`Pending update to version 1.20.6+`

```sh
# Soda

# 1.15.0+
/give @p potion{display:{Name:'{"text":"Soda","color":"green"}',Lore:['{"text":"Bien fresquita!"}']},CustomPotionEffects:[{Id:9b,Amplifier:0b,Duration:1200}],CustomPotionColor:FF00FF} 1
```

```sh
# Granizado de fresa

# 1.15.0+
/give @p potion{display:{Name:'{"text":"Granizado de fresa"}',CustomPotionColor:D53032}} 1
```

```sh
# Licor de fuego

# 1.15.0+
/give @p potion{display:{Name:'{"text":"Licor de fuego","color":"red"}',Lore:['{"text":"De alta calidad procedente del reino de Arabasta"}']},CustomPotionEffects:[{Id:9b,Amplifier:0b,Duration:1200}],CustomPotionColor:F59622} 1
```

## Inivisible items

```sh
# 1.15.0+
/give @s minecraft:item_frame{EntityTag:{Invisible:1b}}
/give @s minecraft:glow_item_frame{EntityTag:{Invisible:1b}}
/give @s minecraft:armor_stand{EntityTag:{Invisible:1b}}
```

```sh
# 1.20.6+
/give @s minecraft:item_frame[minecraft:entity_data={id:"item_frame",Invisible:1b}]
/give @s minecraft:glow_item_frame[minecraft:entity_data={id:"glow_item_frame",Invisible:1b}]
/give @s minecraft:armor_stand[minecraft:entity_data={id:"armor_stand",Invisible:1b}]
```

## Rain on the players

[<img src="https://raw.githubusercontent.com/FJrodafo/University/aa24c97c45949504597fe5aa29ca9f769817ffb9/Languages/Minecraft/Assets/Warning.svg" alt="Warning!" width="40" height="40" align="center" />](https://raw.githubusercontent.com/FJrodafo/University/aa24c97c45949504597fe5aa29ca9f769817ffb9/Languages/Minecraft/Assets/Warning.svg "Warning!")
`Pending update to version 1.20.6+`

[<img src="https://raw.githubusercontent.com/FJrodafo/University/refs/heads/main/Languages/Minecraft/Assets/Repeat/Unconditional.gif" alt="(Repeat/Unconditional/Needs Redstone)" width="40" height="40" align="center" />](https://raw.githubusercontent.com/FJrodafo/University/refs/heads/main/Languages/Minecraft/Assets/Repeat/Unconditional.gif "(Repeat/Unconditional/Needs Redstone)")
`/execute at UserName run particle minecraft:dust 1 1 1 1 ~ ~3 ~ 0.5 0.25 0.5 0 100`

[<img src="https://raw.githubusercontent.com/FJrodafo/University/refs/heads/main/Languages/Minecraft/Assets/Chain/Unconditional.gif" alt="(Chain/Unconditional/Always Active)" width="40" height="40" align="center" />](https://raw.githubusercontent.com/FJrodafo/University/refs/heads/main/Languages/Minecraft/Assets/Chain/Unconditional.gif "(Chain/Unconditional/Always Active)")
`/execute at UserName run particle minecraft:falling_water ~ ~3 ~ 0.5 0.1 0.5 0 10`

## Drop the owner's skull upon death

[<img src="https://raw.githubusercontent.com/FJrodafo/University/aa24c97c45949504597fe5aa29ca9f769817ffb9/Languages/Minecraft/Assets/Warning.svg" alt="Warning!" width="40" height="40" align="center" />](https://raw.githubusercontent.com/FJrodafo/University/aa24c97c45949504597fe5aa29ca9f769817ffb9/Languages/Minecraft/Assets/Warning.svg "Warning!")
`Pending update to version 1.20.6+`

```
/scoreboard objectives add deaths deathCount
```

[<img src="https://raw.githubusercontent.com/FJrodafo/University/refs/heads/main/Languages/Minecraft/Assets/Repeat/Unconditional.gif" alt="(Repeat/Unconditional/Needs Redstone)" width="40" height="40" align="center" />](https://raw.githubusercontent.com/FJrodafo/University/refs/heads/main/Languages/Minecraft/Assets/Repeat/Unconditional.gif "(Repeat/Unconditional/Needs Redstone)")
`/execute as @a[scores={deaths=1..}] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:"@s"}},Owner:@s}`

[<img src="https://raw.githubusercontent.com/FJrodafo/University/refs/heads/main/Languages/Minecraft/Assets/Chain/Unconditional.gif" alt="(Chain/Unconditional/Always Active)" width="40" height="40" align="center" />](https://raw.githubusercontent.com/FJrodafo/University/refs/heads/main/Languages/Minecraft/Assets/Chain/Unconditional.gif "(Chain/Unconditional/Always Active)")
`/scoreboard players reset @a[scores={deaths=1..}] deaths`

```
---- Drill Pickaxe ----

Get the pickaxe with Drill enchantment:
/give @p golden_pickaxe{display:{Lore:['{"text":"Drill","color":"gray","italic":false}']},Enchantments:[{}]} 1

Scoreboard:
/scoreboard objectives add drill minecraft.used:minecraft.golden_pickaxe

(Repeat/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:golden_pickaxe",Count:1b,tag:{display:{Lore:['{"text":"Drill","color":"gray","italic":false}']}}}},scores={drill=1..}] at @s positioned ^ ^1 ^2 run tag @e[distance=..3,type=item,nbt={Age:0s,Item:{id:"minecraft:netherrack",Count:1b}},sort=nearest,limit=1] add Drill

(Chain/Unconditional/Always Active)
execute at @e[tag=Drill] run fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air destroy

(Chain/Unconditional/Always Active)
execute as @e[type=item,tag=Drill] run tag @s remove Drill

(Chain/Unconditional/Always Active)
scoreboard players reset @a[scores={drill=1..}] Drill

---- Thunderstorm Sword ----

Get the sword with Thunderstorm enchantment:
/give @p iron_sword{display:{Name:'{"text":"⚡","color":"white","italic":false}',Lore:['{"text":"Thunderstorm","color":"gray","italic":false}']},Unbreakable:1b,Enchantments:[{}]} 1

Scoreboard:
/scoreboard objectives add thunderstormsword minecraft.custom:minecraft.damage_dealt

(Repeat/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Thunderstorm","color":"gray","italic":false}']}}}},scores={thunderstormsword=1..}] run effect give @a minecraft:fire_resistance 2 0 true

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Thunderstorm","color":"gray","italic":false}']}}}},scores={thunderstormsword=1..}] at @s run summon minecraft:lightning_bolt ^ ^ ^4

(Chain/Unconditional/Always Active)
scoreboard players set @a thunderstormsword 0

---- Life Steal Sword ----

Get the sword with Life Steal enchantment:
/give @p iron_sword{display:{Name:'{"text":"🗡","color":"red","italic":false}',Lore:['{"text":"Life Steal","color":"gray","italic":false}']},Unbreakable:1b,Enchantments:[{}]} 1

Scoreboard:
/scoreboard objectives add lifestealsword minecraft.custom:minecraft.damage_dealt

(Repeat/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Life Steal","color":"gray","italic":false}']}}}},scores={lifestealsword=1..}] run effect give @s minecraft:regeneration 1 2 false

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Life Steal","color":"gray","italic":false}']}}}},scores={lifestealsword=1..}] at @s run execute as @e[distance=..10,limit=1,nbt=!{HurtTime:0s}] at @s run particle minecraft:sweep_attack ~ ~1 ~ 1 1 1 .1 4 force

(Chain/Unconditional/Always Active)
scoreboard players set @a lifestealsword 0

---- Wither Sword ----

Get the sword with Wither enchantment:
/give @p iron_sword{display:{Name:'{"text":"☠","color":"gray","italic":false}',Lore:['{"text":"Wither","color":"gray","italic":false}']},Unbreakable:1b,Enchantments:[{}]} 1

Scoreboard:
/scoreboard objectives add withersword minecraft.custom:minecraft.damage_dealt

(Repeat/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Wither","color":"gray","italic":false}']}}}},scores={withersword=1..}] at @s run effect give @e[distance=..4,limit=1,sort=nearest,nbt=!{HurtTime:0s}] minecraft:wither 6 0 false

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Wither","color":"gray","italic":false}']}}}},scores={withersword=1..}] at @s run effect give @e[distance=..4,limit=1,sort=nearest,nbt=!{HurtTime:0s}] minecraft:hunger 6 0 false

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Wither","color":"gray","italic":false}']}}}},scores={withersword=1..}] at @s run execute as @e[distance=..10,limit=1,nbt=!{HurtTime:0s}] at @s run particle minecraft:smoke ~ ~1 ~ 1 1 1 .1 101 force

(Chain/Unconditional/Always Active)
scoreboard players set @a withersword 0

---- Poison Sword ----

Get the sword with Poison enchantment:
/give @p iron_sword{display:{Name:'{"text":"⚗","color":"dark_green","italic":false}',Lore:['{"text":"Poison","color":"gray","italic":false}']},Unbreakable:1b,Enchantments:[{}]} 1

Scoreboard:
/scoreboard objectives add poisonsword minecraft.custom:minecraft.damage_dealt

(Repeat/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Poison","color":"gray","italic":false}']}}}},scores={poisonsword=1..}] at @s run effect give @e[distance=..4,limit=1,sort=nearest,nbt=!{HurtTime:0s}] minecraft:poison 6 0 false

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Poison","color":"gray","italic":false}']}}}},scores={poisonsword=1..}] at @s run effect give @e[distance=..4,limit=1,sort=nearest,nbt=!{HurtTime:0s}] minecraft:nausea 6 0 false

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Poison","color":"gray","italic":false}']}}}},scores={poisonsword=1..}] at @s run execute as @e[distance=..10,limit=1,nbt=!{HurtTime:0s}] at @s run particle minecraft:sneeze ~ ~1 ~ 1 1 1 .1 101 force

(Chain/Unconditional/Always Active)
scoreboard players set @a poisonsword 0

---- End Sword ----

Get the sword with Teleport enchantment:
/give @p iron_sword{display:{Name:'{"text":"ψ","color":"dark_purple","italic":false}',Lore:['{"text":"Teleport","color":"gray","italic":false}']},Unbreakable:1b,Enchantments:[{}]} 1

Scoreboard:
/scoreboard objectives add endsword minecraft.custom:minecraft.damage_dealt

(Repeat/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Teleport","color":"gray","italic":false}']}}}},scores={endsword=1..}] at @s run spreadplayers ~ ~ 5 10 false @p

(Chain/Conditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword",Count:1b,tag:{display:{Lore:['{"text":"Teleport","color":"gray","italic":false}']}}}},scores={endsword=1..}] at @s run particle minecraft:portal ~ ~ ~ 0.1 1 0.1 1 100 force

(Chain/Unconditional/Always Active)
scoreboard players set @a endsword 0

---- Encapsulate Creepers by throwing eggs at it ----

(Repeat/Unconditional/Always Active)
execute at @e[type=minecraft:egg] run tag @e[distance=..3,type=minecraft:creeper,limit=1] add Egg

(Chain/Unconditional/Always Active)
execute at @e[type=minecraft:creeper,tag=Egg] run kill @e[type=egg,distance=..3]

(Chain/Unconditional/Always Active)
execute at @e[type=minecraft:creeper,tag=Egg] run particle minecraft:end_rod ~ ~ ~ 0 0 0 .1 50 normal

(Chain/Unconditional/Always Active)
execute at @e[type=minecraft:creeper,tag=Egg] run playsound minecraft:entity.chicken.egg hostile @a ~ ~ ~ 1

(Chain/Unconditional/Always Active)
execute at @e[type=minecraft:creeper,tag=Egg] run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:creeper_spawn_egg",Count:1b}}

(Chain/Unconditional/Always Active)
execute at @e[type=minecraft:creeper,tag=Egg] run tp @e[tag=Egg,distance=..1] ~ 0 ~

(Chain/Unconditional/Always Active)
execute as @e[type=minecraft:creeper,tag=Egg] run kill @s

---- Relics ----

(Repeat/Unconditional/Always Active)

[[[[❤]]]]

/give @p minecraft:heart_of_the_sea{display:{Name:'{"text":"❤","color":"blue","italic":false}',Lore:['{"text":"Attribute of the depths","color":"blue","italic":false}']},Enchantments:[{}],AttributeModifiers:[{AttributeName:"generic.max_health",Amount:20,Operation:0,Slot:"offhand",UUID:[I;1,1,1,1]}]} 1

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:heart_of_the_sea",tag:{display:{Lore:['{"text":"Attribute of the depths","color":"blue","italic":false}']}}}]}] minecraft:dolphins_grace 2 0 true

[[[[☘]]]]

/give @p minecraft:stick{display:{Name:'{"text":"☘","color":"green","italic":false}',Lore:['{"text":"Lucky stick","color":"green","italic":false}']},Enchantments:[{}]} 1

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:stick",tag:{display:{Lore:['{"text":"Lucky stick","color":"green","italic":false}']}}}]}] minecraft:luck 2 0 true

[[[[🔥]]]]

/give @p minecraft:blaze_rod{display:{Name:'{"text":"🔥","color":"black"}'},Enchantments:[{id:fire_aspect,lvl:10}]} 1

[[[[☄]]]]

/give @p minecraft:blaze_rod{display:{Name:'{"text":"☄","color":"black"}'},Enchantments:[{id:knockback,lvl:10}]} 1

[[[[DISTORTED FRAGMENT]]]]

/give @p amethyst_shard{display:{Name:'{"text":"Distorted fragment","color":"light_purple","italic":false}',Lore:['{"text":"Total control","color":"light_purple","italic":false}']},Enchantments:[{}]} 1

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:amethyst_shard",tag:{display:{Lore:['{"text":"Total control","color":"light_purple","italic":false}']}}}]}] minecraft:levitation 2 0 true

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:amethyst_shard",tag:{display:{Lore:['{"text":"Total control","color":"light_purple","italic":false}']}}}]}] minecraft:slow_falling 8 0 true

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:amethyst_shard",tag:{display:{Lore:['{"text":"Total control","color":"light_purple","italic":false}']}}}]}] minecraft:glowing 2 0 true

[[[[MEMBRANE]]]]

/give @p phantom_membrane{display:{Name:'{"text":"Membrane","color":"dark_gray","italic":false}',Lore:['{"text":"Dark matter","color":"dark_gray","italic":false}']},Enchantments:[{}]} 1

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:phantom_membrane",tag:{display:{Lore:['{"text":"Dark matter","color":"dark_gray","italic":false}']}}}]}] minecraft:invisibility 220 0 true

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:phantom_membrane",tag:{display:{Lore:['{"text":"Dark matter","color":"dark_gray","italic":false}']}}}]}] minecraft:hunger 200 0 true

[[[[THE EYE]]]]

/give @p fermented_spider_eye{display:{Name:'{"text":"The eye","color":"dark_red","italic":false}',Lore:['{"text":"Spider vision","color":"dark_red","italic":false}']},Enchantments:[{}]} 1

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:fermented_spider_eye",tag:{display:{Lore:['{"text":"Spider vision","color":"dark_red","italic":false}']}}}]}] minecraft:night_vision 12 0 true

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:fermented_spider_eye",tag:{display:{Lore:['{"text":"Spider vision","color":"dark_red","italic":false}']}}}]}] minecraft:slowness 12 0 true

[[[[風]]]]

/give @p feather{display:{Name:'{"text":"風","color":"white","italic":false}',Lore:['{"text":"Ephemeral step","color":"white","italic":false}']},Enchantments:[{}]} 1

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:feather",tag:{display:{Lore:['{"text":"Ephemeral step","color":"white","italic":false}']}}}]}] minecraft:speed 2 0 true

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:feather",tag:{display:{Lore:['{"text":"Ephemeral step","color":"white","italic":false}']}}}]}] minecraft:jump_boost 2 0 true

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:feather",tag:{display:{Lore:['{"text":"Ephemeral step","color":"white","italic":false}']}}}]}] minecraft:weakness 2 0 true

execute at @a[nbt={Inventory:[{id:"minecraft:feather",Count:1b,Slot:-106b,tag:{display:{Name:'{"text":"風","color":"white","italic":false}',Lore:['{"text":"Ephemeral step","color":"white","italic":false}']},Enchantments:[{}]}}]}] run particle minecraft:electric_spark ~ ~ ~ 1 1 1 0 1 force

[[[[DEMON SOUL]]]]
/give @p blaze_powder{display:{Name:'{"text":"Demon soul","color":"gold","italic":false}',Lore:['{"text":"Blaze essence","color":"gold","italic":false}']},Enchantments:[{}]} 1

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:blaze_powder",tag:{display:{Lore:['{"text":"Blaze essence","color":"gold","italic":false}']}}}]}] minecraft:absorption 2 0 true

effect give @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:blaze_powder",tag:{display:{Lore:['{"text":"Blaze essence","color":"gold","italic":false}']}}}]}] minecraft:blindness 2 0 true

[[[[SPECTRAL BAT]]]]
/give @p spectral_arrow{display:{Name:'{"text":"Spectral","color":"dark_purple"}',Lore:['{"text":"Bat"}']},Enchantments:[{}]} 1

Summon bat:
(Impulso/Incondicional/Necesita redstone)
/summon bat ~ ~ ~ {Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,Tags:["bat"]}

Scoreboards:
/scoreboard objectives add murcielago dummy
/scoreboard objectives add hambre food

Primera Columna:
(Iterativo/Incondicional/Siempre activo)
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:spectral_arrow",tag:{Enchantments:[{}]}}]},scores={hambre=7..},tag=!murcielago] at @s run particle minecraft:smoke ^ ^1 ^2 .7 .7 .7 0 500
(Cadena/Incondicional/Siempre activo)
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:spectral_arrow",tag:{Enchantments:[{}]}}]},scores={hambre=7..},tag=!murcielago] at @s run playsound entity.zombie_villager.converted player @a ~ ~ ~ 1 2
(Cadena/Incondicional/Siempre activo)
execute as @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:spectral_arrow",tag:{Enchantments:[{}]}}]},scores={hambre=7..}] run tag @s add murcielago
(Cadena/Incondicional/Siempre activo)
execute at @a[tag=murcielago] run tp @e[tag=bat] ^ ^.9 ^2 ~ ~
(Cadena/Incondicional/Siempre activo)
execute at @a[tag=murcielago] unless entity @e[distance=..3,tag=bat] run summon bat ~ ~ ~ {Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,Tags:["bat"]}

Segunda Columna:
(Iterativo/Incondicional/Siempre activo)
scoreboard players add @a[tag=murcielago] murcielago 1
(Cadena/Condicional/Siempre activo)
effect give @a[scores={murcielago=24}] minecraft:levitation 1 0 true
(Cadena/Condicional/Siempre activo)
scoreboard players reset @a[scores={murcielago=24}] murcielago

Tercera Columna:
(Iterativo/Incondicional/Siempre activo)
effect give @a[tag=murcielago] minecraft:slow_falling 3 2 true
(Cadena/Condicional/Siempre activo)
effect give @a[tag=murcielago] minecraft:hunger 3 10 true
(Cadena/Condicional/Siempre activo)
effect give @a[tag=murcielago] minecraft:invisibility 1 0 true
(Cadena/Condicional/Siempre activo)
effect give @a[tag=murcielago] minecraft:slowness 1 10 true
(Cadena/Condicional/Siempre activo)
effect give @a[tag=murcielago] minecraft:weakness 1 2 true

Cuarta Columna:
(Iterativo/Incondicional/Siempre activo)
execute unless entity @a[tag=murcielago] run tp @e[tag=bat] ~ ~6.5 ~
(Cadena/Incondicional/Siempre activo)
execute as @a[tag=murcielago] unless entity @a[nbt={Inventory:[{Slot:-106b,id:"minecraft:spectral_arrow",tag:{Enchantments:[{}]}}]}] run tag @s remove murcielago
(Cadena/Condicional/Siempre activo)
execute at @p run particle minecraft:smoke ^ ^1 ^2 .7 .7 .7 0 500
(Cadena/Condicional/Siempre activo)
execute at @p run playsound entity.zombie_villager.converted player @a ~ ~ ~ 1 2
(Cadena/Condicional/Siempre activo)
effect clear @a[tag=!murcielago] minecraft:slowness
(Cadena/Condicional/Siempre activo)
effect clear @a[tag=!murcielago] minecraft:levitation
(Cadena/Incondicional/Siempre activo)
kill @e[tag=bat,distance=..3]

---- NPCs ----

Scoreboard:
/scoreboard objectives add hablar minecraft.custom:minecraft.talked_to_villager

Bloques Generales (Colocar una sola vez):
(Iterativo/Incondicional/Siempre activo)
execute as @a[tag=hi] at @s unless entity @e[distance=..4,tag=npc] run tag @s remove hi
(Iterativo/Incondicional/Siempre activo)
execute as @a[scores={hablar=1..}] at @s unless entity @e[distance=..4,tag=npc] run scoreboard players reset @s hablar

Invocar NPC:
/summon villager ~ ~ ~ {CustomNameVisible:1b,Tags:["npc"],Invulnerable:1,PersistenceRequired:1,NoAI:1,Rotation:[0f,0f],CustomName:'{"text":"Stuff","color":"white"}',Attributes:[{Name:generic.movement_speed,Base:0}]}
/summon villager ~ ~ ~ {VillagerData:{profession:nitwit,type:desert},CustomNameVisible:1b,Tags:["npc"],Invulnerable:1,PersistenceRequired:1,NoAI:1,Rotation:[0f,0f],CustomName:'{"text":"Stuff","color":"white"}'}
/summon minecraft:llama ~ ~ ~ {Invulnerable:1,PersistenceRequired:1,NoAI:1,Rotation:[0f,0f]}

Primera Columna (Tiene que estar cerca del NPC):
(Iterativo/Incondicional/Siempre activo)
execute as @e[tag=npc,distance=..5] at @s run tellraw @p[distance=..4,tag=!hi] [{"text":"[Stuff]","color":"white"},{"text":" ¡Hola!","color":"white"}]
(Cadena/Condicional/Siempre activo)
execute as @e[tag=npc,distance=..5] at @s run tag @a[distance=..4] add hi

Segunda Columna (Tiene que estar cerca del NPC):
(Iterativo/Incondicional/Siempre activo)
execute as @e[tag=npc,distance=..5] at @s if entity @a[distance=..3,scores={hablar=1}] run tellraw @a[distance=..3,scores={hablar=1}] [{"text":"[Stuff]","color":"white"},{"text":" Aquí tienes.","color":"white"}]
(Cadena/Condicional/Siempre activo)
execute as @e[tag=npc,distance=..5] at @s if entity @a[distance=..3,scores={hablar=1}] run give @a[distance=..4,scores={hablar=1}] minecraft:apple 1
(Cadena/Condicional/Siempre activo)
execute as @e[tag=npc,distance=..5] at @s if entity @a[distance=..3,scores={hablar=1}] run scoreboard players add @a[distance=..4,scores={hablar=1}] hablar 1

---- Jail ----

send someone to jail:
/tag UserName add jail

Scoreboard:
/scoreboard objectives add jailtime dummy

Single column (Place in the center of the jail):
(Repeat/Unconditional/Always Active)
tp @a[distance=20..,tag=jail] ~ ~ ~
(Chain/Unconditional/Always Active)
gamemode adventure @a[tag=jail]
(Chain/Unconditional/Always Active)
scoreboard players add @a[tag=jail] jailtime 1
(Chain/Unconditional/Always Active)
tag @a[scores={jailtime=4000..}] remove jail
(Chain/Unconditional/Always Active)
tp @a[scores={jailtime=4000..}] ~ ~ ~
(Chain/Unconditional/Always Active)
gamemode survival @a[scores={jailtime=4000..},gamemode=adventure]
(Chain/Unconditional/Always Active)
scoreboard players set @a[scores={jailtime=4000..}] jailtime 0

---- Teleport Spawn ----

Scoreboard:
/scoreboard objectives add spawn trigger

Columna única:
(Iterativo/Incondicional/Siempre activo)
scoreboard players enable @a spawn
(Cadena/Incondicional/Siempre activo)
execute as @a[scores={spawn=1..}] run tp @s ~ ~ ~ ~ 0
(Cadena/Condicional/Siempre activo)
scoreboard players reset @a[scores={spawn=1..}]

---- Welcome Message ----

Scoreboard:
/scoreboard objectives add leave minecraft.custom:minecraft.leave_game

(Repeat/Unconditional/Always Active)
execute as @a[tag=!join] run title @s subtitle [{"selector":"@s","color":"white"},{"text":" connected.","color":"light_purple"}]
(Chain/Unconditional/Always Active)
title @a[tag=!join] title {"text":"Frenzy Cartel","color":"black"}
(Chain/Unconditional/Always Active)
execute at @a[tag=!join] run playsound minecraft:entity.player.levelup ambient @a[tag=!join] ~ ~ ~ 4 1 1
(Chain/Unconditional/Always Active)
tag @a[tag=!join] add join

(Repeat/Unconditional/Always Active)
execute as @a[scores={leave=1}] run title @s subtitle [{"selector":"@s","color":"white"},{"text":" connected.","color":"light_purple"}]
(Chain/Unconditional/Always Active)
title @a[scores={leave=1}] title {"text":"Frenzy Cartel","color":"black"}
(Chain/Unconditional/Always Active)
execute at @a[scores={leave=1}] run playsound minecraft:entity.player.levelup ambient @a[scores={leave=1}] ~ ~ ~ 4 1 1
(Chain/Unconditional/Always Active)
scoreboard players set @a leave 0

---- BANK/SHOP ----

Scoreboard:
/scoreboard objectives add CREDIT dummy
/scoreboard objectives setdisplay sidebar CREDIT

BANK:
(Repeat/Unconditional/Needs Redstone)
clear @p minecraft:netherite_scrap 1
(Chain/Conditional/Always Active)
scoreboard players add @p CREDIT 1

SHOP:
(Impulso/Unconditional/Needs Redstone)
/scoreboard players remove @p CREDIT 1
(Chain/Conditional/Always Active)
/give @p minecraft:elytra 1

---- WorldEdit Rings ----

https://youtu.be/MzeNE4gVf70

---- Scythe ----

ash

/give @p netherite_hoe{display:{Name:'{"text":"Scythe ☽","color":"dark_red","italic":false}',Lore:['{"text":"Summon","color":"gray","italic":false}']},Unbreakable:1b,Enchantments:[{}]} 1

Scoreboard:
/scoreboard objectives add scythe minecraft.custom:minecraft.damage_dealt

(Repeat/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_hoe",Count:1b,tag:{display:{Lore:['{"text":"Summon","color":"gray","italic":false}']}}}},scores={scythe=1..}] at @s run summon minecraft:evoker_fangs ^ ^ ^4

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_hoe",Count:1b,tag:{display:{Lore:['{"text":"Summon","color":"gray","italic":false}']}}}},scores={scythe=1..}] at @s run summon minecraft:evoker_fangs ^ ^ ^5

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_hoe",Count:1b,tag:{display:{Lore:['{"text":"Summon","color":"gray","italic":false}']}}}},scores={scythe=1..}] at @s run summon minecraft:evoker_fangs ^ ^ ^6

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_hoe",Count:1b,tag:{display:{Lore:['{"text":"Summon","color":"gray","italic":false}']}}}},scores={scythe=1..}] at @s run summon minecraft:evoker_fangs ^ ^ ^7

(Chain/Unconditional/Always Active)
execute as @a[nbt={SelectedItem:{id:"minecraft:netherite_hoe",Count:1b,tag:{display:{Lore:['{"text":"Summon","color":"gray","italic":false}']}}}},scores={scythe=1..}] at @s run execute as @e[distance=..10,limit=1,nbt=!{HurtTime:0s}] at @s run particle minecraft:sweep_attack ~ ~1 ~ 1 1 1 .1 4 force

(Chain/Unconditional/Always Active)
scoreboard players set @a scythe 0

---- Bolt of light ----

/give @p tipped_arrow{display:{Name:'{"text":"Bolt of Light","color":"yellow","italic":false}',Lore:['{"text":"Place torches","color":"gray","italic":false}']},CustomPotionColor:16777045} 64

(Repeat/Unconditional/Always Active)
execute at @e[nbt={Color:16777045,inGround:1b}] run execute unless block ~ ~-1 ~ air run setblock ~ ~ ~ torch
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777045,inGround:1b}] run execute unless block ~-1 ~ ~ air run setblock ~ ~ ~ minecraft:wall_torch[facing=east]
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777045,inGround:1b}] run execute unless block ~1 ~ ~ air run setblock ~ ~ ~ minecraft:wall_torch[facing=west]
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777045,inGround:1b}] run execute unless block ~ ~ ~-1 air run setblock ~ ~ ~ minecraft:wall_torch[facing=south]
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777045,inGround:1b}] run execute unless block ~ ~ ~1 air run setblock ~ ~ ~ minecraft:wall_torch[facing=north]
(Chain/Unconditional/Always Active)
kill @e[nbt={Color:16777045,inGround:1b}]

---- Bolt of cobwebs ----

/give @p tipped_arrow{display:{Name:'{"text":"Bolt of cobweb","color":"white","italic":false}',Lore:['{"text":"Place cobwebs","color":"gray","italic":false}']},CustomPotionColor:16777215} 64

(Repeat/Unconditional/Always Active)
execute at @e[nbt={Color:16777215,inGround:1b}] run execute unless block ~ ~-1 ~ air run setblock ~ ~ ~ cobweb
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777215,inGround:1b}] run execute unless block ~ ~1 ~ air run setblock ~ ~ ~ cobweb
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777215,inGround:1b}] run execute unless block ~-1 ~ ~ air run setblock ~ ~ ~ cobweb
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777215,inGround:1b}] run execute unless block ~1 ~ ~ air run setblock ~ ~ ~ cobweb
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777215,inGround:1b}] run execute unless block ~ ~ ~-1 air run setblock ~ ~ ~ cobweb
(Chain/Unconditional/Always Active)
execute at @e[nbt={Color:16777215,inGround:1b}] run execute unless block ~ ~ ~1 air run setblock ~ ~ ~ cobweb
(Chain/Unconditional/Always Active)
kill @e[nbt={Color:16777215,inGround:1b}]

---- Bolt of the void ----

/give @p tipped_arrow{display:{Name:'{"text":"Bolt of the Void","color":"dark_purple","italic":false}'},CustomPotionColor:11141290} 64

(Repeat/Unconditional/Always Active)
/execute at @e[nbt={Color:11141290,inGround:1b}] run teleport @e[type=item,distance=..50] ~ ~ ~
(Chain/Conditional/Always Active)
/execute at @e[nbt={Color:11141290,inGround:1b}] run particle minecraft:portal ~ ~ ~ 0.1 1 0.1 1 100 force
(Impulse/Unconditional/Needs Redstone)
/kill @e[nbt={Color:11141290,inGround:1b}]

---- Piercing Arrow ----

(Repeat/Unconditional/Always Active)
execute as @e[type=minecraft:arrow] run data merge entity @s {PierceLevel:1b}

---- Summoning Rod ----

:chain: /execute as @e[tag=smoldering-rod-primed] at @s run execute unless entity @e[type=minecraft:fishing_bobber,distance=..2] run tag @s remove smoldering-rod-primed

:chain: /execute at @e[tag=smoldering-rod-primed] run execute unless entity @e[type=minecraft:fishing_bobber,distance=..2] run summon minecraft:tnt ~ ~ ~

:chain: /execute at @a[nbt={SelectedItem:{id:"minecraft:fishing_rod",Count:1b,tag:{display:{Name:'{"text":"Smoldering Rod","color":"red"}'},Enchantments:[{}]}}}] run execute at @e[type=minecraft:fishing_bobber,distance=..50] run execute as @e[type=!minecraft:player,type=!minecraft:fishing_bobber,distance=..2] run tag @s add smoldering-rod-primed

:chain: /execute at @a[nbt={SelectedItem:{id:"minecraft:fishing_rod",Count:1b,tag:{display:{Name:'{"text":"Smoldering Rod","color":"red"}'},Enchantments:[{}]}}}] run execute at @e[type=minecraft:fishing_bobber,distance=..50] run execute as @e[type=!minecraft:player,type=!minecraft:fishing_bobber,distance=..2] run data merge entity @s {Fire:2s}

:rep::reds: /execute if entity @p[nbt={SelectedItem:{id:"minecraft:fishing_rod",Count:1b,tag:{display:{Name:'{"text":"Smoldering Rod","color":"red"}'},Enchantments:[{}]}}}]

:imp~1: /give @p fishing_rod{display:{Name:'{"text":"Smoldering Rod","color":"red"}'},Enchantments:[{}]} 1

---- Weather Wand ----

/give @p stick{display:{Name:'{"text":"Wand of Weather","color":"dark_aqua","italic":false}'},Enchantments:[{}]} 1

(Repeat/Unconditional/Always Active)
/execute if entity @p[nbt={SelectedItem:{id:"minecraft:stick",Count:1b,tag:{display:{Name:'{"text":"Wand of Weather","color":"dark_aqua","italic":false}'},Enchantments:[{}]}}}]
(Impulse/Unconditional/Needs Redstone)
/execute at @a[nbt={SelectedItem:{id:"minecraft:stick",Count:1b,tag:{display:{Name:'{"text":"Wand of Weather","color":"dark_aqua","italic":false}'},Enchantments:[{}]}}}] run weather clear

(Repeat/Unconditional/Always Active)
/execute if entity @p[nbt={Inventory:[{id:"minecraft:stick",Count:1b,Slot:-106b,tag:{display:{Name:'{"text":"Wand of Weather","color":"dark_aqua","italic":false}'},Enchantments:[{}]}}]}]
(Chain/Conditional/Always Active)
/execute at @a[nbt={Inventory:[{id:"minecraft:stick",Count:1b,Slot:-106b,tag:{display:{Name:'{"text":"Wand of Weather","color":"dark_aqua","italic":false}'},Enchantments:[{}]}}]}] run particle minecraft:enchanted_hit ~ ~ ~ 1 1 1 0 1 force
(Impulse/Unconditional/Needs Redstone)
/execute if entity @p[nbt={Inventory:[{id:"minecraft:stick",Count:1b,Slot:-106b,tag:{display:{Name:'{"text":"Wand of Weather","color":"dark_aqua","italic":false}'},Enchantments:[{}]}}]}] run weather rain

---- Destroy blocks in aventure mode ----

give @p wood_pickaxe{"minecraft:can_destroy":{"blocks":["stone"]}}

---- Custom Books ----

https://minecraft.tools/en/book.php

---- Items at the head's player ----

/item replace entity UserName armor.head with tinted_glass 1
/item replace entity UserName armor.head with end_rod 1

---- This Circle is in Vanilla Minecraft ----

https://youtu.be/3u65Dk1bqWg

(Impulse)
/execute as @e[type=minecraft:armor_stand,tag=circle,distance=..10] at @s run tp @s ~ ~ ~ facing entity @p

(Chain)
/execute as @e[type=minecraft:armor_stand,tag=center,distance=..2,limit=1] at @s run tp @s ~ ~ ~ ~5 ~

(Chain)
/execute as @e[type=minecraft:armor_stand,tag=center,distance=..3,limit=1] at @s positioned ~ ~-7 ~ run summon minecraft:armor_stand ^ ^ ^3 {ArmorItems:[{},{},{},{id:sand,Count:1}],Tags:["circle"],Invisible:1,Invincible:1,NoGravity:1,Marker:1b}

(Chain)
/execute as @e[type=minecraft:armor_stand,tag=center,distance=..4,limit=1] at @s positioned ~ ~-6.5 ~ run summon minecraft:armor_stand ^ ^ ^3.5 {ArmorItems:[{},{},{},{id:sand,Count:1}],Tags:["circle"],Invisible:1,Invincible:1,NoGravity:1,Marker:1b}

(Repeating)
/execute as @e[type=minecraft:armor_stand,tag=center,distance=..5,limit=1] at @s positioned ~ ~-6.5 ~ run summon minecraft:armor_stand ^ ^ ^3 {ArmorItems:[{},{},{},{id:sand,Count:1}],Tags:["circle"],Invisible:1,Invincible:1,NoGravity:1,Marker:1b}

(Impulse)
/summon minecraft:armor_stand ~ ~6 ~ {Tags:["center"]}

---- What's next? ----
```

## Additional information

This cheat sheet is available on GitHub Gist at https://gist.github.com/FJrodafo/51697cabe1886ab88568db422a89ca1b

Explore more gists by Francisco José Rodríguez Afonso at https://gist.github.com/FJrodafo

<link rel="stylesheet" href="./../../README.css">
<a class="scrollup" href="#top">&#x1F53C</a>
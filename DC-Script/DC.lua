-- Combined Dragon City Ultimate Mod with Test Skill Integration & Revert Paste Feature
gg.setVisible(false)

local path = "/storage/emulated/0/Download/2.0.txt"
local oldPath = "/storage/emulated/0/Download/1.9.txt"
local file = io.open(path, "r")

if file then
    file:close()
else
    gg.alert("🚀 A new update (Version 2.0) is available! Please install it now!\n✨ What's New:\n-Fixed Arena And Quest Feature Completely!\nQuest only works with permanently quest currently\nNote: Please install Dragon City to the latest version before using!", "Update")

    gg.toast("Installing update...")
    gg.searchNumber(":updateversion", gg.TYPE_AUTO)
    gg.sleep(2000)

    -- Remove old version file
    os.remove(oldPath)

    local newFile = io.open(path, "w")
    if newFile then
        newFile:write("Version 20")
        newFile:close()
        gg.alert("Update installed successfully!")
    else
        gg.alert("An error occurred during the update process.")
    end
end

gg.clearResults()
gg.setVisible(false)
-------------------------------------------------------------------------
-------------------------------------------------------------------------
local MD5 = gg.makeRequest('').content
gg.alert(os.date([[༺ script update: Sep/08/2025 ༻
╭───༺֍⚞⊷⊶᳀⊷⊶⚞֍༻───╮
 ➣sᴄʀɪᴘᴛ ʙʏ Jkram143♦️ 
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣Dragon city scripts tools🎮
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣sᴄʀɪᴘᴛ : ɴᴏ ʀᴏᴏᴛ&ʀᴏᴏᴛ 📳
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣sᴄʀɪᴘᴛ ɴᴏ ᴇʀᴏʀʀ&ɴᴏ ʙᴀɴɴᴇᴛ🛠️
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣ɢɢ ᴍᴏᴅ ᴠ v1.1 ɴᴏ ᴇʀᴏʀʀ ⚙️
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣sᴄʀɪᴘᴛ Unlock ᴠɪᴘ 💰💲 
╰───༺֍⚞⊷⊶᳀⊷⊶⚞֍༻───╯]]))

L={'◼', '◻', '◻', '◻', '◻', '◻'} -- LOADING TABLE
LD = 0
for i=0, 6, 1 do
	if gg.isVisible(true) and i ~= 6 then
		gg.setVisible(false)
	end
	gg.sleep(1000)
	gg.toast('Loading: '..L[1]..L[2]..L[3]..L[4]..L[5]..L[6]..' '..LD..'/100%')
	LD = LD + 20
	table.remove(L)
	table.insert(L, 2, "◼")
	if i == 6 then
		gg.sleep(2000)
	end
end
--  ╔════════ ≪ •❈• ≫ ════════╗\n  ======Exit script====== \n╚════════ ≪ •❈• ≫ ════════╝
function Main()
    menu = gg.choice({
        ' ╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Battle Arena Feature ⚔️ \n╚════════ ≪ •❈• ≫ ════════╝', --1
    --    ' Battle Arena Feature', --1
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Unlock Frozen Values 🔓 \n╚════════ ≪ •❈• ≫ ════════╝', --2
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Immortal level dragon 🔎 \n╚════════ ≪ •❈• ≫ ════════╝', --3
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Force Recall Dragon 🐲 \n╚════════ ≪ •❈• ≫ ════════╝', --4
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Dragon Rescue Feature 🔑 \n╚════════ ≪ •❈• ≫ ════════╝', --5
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Train Dragon/Skill Feature 🔑 \n╚════════ ≪ •❈• ≫ ════════╝', --6
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Event Race 🏁 \n╚════════ ≪ •❈• ≫ ════════╝', --7
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Unlock islands 🔓 \n╚════════ ≪ •❈• ≫ ════════╝', --8
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  move Habitat 🏝️ \n╚════════ ≪ •❈• ≫ ════════╝', --9
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Speedhack Feature ⚡ \n╚════════ ≪ •❈• ≫ ════════╝', --10
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Quest Feature ( Rankup ) 🗡️ \n╚════════ ≪ •❈• ≫ ════════╝',
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️  Facebook Account 💬 \n╚════════ ≪ •❈• ≫ ════════╝',
        '╔════════ ≪ •❈• ≫ ════════╗\n  ➡️      ======Exit script====== \n╚════════ ≪ •❈• ≫ ════════╝'
    }, nil, '┏━━━━━━━━━༻❁༺━━━━━━━━━━┓\n  ➡️ Dragon city scripts gg\n  ➡️ ғᴀᴄᴇʙᴏᴏᴋ Account: Ahco c Jkram143\n  ➡️ link: www.facebook.com/jkram143 \n  ➡️ For VIP contact Admin \n┗━━━━━━━━━༻❁༺━━━━━━━━━━┛ ')
    if menu == 1 then DragonCityHack1() end
    if menu == 2 then DragonCityHack2() end
    if menu == 3 then DragonCityHack3() end
    if menu == 4 then DragonCityHack4() end
    if menu == 5 then DragonCityHack5() end
    if menu == 6 then DragonCityHack6() end
    if menu == 7 then DragonCityHack7() end
    if menu == 8 then DragonCityHack8() end
    if menu == 9 then DragonCityHack9() end
    if menu == 10 then DragonCityHack10() end
    if menu == 11 then DragonCityHack11() end
    if menu == 12 then DragonCityHack12() end
    if menu == 13 then DragonCityHack13() end
    if menu == nil then NoSelect() end
end

function DragonCityHack1()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Arena.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack2()
    gg.setVisible(false)
    local frozenItems = gg.getListItems()
    if #frozenItems > 0 then
        gg.removeListItems(frozenItems)
        gg.toast('All values have been unfrozen!')
    else
        gg.toast('No frozen values found!')
    end
end

function DragonCityHack3()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Levelup.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack4()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Recall.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack5()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Rescue.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack6()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/TrainSkill.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack7()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/HeroicChoose.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack8()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Speed.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack9()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Unlock.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack10()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Habitat.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack11()
    L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Quest.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack12()
L = gg.makeRequest('https://github.com/jkram143/jkram143..github.io/blob/main/DC-Script/Help.lua').content
    if not L then gg.alert('SERVER: Allow Internet Connection...') else
        pcall(load(L)) end
end

function DragonCityHack13()
print(os.date([[༺ Sep/08/2025 ༻
╭───༺֍⚞⊷⊶᳀⊷⊶⚞֍༻───╮
 ➣sᴄʀɪᴘᴛ ʙʏ Jkram143♦️ 
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣Dragon city scripts tools🎮
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣sᴄʀɪᴘᴛ : ɴᴏ ʀᴏᴏᴛ&ʀᴏᴏᴛ 📳
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣sᴄʀɪᴘᴛ ɴᴏ ᴇʀᴏʀʀ&ɴᴏ ʙᴀɴɴᴇᴛ🛠️
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣ɢɢ ᴍᴏᴅ ᴠ v1.1 ɴᴏ ᴇʀᴏʀʀ ⚙️
 ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
 ➣sᴄʀɪᴘᴛ Unlock ᴠɪᴘ 💰💲 
╰───༺֍⚞⊷⊶᳀⊷⊶⚞֍༻───╯]]))
os.exit()
  main()
end


function NoSelect()
    gg.sleep(100)
    gg.toast('Script Made By Jkram143 💗')
end

-------------------------------------------------------------------------
--------------------------------------------
        gg.setVisible(true)
        while true do
        if gg.isVisible() then
        gg.setVisible(false)
        Main() end end
-------------------------------------------------------------------------

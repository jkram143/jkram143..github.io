gg.setVisible(true)
fin_busc = 1
gg.setRanges(gg.REGION_C_ALLOC)
gg.refineNumber("9288798", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

-- Helper Function for Safe Prompt
local function waitForResume()
  gg.toast("Script paused. Click GG icon to resume", true)
  while not gg.isVisible() do
    gg.sleep(100)
  end
  gg.setVisible(false)
end

local function safePromptSearch(prompts, defaults, types)
  local input = gg.prompt(prompts, defaults, types)
  while not input do
    gg.toast("Script paused. Tap GG icon to resume.", true)
    waitForResume()
    while gg.isVisible() do
      gg.sleep(100)
    end
    gg.sleep(1000)
    input = gg.prompt(prompts, defaults, types)
  end
  return input
end

-- Dragon Data Fetching and Search Functions
local function fetchDragonData()
  local response = gg.makeRequest("https://jkram143.github.io/jkram143..github.io/DC-Script/Website/Dragon")
  if not response or not response.content then
    gg.alert("⚠️ Failed to download dragon data!")
    return nil
  end
  local data = {}
  for match in response.content:gmatch("<div class='dragon%-item'>(.-)</div>") do
    local cleaned = match:gsub("<[^>]+>", ""):gsub("-", ""):gsub("^%s+", ""):gsub("%s+$", "")
    if cleaned:match("^%d") then
      local code, name = cleaned:match("^(%d+)%s+(.+)$")
      if code and name then
        table.insert(data, {code = code, name = name})
      end
    end
  end
  return #data > 0 and data or nil
end

local globalDragonData = fetchDragonData()

local function getDragonNameFromCode(code)
  if not globalDragonData then return "Undefined Dragon" end
  for _, dragon in ipairs(globalDragonData) do
    if dragon.code == tostring(code) then
      return dragon.name
    end
  end
  return "Undefined Dragon"
end

local function searchDragonCode()
  if not globalDragonData then
    globalDragonData = fetchDragonData()
    if not globalDragonData then return nil end
  end
  local input = safePromptSearch({"╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  Enter 1st Dragon name: ⚔️ \n╚════════ ≪ •❈• ≫ ════════╝"}, {""}, {"text"})
  if input == nil then return nil end
  local searchTerm = input[1]:lower()
  local matches, codes = {}, {}
  for _, dragon in ipairs(globalDragonData) do
    if dragon.name:lower():find(searchTerm, 1, true) then
      table.insert(matches, "📋 " .. dragon.code .. " - " .. dragon.name)
      table.insert(codes, dragon.code)
    end
  end
  if #matches == 0 then
    gg.alert("⚠️ No dragons found for: " .. searchTerm)
    return nil
  end
  local choice = gg.choice(matches, nil, "Select Dragon")
  if choice == nil then return nil end
  return codes[choice]
end
--  ╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  1st Dragon Stars: 🌟 \n╚════════ ≪ •❈• ≫ ════════╝

-- Main execution starts automatically
local function main()
  local dragonCode = searchDragonCode()
  if dragonCode == nil then 
    gg.alert("⚠️ Dragon selection cancelled!")
    os.exit()
  end
  
  -- Prompt for 1st dragon level and stars
  local input1 = safePromptSearch({
    "╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  1st Dragon Level: 🔎 \n╚════════ ≪ •❈• ≫ ════════╝",
    "╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  1st Dragon Stars: 🌟 \n╚════════ ≪ •❈• ≫ ════════╝"
  }, {nil, nil}, {"number", "number"})
  
  if input1 == nil or not input1[1] or not input1[2] then 
    gg.alert('⚠️ Invalid input for 1st dragon!')
    os.exit()
  end
  
  -- Prompt for 2nd dragon level and stars only after valid 1st dragon input
  local input2 = safePromptSearch({
    "╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  2st Dragon Level: 🔎 \n╚════════ ≪ •❈• ≫ ════════╝",
    "╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  2st Dragon Stars: 🌟 \n╚════════ ≪ •❈• ≫ ════════╝"
  }, {nil, nil}, {"number", "number"})
  
  if input2 == nil or not input2[1] or not input2[2] then 
    gg.alert('⚠️ Invalid input for 2nd dragon!')
    os.exit()
  end
  
local input3 = safePromptSearch({
    "╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  3st Dragon Level: 🔎 \n╚════════ ≪ •❈• ≫ ════════╝",
    "╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  3st Dragon Stars: 🌟 \n╚════════ ≪ •❈• ≫ ════════╝"
  }, {nil, nil, nil}, {"number", "number"," number" })
  
  if input3 == nil or not input3[2] or not input2[1] or not input1[1]  then 
    gg.alert('⚠️ Invalid input for 2nd dragon!')
    os.exit()
  end
  
  local datos = {input1[1], input2[1], input3[2]}
  local data = {input1[2], input2[2], input3[1]}
          gg.setRanges(gg.REGION_C_ALLOC)
          gg.searchNumber(dragonCode..";"..datos[1] ..";"..data[1]..";"..datos[2]..";"..data[2]..";"..data[3]..";"..datos[3].."::500", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
         gg.refineNumber(dragonCode..";"..datos[1]..";"..datos[2]..";"..datos[3]..","..data[1].."", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
         gg.refineNumber(dragonCode, gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

local t = gg.getResults(100)
local valuesToFreeze = {}


  for i, v in ipairs(t) do
    gg.setValues({
      {address = v.address + 0x0, flags = gg.TYPE_DWORD, value = 1011},
      {address = v.address + 0x4, flags = gg.TYPE_DWORD, value = 1},
      {address = v.address + 0x60, flags = gg.TYPE_DWORD, value = 1011},
      {address = v.address + 0x64, flags = gg.TYPE_DWORD, value = 1},
      {address = v.address + 0xC0, flags = gg.TYPE_DWORD, value = 1011},
      {address = v.address + 0xC4, flags = gg.TYPE_DWORD, value = 1},
    })
    table.insert(valuesToFreeze, {address = v.address + 0x0, flags = gg.TYPE_DWORD, value = 1011, freeze = true})
    table.insert(valuesToFreeze, {address = v.address + 0x4, flags = gg.TYPE_DWORD, value = 1, freeze = true})
    table.insert(valuesToFreeze, {address = v.address + 0x60, flags = gg.TYPE_DWORD, value = 1011, freeze = true})
    table.insert(valuesToFreeze, {address = v.address + 0x64, flags = gg.TYPE_DWORD, value = 1, freeze = true})
    table.insert(valuesToFreeze, {address = v.address + 0xC0, flags = gg.TYPE_DWORD, value = 1011, freeze = true})
    table.insert(valuesToFreeze, {address = v.address + 0xC4, flags = gg.TYPE_DWORD, value = 1, freeze = true})
  end

if #valuesToFreeze > 0 then
    gg.addListItems(valuesToFreeze)
    gg.toast(string.format('Saved %d values to freeze list!', #valuesToFreeze), true)
else
    gg.alert('No values found to freeze!')
end

  -- Make request to DC.lua
  local L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/DC.lua').content
  if not L then
    gg.alert('SERVER: Allow Internet Connection...')
  else
    pcall(load(L))
  end

  gg.toast('🎉 Battle Arena modification completed!', true)
  gg.sleep(1500)
  gg.toast(' Thanks for using my script!', true)
end

-- Start the script automatically
main()

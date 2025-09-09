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
    Main()
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
  local input = safePromptSearch({"╔════════ ≪ •❈• ≫ ════════╗\n  ⤵️  Enter Dragon name: ⚔️ \n╚════════ ≪ •❈• ≫ ════════╝"}, {""}, {"text"})
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

-- Main execution starts automatically
local function main()
  local dragonCode = searchDragonCode()
  if dragonCode == nil then 
    gg.alert("⚠️ Dragon selection cancelled!")
    os.exit()
  end
  

  gg.setRanges(gg.REGION_C_ALLOC)
        gg.searchNumber(dragonCode..";99~99999;0;-1::70", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
        gg.refineNumber(dragonCode..";99~999999;0::10", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)

        local t = gg.getResults(100)
        for i, v in ipairs(t) do
            valor_nivel = gg.getValues({{address=t[1].address+0x0C, flags=4}})[1].value
            gg.setValues({{address=t[i].address+0x0C, flags=4, value=valor_nivel+5500}})
        end
        gg.clearResults()
        gg.sleep(1000)
        os.exit(gg.setVisible(false))
    end


-- Start the script automatically
main()



-------------------------------------------------------------------------
-------------------------------------------------------------------------
function inputs()
local input = {}
local configFile = gg.EXT_CACHE_DIR .. '/' .. 
gg.getFile():match('') .. 'Burrow_free.txt'
local data = loadfile(configFile)
if data ~= nil then
  data = data()
end
input = gg.prompt({'⛺Burrow⛺️ Upgrade 999/0','Kindergarten habitat max 50','⬆️Farm level 2⬆️','⬆️Farm level 3⬆️'},data, {'checkbox','checkbox','checkbox','checkbox','checkbox','checkbox'}) if input ==nil then 
else
gg.saveVariable(input, configFile)
if input[1] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.setVisible(false)
gg.searchNumber('1;15;20;25;30;721;35:81', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.setVisible(false)
gg.refineNumber('1~30', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.setVisible(false)
gg.editAll('0', gg.TYPE_DWORD)
gg.setVisible(false)
gg.clearResults()
end
if input[2] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.setVisible(false)
gg.searchNumber('1;15;20;25;30;90;35:81', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.setVisible(false)
gg.refineNumber('1~30', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.setVisible(false)
gg.editAll('0', gg.TYPE_DWORD)
gg.setVisible(false)
gg.clearResults()
end
if input[3] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.setVisible(false)
gg.searchNumber('-300~300F;1 077 936 128;1 077 936 128;16~18::13', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.setVisible(false)
gg.refineNumber('16~18', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.setVisible(false)
gg.editAll('17', gg.TYPE_DWORD)
gg.setVisible(false)
gg.clearResults()
end
if input[4] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.setVisible(false)
gg.searchNumber('-300~300F;1 077 936 128;1 077 936 128;16~18::13', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.setVisible(false)
gg.refineNumber('16~18', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.setVisible(false)
gg.editAll('18', gg.TYPE_DWORD)
gg.setVisible(false)
gg.clearResults()
end
if input[5] then
end
if input[6] then
L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Decoration.lua').content
if not L then gg.alert('SERVER: Allow Internet Connection...') else
pcall(load(L)) end
end
 end
  end

-------------------------------------------------------------------------
gg.setVisible(true)
while true do
if gg.isVisible() then
gg.setVisible(false)
inputs() end end
-------------------------------------------------------------------------


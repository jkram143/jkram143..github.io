

-------------------------------------------------------------------------
-------------------------------------------------------------------------
function inputs()
local input = {}
local configFile = gg.EXT_CACHE_DIR .. '/' .. 
gg.getFile():match('') .. 'move_free.txt'
local data = loadfile(configFile)
if data ~= nil then
  data = data()
end
input = gg.prompt({'📍Move 1 To Move 0📍','📍Move 2 To Move 0📍','📍Move 3 To Move 0📍','📍Move 4 To Move 0📍','📍Move 5 To Move 0📍','📍Move 6 To Move 0📍','Close'},data, {'checkbox','checkbox','checkbox','checkbox','checkbox','checkbox','checkbox'})
if input ==nil then
else

gg.saveVariable(input, configFile)
if input[1] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 065 353 216;1 065 353 216;2~1000;10~10000::17', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 065 353 216', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
found = gg.getResultCount()
gg.alert('We found: '..found)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()
end
if input[2] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 073 741 824;1 073 741 824::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 073 741 824', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()
end
if input[3] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 077 936 128;1 077 936 128::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 077 936 128', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()
end
if input[4] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 082 130 432;1 082 130 432::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 082 130 432', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()
end
if input[5] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 084 227 584;1 084 227 584::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 084 227 584', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()
end
if input[6] then
gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 086 324 736;1 086 324 736::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 086 324 736', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()
end
if input[7] then
L = gg.makeRequest('https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/Decoration.lua,'').content
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

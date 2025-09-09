
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

gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('1000~5600;-1;1~70;0~5::17', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber('1000~5600;-1;1~70::10', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.refineNumber('1000~5600;1~70::10', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
gg.getResults(10000)
gg.editAll('1011;1', gg.TYPE_DWORD)
gg.clearResults()

gg.alert("✅ Dragon Rescue Modification Completed!")

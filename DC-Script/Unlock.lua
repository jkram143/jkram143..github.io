
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
        gg.searchNumber("306;16;0~8Q::57", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
        gg.refineNumber("0~8", gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
        gg.getResults(1000)
        gg.editAll("9", gg.TYPE_DWORD)
        gg.clearResults()
        gg.setRanges(gg.REGION_C_ALLOC | gg.REGION_OTHER)
        gg.searchNumber(":expansions", gg.TYPE_BYTE)
        gg.getResults(10000)
        gg.editAll("0", gg.TYPE_BYTE)
        gg.clearResults()

gg.alert("✅ Island unclock al Completed!")

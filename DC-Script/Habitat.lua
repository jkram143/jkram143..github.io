
L={'◼', '◻', '◻', '◻', '◻', '◻'} -- LOADING TABLE
LD = 0
for i=0, 6, 1 do
	if gg.isVisible(true) and i ~= 6 then
		gg.setVisible(false)
	end
	gg.sleep(1000)
	gg.toast('Loading move habitat: '..L[1]..L[2]..L[3]..L[4]..L[5]..L[6]..' '..LD..'/100%')
	LD = LD + 20
	table.remove(L)
	table.insert(L, 2, "◼")
	if i == 6 then
		gg.sleep(2000)
	end
end

gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 065 353 216;1 065 353 216;2~1000;10~10000::17', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 065 353 216', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()

gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 073 741 824;1 073 741 824::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 073 741 824', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()

gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 077 936 128;1 077 936 128::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 077 936 128', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()

gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 082 130 432;1 082 130 432::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 082 130 432', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()

gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 084 227 584;1 084 227 584::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 084 227 584', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()

gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber('-300~300F;1 086 324 736;1 086 324 736::9', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.refineNumber('1 086 324 736', gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
gg.getResults(5000)
gg.editAll('0', gg.TYPE_DWORD)
gg.clearResults()

gg.alert("✅ Move Habitats Enabled!")

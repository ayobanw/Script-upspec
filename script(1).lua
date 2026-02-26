-- 🔐 Sistem Key Akses Sahaja
local github_user = "ayobanw"
local repo_name = "Script-upspec"
local key_file = "keys.txt"
local script_file = "[ADMIN] AYOB PROGRAM V4.9.7.lua"

local key_url = "https://raw.githubusercontent.com/"..github_user.."/"..repo_name.."/main/"..key_file
local script_url = "https://raw.githubusercontent.com/"..github_user.."/"..repo_name.."/main/"..script_file

local userKey = gg.prompt({"🔑 Masukkan Key Anda:"})[1]
if not userKey then
    gg.alert("❌ Key diperlukan.")
    os.exit()
end

local remoteKeys = gg.makeRequest(key_url)
if not remoteKeys.content or not remoteKeys.content:find(userKey) then
    gg.alert("❌ Key tidak sah. Hubungi Admin.")
    os.exit()
end

local remoteScript = gg.makeRequest(script_url)
if remoteScript and remoteScript.content then
    load(remoteScript.content)()
else
    gg.alert("❌ Gagal muat skrip utama.")
end

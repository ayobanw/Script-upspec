-- 🔐 Sistem Key Akses Sahaja
local github_user = "ayobanw"
local repo_name = "Script-upspec"
local key_file = "keys.txt"
local script_file = "script-utama.lua"

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






if os.date("%Y%m%d") > "20291230" then
  gg.alert("SCRIPT EXPIRED. Contact Admin.")
  os.exit()
end

gg.setVisible(false)
gg.sleep(300)
gg.alert("WELCOME TO SCRIPT BY AYOB PROGRAM")
gg.toast("Loading...")

gg.clearResults()
gg.clearList()

local menu = {
  "10k Coin",
  "20k Coin",
  "30k Coin",
  "40k Coin",
  "50k Coin",
  "500k Coin",
  "Max Coin (999M)",
  "Exit"
}

function patchCoin(hex)
  local base = gg.getRangesList("libil2cpp.so")[2].start
  local addr = base + 0x316DF98
  local values = {
    {address = addr + 0, value = hex[1], flags = 4},
    {address = addr + 4, value = hex[2], flags = 4},
    {address = addr + 8, value = hex[3], flags = 4},
    {address = addr + 12, value = hex[4], flags = 4},
    {address = addr + 16, value = hex[5], flags = 4},
  }
  gg.setValues(values)
  gg.alert("Patched! Press GG Icon")
end

function showMenu()
  local choice = gg.choice(menu, nil, "SCRIPT BY AYOB")
  if not choice then return end

  local patches = {
    {"F284E200h","F2A00000h","F2C00000h","F2E00000h","D65F03C0h"},
    {"F289C400h","F2A00000h","F2C00000h","F2E00000h","D65F03C0h"},
    {"F28EA600h","F2A00000h","F2C00000h","F2E00000h","D65F03C0h"},
    {"F2938800h","F2A00000h","F2C00000h","F2E00000h","D65F03C0h"},
    {"F2986A00h","F2A00000h","F2C00000h","F2E00000h","D65F03C0h"},
    {"F2942400h","F2A000E0h","F2C00000h","F2E00000h","D65F03C0h"},
    {"F2993FE0h","F2A77340h","F2C00000h","F2E00000h","D65F03C0h"},
  }

  if choice >= 1 and choice <= 7 then
    patchCoin(patches[choice])
  elseif choice == 8 then
    os.exit()
  end
end

while true do
  if gg.isVisible(true) then
    gg.setVisible(false)
    showMenu()
  end
end

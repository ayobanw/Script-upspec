-- 🔐 Sistem Tamat Tempoh
if os.date("%Y%m%d") > "20241230" then
    gg.alert([[
        ☣️THIS SCRIPT HAS EXPIRED ☣️
🔸PLEASE REFER TO THE DEVELOPER TO RENEW YOUR SCRIPT🔸
       🔹 TELEGRAM: ayobcicaknakal  🔹TIKTOK: SB_KP
    ]])
    os.exit()
end

gg.setVisible(false)
gg.sleep(300)
gg.alert([[
     𝑾𝑬𝑳𝑪𝑶𝑴 𝑻𝑶 𝑺𝑪𝑹𝑰𝑷𝑻 𝑩𝒀 𝑨𝒀𝑶𝑩 𝑷𝑹𝑶𝑮𝑹𝑨𝑴
     ☣️ 🅰🅽🆆 ®©™ ☣️
]])

-- UI Loading
local progress = {"💎𝟭𝟬%", "💎💎𝟮𝟬%", "💎💎💎𝟯𝟬%", "💎💎💎💎𝟰𝟬%", "💎💎💎💎💎𝟲𝟬%",
                  "💎💎💎💎💎💎𝟲𝟱%", "💎💎💎💎💎💎💎𝟴𝟬%", "💎💎💎💎💎💎💎💎𝟴𝟱%", "💎💎💎💎💎💎💎💎💎𝟵𝟬%", "💎💎💎💎💎💎💎💎💎💎𝟭𝟬𝟬%"}
for _, v in ipairs(progress) do
    gg.toast(v)
    gg.sleep(300)
end
gg.toast("SELESAI")
gg.sleep(1000)
gg.alert("SILA TEKAN LOGO GG")

-- Bersih hasil GG
gg.clearResults()
gg.clearList()

-- Menu Pilihan
local menu = {"🪙10k coin", "🪙20k coin", "🪙30k coin", "🪙40k coin", "🪙50k coin",
              "🪙500k coin", "🪙999,999,999m coin", "❌ KELUAR"}
local ac = "TEKAN LOGO COIN"
local base_offset = 0x316DF98

local patch_values = {
    {"F284E200h", "F2A00000h", "F2C00000h", "F2E00000h", "D65F03C0h"},
    {"F289C400h", "F2A00000h", "F2C00000h", "F2E00000h", "D65F03C0h"},
    {"F28EA600h", "F2A00000h", "F2C00000h", "F2E00000h", "D65F03C0h"},
    {"F2938800h", "F2A00000h", "F2C00000h", "F2E00000h", "D65F03C0h"},
    {"F2986A00h", "F2A00000h", "F2C00000h", "F2E00000h", "D65F03C0h"},
    {"F2942400h", "F2A000E0h", "F2C00000h", "F2E00000h", "D65F03C0h"},
    {"F2993FE0h", "F2A77340h", "F2C00000h", "F2E00000h", "D65F03C0h"},
}

function applyPatch(values)
    local C21 = gg.getRangesList('libil2cpp.so')[2].start
    local YT = {}
    for i, v in ipairs(values) do
        YT[i] = {
            address = C21 + base_offset + (i - 1) * 4,
            value = v,
            flags = 4
        }
    end
    gg.setValues(YT)
    gg.alert("TEKAN LOGO COIN", "OK")
    gg.toast(ac)
end

function showMenu()
    local choice = gg.choice(menu, nil, "☣️🅰🅽🆆 ®©™☣️
SCRIPT BY AYOB PROGRAM")
    if choice == nil then return end
    if choice == 8 then os.exit() end
    applyPatch(patch_values[choice])
end

while true do
    if gg.isVisible(true) then
        gg.setVisible(false)
        showMenu()
    end
end

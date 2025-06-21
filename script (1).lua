-- Auto generate user key (based on device info)
local user = gg.getUserName() or os.getenv("USER") or "unknown"
local android_id = gg.getDeviceId() or "default-id"
local key = gg.crypt(user .. android_id, "gg-secret")

-- URL fail keys.txt di GitHub
local keys_url = "https://raw.githubusercontent.com/ayobanw/Script-upspec/main/keys.txt"

-- Muat turun senarai key whitelist
local remote = gg.makeRequest(keys_url)
if not remote.content then
    gg.alert("❌ Tidak dapat akses senarai key dari GitHub.")
    os.exit()
end

-- Semak sama ada key user ini dalam fail keys.txt
if not remote.content:find(key) then
    gg.alert("❌ Akses ditolak. Key tidak sah:\n" .. key)
    os.exit()
end

-- Kalau lulus
gg.toast("✅ Akses dibenarkan: " .. key)

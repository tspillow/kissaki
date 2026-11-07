local dry_run = false

for _, a in ipairs(arg or {}) do
	if a == "--dry-run" or a == "-n" then
		dry_run = true
	end
end

local Kissaki = dofile("/usr/lib/kissaki/src.lua")
local config = dofile("/etc/kissaki/configuration.lua")

print("Starting deployment" .. (dry_run and " (dry run)" or "") .. "...")

local ok = Kissaki.apply(config, { dry_run = dry_run })

if ok then
	print("[SUCCESS] Done.")
else
	print("[FAILED] Deployment came with errors!")
	os.exit(1)
end

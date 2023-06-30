local wezterm = require 'wezterm'

local config = {}

local wsl_domains = wezterm.default_wsl_domains()

local _, domain_info = next(wsl_domains)

if domain_info ~= nil then
  config.default_domain = domain_info.name
end

return config

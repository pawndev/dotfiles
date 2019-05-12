local gears = require("gears")
-- Variables that hold paths to various icons
local icons = {}
-- Set icon path prefix
local i = gears.filesystem.get_configuration_dir() .. "icons/"
local weather_i = i .. "weather"

icons.archlabs = i .. "archlabs.png"
icons.pikachu = i .. "pikachu.png"
icons.web_browser = i .. "web_browser.svg"
icons.camera = i .. "camera.svg"

-- Other icons (mostly used in sidebar and menu)
icons.playerctl_toggle_icon = i .. "playerctl_toggle.png"
icons.playerctl_prev_icon = i .. "playerctl_prev.png"
icons.playerctl_next_icon = i .. "playerctl_next.png"
icons.stats_icon = i .. "stats.png"
icons.search_icon = i .. "search.png"
icons.volume_icon = i .. "volume.png"
icons.muted_icon = i .. "muted.png"
icons.mpd_icon = i .. "mpd.png"
icons.firefox_icon = i .. "firefox.png"
icons.youtube_icon = i .. "youtube.png"
icons.reddit_icon = i .. "reddit.png"
icons.discord_icon = i .. "discord.png"
icons.telegram_icon = i .. "telegram.png"
icons.steam_icon = i .. "steam.png"
icons.lutris_icon = i .. "lutris.png"
icons.files_icon = i .. "files.png"
icons.manual_icon = i .. "manual.png"
icons.keyboard_icon = i .. "keyboard.png"
icons.appearance_icon = i .. "appearance.png"
icons.editor_icon = i .. "editor.png"
icons.redshift_icon = i .. "redshift.png"
icons.gimp_icon = i .. "gimp.png"
icons.terminal_icon = i .. "terminal.png"
icons.mail_icon = i .. "mail.png"
icons.music_icon = i .. "music.png"
icons.temperature_icon = i .. "temperature.png"
icons.battery_icon = i .. "battery.png"
icons.battery_charging_icon = i .. "battery_charging.png"
icons.cpu_icon = i .. "cpu.png"
icons.compositor_icon = i .. "compositor.png"
icons.start_icon = i .. "start.png"
icons.ram_icon = i .. "ram.png"
icons.screenshot_icon = i .. "screenshot.png"
icons.home_icon = i .. "home.png"
icons.alarm_icon = i .. "alarm.png"
icons.alarm_off_icon = i .. "alarm_off.png"
icons.alert_icon = i .. "alert.png"

-- Weather icons
icons.cloud_icon = weather_i .. "cloud.png"
icons.dcloud_icon = weather_i .. "dcloud.png"
icons.ncloud_icon = weather_i .. "ncloud.png"
icons.sun_icon = weather_i .. "sun.png"
icons.star_icon = weather_i .. "star.png"
icons.rain_icon = weather_i .. "rain.png"
icons.snow_icon = weather_i .. "snow.png"
icons.mist_icon = weather_i .. "mist.png"
icons.storm_icon = weather_i .. "storm.png"
icons.whatever_icon = weather_i .. "whatever.png"

-- Exit screen icons
icons.exit_icon = i .. "exit.png"
icons.poweroff_icon = i .. "poweroff.png"
icons.reboot_icon = i .. "reboot.png"
icons.suspend_icon = i .. "suspend.png"
icons.lock_icon = i .. "lock.png"

return icons
--   

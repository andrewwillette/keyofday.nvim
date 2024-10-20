---@diagnostic disable: undefined-doc-name, inject-field, duplicate-doc-field, param-type-mismatch
local M = {}

---@class KeyOfDay
---@field key string
---@field date os.time

local keys = {
  "A",
  "A#",
  "B",
  "C",
  "C#",
  "D",
  "D#",
  "E",
  "F",
  "F#",
  "G",
  "G#",
}

local keyIndex = {
  key = keys[0],
  date = os.time({ year = 2024, month = 10, day = 8 }),
}

local function days_difference(epoch1, epoch2)
  local diff_in_seconds = os.difftime(epoch2, epoch1)
  local diff_in_days = math.floor(diff_in_seconds / (60 * 60 * 24))
  return diff_in_days + 1
end

local function getdifferencewithmod(difference)
  return difference % 12
end

---@param day os.date
M.keyofday = function(day)
  local dayforkey = nil
  if day ~= nil then
    dayforkey = day
  else
    dayforkey = os.date("*t")
  end
  dayforkey.hour = 0
  dayforkey.min = 0
  dayforkey.sec = 0
  local start_of_day = os.time(dayforkey)
  local daysdifference = days_difference(keyIndex.date, start_of_day)
  local key = getdifferencewithmod(daysdifference)
  return keys[key + 1]
end

return M

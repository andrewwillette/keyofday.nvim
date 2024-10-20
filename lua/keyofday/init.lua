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

local keyindex = {
  key = keys[0],
  date = os.time({ year = 2024, month = 10, day = 8 }),
}

local function daysdifference(epoch1, epoch2)
  local secondsdiff = os.difftime(epoch2, epoch1)
  local daysdiff = math.floor(secondsdiff / (60 * 60 * 24))
  return daysdiff + 1
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
  local startofday = os.time(dayforkey)
  local daysdifference = daysdifference(keyindex.date, startofday)
  local key = getdifferencewithmod(daysdifference)
  return keys[key + 1]
end

return M

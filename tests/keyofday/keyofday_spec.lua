local keyofday = require("keyofday")

describe("keyofday", function()
  it("should return the key of the day", function()
    local testcases = {
      {
        date = os.date("*t", os.time { year = 2024, month = 10, day = 21 }),
        key = "A#"
      },
      {
        date = os.date("*t", os.time { year = 2024, month = 10, day = 20 }),
        key = "A"
      },
      {
        date = os.date("*t", os.time { year = 2024, month = 10, day = 19 }),
        key = "G#"
      },
      {
        date = os.date("*t", os.time { year = 2024, month = 10, day = 18 }),
        key = "G"
      },
      {
        date = os.date("*t", os.time { year = 2024, month = 10, day = 17 }),
        key = "F#"
      },
    }
    for _, testcase in ipairs(testcases) do
      local key = keyofday.keyofday(testcase.date)
      assert.are.same(testcase.key, key)
    end
  end)
end)

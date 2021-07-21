--[[
  Lua implementation of Quicksort with 3-way partition

  Author: kithf (code@kithf.xyz)
--]]

local part
part = function(a, l, r)
  local x, j, o = a[l], l, l

  for i = l+1,r+1 do
    if a[i] < x then
      o = o + 1
      a[i], a[o] = a[o], a[i]
      a[j], a[o] = a[o], a[j]
      j = j + 1
    elseif a[i] == x then
      o = o + 1
      a[i], a[o] = a[o], a[i]
    end
  end

  if j > l then
    a[l], a[j-1] = a[j-1], a[l]
  else
    a[l], a[j] = a[j], a[l]
  end

  return j, o
end
local quick3
quick3 = function(a, l, r)
  if l >= r then return end

  local k = math.random(l, r)
  a[l], a[k] = a[k], a[l]
  local m1, m2 = part(a, l, r)
  quick3(a, l, m1 - 1)
  quick3(a, m2 + 1, r)
end

return quick3

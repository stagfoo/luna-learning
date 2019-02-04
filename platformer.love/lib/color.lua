genColor = function(r, g, b)
  local forWeb = false
  if forWeb then
      return {r, g, b}
  end
  return {r/255, g/255, b/255}
end

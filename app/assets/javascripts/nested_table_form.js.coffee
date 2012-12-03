$ ->
  window.NestedFormEvents.prototype.insertFields = (content, assoc, link) ->
    $tr = $(link).closest('tr')
    $(content).insertBefore($tr)

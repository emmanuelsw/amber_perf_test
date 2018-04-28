h1 Show Sign
p = sign.name
p = sign.email
p = sign.phone
p = sign.birthdate
p = sign.sign
p
  == link_to("back", "/signs", class: "btn btn-success btn-xs")
  == link_to("edit", "/signs/#{sign.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/signs/#{sign.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")

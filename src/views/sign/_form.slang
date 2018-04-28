- if sign.errors
  ul.errors
    - sign.errors.each do |error|
      li = error.to_s

== form(action: "/signs/#{sign.id.to_s}", method: sign.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: sign.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_field(name: "email", value: sign.email, placeholder: "Email", class: "form-control")
  div.form-group
    == text_field(name: "phone", value: sign.phone, placeholder: "Phone", class: "form-control")
  div.form-group
    == text_field(name: "birthdate", value: sign.birthdate, placeholder: "Birthdate", class: "form-control")
  div.form-group
    == text_area(name: "sign", content: sign.sign, placeholder: "Sign", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/signs", class: "btn btn-default btn-xs")

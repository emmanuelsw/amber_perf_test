div.row
  div.col-sm-11
    h2 Signs
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/signs/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Email
        th Phone
        th Birthdate
        th Sign
        th Actions
    tbody
      - signs.each do |sign|
        tr
          td = sign.name
          td = sign.email
          td = sign.phone
          td = sign.birthdate
          td = sign.sign
          td
            span
              == link_to("read", "/signs/#{sign.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/signs/#{sign.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/signs/#{ sign.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")

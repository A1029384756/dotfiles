; extends

(declaration 
    name: (identifier) @_id
    value: (string (string_content) @injection.content)
    (#match? @_id ".*[gG]roovy.*")
    (#set! injection.include-children)
    (#set! injection.language "groovy"))

%dw 2.0

var fhirXMLToJson = (obj, enforceAsArray) ->
    obj mapObject {
        resourceType: $$,
        (fhirXMLObjectToJson($, enforceAsArray))
    }

var fhirXMLObjectToJson = (obj, enforceAsArray) ->
    obj pluck { key: $$, val: if ($.@value?) $.@value else $ } reduce ((node, res={}) ->
        if (node.key ~= "div") "div": xmlToString("div": node.val)
        else if (not (enforceAsArray contains node.key as String))
            res ++ (node.key): node.val match {
                case is Object -> fhirXMLObjectToJson(node.val, enforceAsArray)
                else -> node.val
            }
        else
            if (res[node.key]?) {
                (res - node.key),
                (node.key): res[node.key] << 
                    if (not node.val is Object) node.val
                    else fhirXMLObjectToJson(node.val, enforceAsArray)
            }
            else res ++ (node.key): [
                if (not node.val is Object) node.val
                else fhirXMLObjectToJson(node.val, enforceAsArray)
            ]
    )

var xmlToString = (obj) ->
    write(write(obj, "application/xml", {writeDeclaration: false, indent: false}), "text/plain")
        replace "\n" with ""
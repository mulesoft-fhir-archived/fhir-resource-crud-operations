%dw 2.0

//Function to convert JSON to FHIR style XML
var toFhirXml = (payload) ->
    {
        (payload.resourceType) @(xmlns: "http://hl7.org/fhir"): (payload - "resourceType") mapObject jsonObjectToFhirXML($$, $)
    }

var jsonObjectToFhirXML = (key, object) ->
    object match {
        case is Array -> {(object map jsonObjectToFhirXML(key, $))}
        case is Object -> (key): object mapObject jsonObjectToFhirXML($$, $)
        else ->
            if (key ~= "div") read(object, "application/xml")
            else (key) @(value: object): null
    }
    
   
RuleSet: Slice(item, definition, discriminatorType, discriminatorPath, rule, description, ordered)
* {item} 
  * ^definition = "{definition}"
  * ^slicing.discriminator[+].type = #{discriminatorType}
  * ^slicing.discriminator[=].path = "{discriminatorPath}"
  * ^slicing.rules = #{rule}
  * ^slicing.description = "{description}"
  * ^slicing.ordered = {ordered}

RuleSet: ExampleTransactionalEntry(resourceID, resourceType)
* entry[+].fullUrl = "http://hapi-fhir:8080/fhir/{resourceType}/{resourceID}"
* entry[=].resource = {resourceID}
* entry[=].request.method = #PUT
* entry[=].request.url = "{resourceType}/{resourceID}"

RuleSet: ExampleDocumentEntry(resourceID, resourceType)
* entry[+].fullUrl = "http://hapi-fhir:8080/fhir/{resourceType}/{resourceID}"
* entry[=].resource = {resourceID}

RuleSet: CompositionEntry(allowedResourcesForEntry, resourceID, sectionSLice, sectionCode, sectionTitle, entrySLice, shortDescription, definition, cardinality)
* section[{sectionSLice}]
  * title 1..1
  * title = "{sectionTitle}"
  * code 1..1
  * code = {sectionCode}
  * entry 1..
  * entry only Reference({allowedResourcesForEntry})
  * entry ^slicing.discriminator[+].type = #profile
  * entry ^slicing.discriminator[=].path = "resolve()"
  * entry ^slicing.rules = #open
  * entry ^short = "{shortDescription}"
  * entry ^definition = "{definition}"
  * entry contains
    {entrySLice} {cardinality} MS
  
  * entry[{entrySLice}] ^definition =
    "reason(s) why this should be supported."
  * entry[{entrySLice}] only Reference({resourceID})

  * text 1..1
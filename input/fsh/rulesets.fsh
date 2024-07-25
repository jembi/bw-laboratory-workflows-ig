RuleSet: Slice(item, definition, discriminatorType, discriminatorPath, rule, description, ordered)
* {item} ^definition = "{definition}"
* {item} ^slicing.discriminator[+].type = #{discriminatorType}
* {item} ^slicing.discriminator[=].path = "{discriminatorPath}"
* {item} ^slicing.rules = #{rule}
* {item} ^slicing.description = "{description}"
* {item} ^slicing.ordered = {ordered}

RuleSet: ExampleTransactionalEntry(resourceID, resourceType)
* entry[+].fullUrl = "http://hapi-fhir:8080/fhir/{resourceType}/{resourceID}"
* entry[=].resource = {resourceID}
* entry[=].request.method = #PUT
* entry[=].request.url = "{resourceType}/{resourceID}"

RuleSet: ExampleDocumentEntry(resourceID, resourceType)
* entry[+].fullUrl = "http://hapi-fhir:8080/fhir/{resourceType}/{resourceID}"
* entry[=].resource = {resourceID}

RuleSet: CompositionEntry(allowedResourcesForEntry, resourceID, sectionSLice, sectionTitle, entrySLice, shortDescription, cardinality, sectionCode)
* section[{sectionSLice}].title 1..1
* section[{sectionSLice}].title = "{sectionTitle}"
* section[{sectionSLice}].code 1..1
* section[{sectionSLice}].code = {sectionCode}
* section[{sectionSLice}].entry 1..
* section[{sectionSLice}].entry only Reference({allowedResourcesForEntry})
* section[{sectionSLice}].entry ^slicing.discriminator[+].type = #profile
* section[{sectionSLice}].entry ^slicing.discriminator[=].path = "resolve()"
* section[{sectionSLice}].entry ^slicing.rules = #open
* section[{sectionSLice}].entry ^short = "{shortDescription}"

* section[{sectionSLice}].entry contains
    {entrySLice} {cardinality} MS

* section[{sectionSLice}].entry[{entrySLice}] ^definition =
"reason(s) why this should be supported."
* section[{sectionSLice}].entry[{entrySLice}] only Reference({resourceID})

RuleSet: EntryToSection(resourceID, sectionSLice, entrySLice, cardinality)
* section[{sectionSLice}].entry contains
    {entrySLice} {cardinality} MS
  
* section[{sectionSLice}].entry[{entrySLice}] ^definition =
    "reason(s) why this should be supported."
* section[{sectionSLice}].entry[{entrySLice}] only Reference({resourceID})
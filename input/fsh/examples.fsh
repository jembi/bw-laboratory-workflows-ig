Instance: CurrentServiceProviderExample
InstanceOf: UATServiceProvider
Usage: #example
Title: "Organization - Current Facility"
Description: "Current organization providing health related services."
* active = true
* name = "Meshwalkiya Health Center"
* address[+].line[+] = "Meshulekia"
* address[=].city = "Kirkos"
* address[=].state = "Addis Ababa"
* address[=].district = "Kirkos woreda 9"

* identifier[MOHID][+].value = "MOH001"
* identifier[MOHID][=].system = "http://moh.gov.bw/fhir/identifier/mohid"

* identifier[HFUID][+].value = "HFUID001"
* identifier[HFUID][=].system = "http://moh.gov.bw/fhir/identifier/hfuid"

* type[+] = $SCT#257622000
* type[=].text = "Current Healthcare Provider"

Instance: LaboratoryProviderExample
InstanceOf: UATServiceProvider
Usage: #example
Title: "Organization - Current Laboratory"
Description: "Current organization providing laboratory related services."
* active = true
* name = "Meshwalkiya Health Center"
* address[+].line[+] = "Meshulekia"
* address[=].city = "Kirkos"
* address[=].state = "Addis Ababa"
* address[=].district = "Kirkos woreda 9"

* identifier[MOHID][+].value = "MOH001"
* identifier[MOHID][=].system = "http://moh.gov.bw/fhir/identifier/mohid"

* identifier[HFUID][+].value = "HFUID001"
* identifier[HFUID][=].system = "http://moh.gov.bw/fhir/identifier/hfuid"

* type[+] = $SCT#45899008
* type[=].text = "Laboratory"

Instance: GeneralEncounterExample
InstanceOf: UATTargetFacilityEncounter
Usage: #example
Title: "Encounter - Initiated By The Facility Providing the Service" 
Description: "Represents the current facility at which the patient is receiving health services."
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#OBSENC
* status = #finished
* subject = Reference(GeneralPatientExample)
* period.start = "2012-12-09"
* period.end = "2012-12-09"
* serviceProvider = Reference(CurrentServiceProviderExample)

Instance: GeneralPatientExample
InstanceOf: UATBwPatient
Usage: #example
Title: "Patient - General"
Description: "Is used to document demographics and other administrative information about an individual receiving care or other health-related services."
* identifier[MRN].value = "MRN12345671"
* identifier[MRN].system = "http://moh.gov.bw/fhir/identifier/mrn"
* identifier[MRN].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR
* identifier[EMR-ID].value = "NID12345671"
* identifier[EMR-ID].system = "http://moh.gov.bw/fhir/identifier/emr-id"

* name[+].given[+] = "Mark"
* name[=].family = "Adams"

* gender = #male
* birthDate = "2000-11-11"
* maritalStatus = http://terminology.hl7.org/CodeSystem/v3-MaritalStatus#M
* address[+].city = "Addis Ababa"
* address[=].line[+] = "123"
* address[=].line[+] = "Tesfaye Street"
* address[=].line[+] = "Bole"
* address[=].district = "Addis Ababa Central District"
* address[=].state = "Addis Ababa"

* managingOrganization = Reference(CurrentServiceProviderExample)

* telecom[+].system = #phone
* telecom[=].value = "27537652509"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "someone@something.org"
* telecom[=].use = #home

Instance: GeneralPractitionerExample
InstanceOf: UATPractitioner
Usage: #example
Title: "Practitioner - General Practitioner"
Description: 
"Represents the practitioners who participated in the health-related event."
* name[+].prefix[+] = "Dr"
* name[=].given[+] = "Tom"
* name[=].given[+] = "Junes"
* name[=].family = "Smith"
* telecom[+].system = #phone
* telecom[=].value = "27537652509"
* telecom[=].use = #work
* telecom[+].system = #email
* telecom[=].value = "someone@something.org"
* telecom[=].use = #home

Instance: LabOrderTaskExample
InstanceOf: UATLabTask
Usage: #example
Title: "Task - New Lab Order Requested"
Description: "Represents a task that has been initiated to facilitate the overall progress of the new lab request."
* identifier[FILL].system = "http://moh.gov.bw/fhir/identifier/task-id"
* identifier[FILL].value = "ORDER12345"
* identifier[FILL].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* basedOn = Reference(ActiveServiceRequestExample)
* status = #requested
* intent = #order
* executionPeriod.start = "2022-07-28"
* requester = Reference(CurrentServiceProviderExample)
* owner = Reference(CurrentServiceProviderExample)

Instance: LabResultTaskExample
InstanceOf: UATLabTask
Usage: #example
Title: "Task - Lab Order Completed"
Description: "Indicates that the task that has been initiated for the lab request has now been completed and the lab result issued."
* identifier[FILL].system = "http://moh.gov.bw/fhir/identifier/task-id"
* identifier[FILL].value = "ORDER12345"
* identifier[FILL].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* basedOn = Reference(CompletedServiceRequestExample)
* status = #completed
* intent = #order
* executionPeriod.start = "2022-07-28"
* executionPeriod.end = "2022-07-30"
* requester = Reference(CurrentServiceProviderExample)
* owner = Reference(CurrentServiceProviderExample)
* output.type.text = "Some Lab Result"
* output.valueReference = Reference(LabResultsDiagnosticReportExample)

Instance: LabOrderCancellationTaskExample
InstanceOf: UATLabTask
Usage: #example
Title: "Task - Lab Order Cancelled by Requester"
Description: "Indicates that the task that has been initiated for the lab request has been cancelled by the requestiong organization/practitioner."
* identifier[FILL].system = "http://moh.gov.bw/fhir/identifier/task-id"
* identifier[FILL].value = "ORDER12345"
* identifier[FILL].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* basedOn = Reference(RevokedServiceRequestExample)
* status = #cancelled
* statusReason = $SCT#281264009
* intent = #order
* executionPeriod.start = "2022-07-28"
* executionPeriod.end = "2022-07-30"
* requester = Reference(CurrentServiceProviderExample)
* owner = Reference(CurrentServiceProviderExample)

Instance: LabOrderRejectionTaskExample
InstanceOf: UATLabTask
Usage: #example
Title: "Task - Lab Order Rejected by Laboratory"
Description: "Indicates that the task that has been initiated for the lab request has been rejected by the receiving laboratory/lab technician."
* identifier[FILL].system = "http://moh.gov.bw/fhir/identifier/task-id"
* identifier[FILL].value = "ORDER12345"
* identifier[FILL].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL
* basedOn = Reference(CompletedServiceRequestExample)
* status = #rejected
* statusReason = $SCT#123840003
* intent = #order
* executionPeriod.start = "2022-07-28"
* executionPeriod.end = "2022-07-30"
* requester = Reference(CurrentServiceProviderExample)
* owner = Reference(CurrentServiceProviderExample)

Instance: ActiveServiceRequestExample
InstanceOf: UATServiceRequest
Usage: #example
Title: "Service Request - Lab Order (Active)"
Description: "Represents an active service request for the lab order."
* identifier[PLAC].value = "ORDER12345"
* identifier[PLAC].system = "http://moh.gov.bw/fhir/identifier/service-request-id"
* identifier[PLAC].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* status = #active
* intent = #order
* code.text = "Some Test Type"
* subject = Reference(GeneralPatientExample)
* encounter = Reference(GeneralEncounterExample)
* occurrenceDateTime = "2012-01-05"
* requester = Reference(GeneralPractitionerExample)
* performer = Reference(LaboratoryProviderExample)
* specimen = Reference(AvailableSpecimenForActiveRequestsExample)

Instance: RevokedServiceRequestExample
InstanceOf: UATServiceRequest
Usage: #example
Title: "Service Request - Lab Order (Revoked)"
Description: "Represents a service request that has been revoked before it could be fully attended to."
* identifier[PLAC].value = "ORDER12345"
* identifier[PLAC].system = "http://moh.gov.bw/fhir/identifier/service-request-id"
* identifier[PLAC].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* status = #revoked
* intent = #order
* code.text = "Some Test Type"
* subject = Reference(GeneralPatientExample)
* encounter = Reference(GeneralEncounterExample)
* occurrenceDateTime = "2012-01-05"
* requester = Reference(GeneralPractitionerExample)
* performer = Reference(LaboratoryProviderExample)
* specimen = Reference(AvailableSpecimenForRevokedRequestExample)

Instance: CompletedServiceRequestExample
InstanceOf: UATServiceRequest
Usage: #example
Title: "Service Request - Lab Order (Completed)"
Description: "Represents a completed service request for the lab order."
* identifier[PLAC].value = "ORDER12345"
* identifier[PLAC].system = "http://moh.gov.bw/fhir/identifier/service-request-id"
* identifier[PLAC].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC
* status = #completed
* intent = #order
* code.text = "Some Test Type"
* subject = Reference(GeneralPatientExample)
* encounter = Reference(GeneralEncounterExample)
* occurrenceDateTime = "2012-01-05"
* requester = Reference(GeneralPractitionerExample)
* performer = Reference(LaboratoryProviderExample)
* specimen = Reference(AvailableSpecimenForCompletedRequestsExample)

Instance: AvailableSpecimenForCompletedRequestsExample
InstanceOf: UATSpecimen
Usage: #example
Title: "Specimen - Used During Testing (Completed Order)"
Description: "The specimen associated with the lab order that was used during testing."
* identifier[USID].value = "abc123"
* identifier[USID].system = "http://moh.gov.bw/fhir/identifier/specimen-id"
* identifier[USID].type = http://terminology.hl7.org/CodeSystem/v2-0203#USID
* type = $SCT#119361006
* type.text = "Specimen Type"
* subject = Reference(GeneralPatientExample)
* collection.collectedDateTime = "2022-07-28"
* receivedTime = "2022-07-28"
* status = #available
* request = Reference(CompletedServiceRequestExample)

Instance: AvailableSpecimenForActiveRequestsExample
InstanceOf: UATSpecimen
Usage: #example
Title: "Specimen - Used During Testing (Order is Active)"
Description: "The specimen associated with the lab order that will be used during testing."
* identifier[USID].value = "abc123"
* identifier[USID].system = "http://moh.gov.bw/fhir/identifier/specimen-id"
* identifier[USID].type = http://terminology.hl7.org/CodeSystem/v2-0203#USID
* type = $SCT#119361006
* type.text = "Specimen Type"
* subject = Reference(GeneralPatientExample)
* collection.collectedDateTime = "2022-07-28"
* receivedTime = "2022-07-28"
* status = #available
* request = Reference(ActiveServiceRequestExample)

Instance: AvailableSpecimenForRevokedRequestExample
InstanceOf: UATSpecimen
Usage: #example
Title: "Specimen - Considered Ready For Testing"
Description: "The specimen associated with the lab order that was considered ready for testing but the service request was revoked."
* identifier[USID].value = "abc123"
* identifier[USID].system = "http://moh.gov.bw/fhir/identifier/specimen-id"
* identifier[USID].type = http://terminology.hl7.org/CodeSystem/v2-0203#USID
* type = $SCT#119361006
* type.text = "Specimen Type"
* subject = Reference(GeneralPatientExample)
* collection.collectedDateTime = "2022-07-28"
* receivedTime = "2022-07-28"
* status = #available
* request = Reference(RevokedServiceRequestExample)

Instance: UnsatisfactorySpecimenExample
InstanceOf: UATSpecimen
Usage: #example
Title: "Specimen - Unsatsifactory and Cannot be Used"
Description: "The specimen associated with the lab order is considered unsatisfactory by the lab technician and cannot be used for testing."
* identifier[USID].value = "abc123"
* identifier[USID].system = "http://moh.gov.bw/fhir/identifier/specimen-id"
* identifier[USID].type = http://terminology.hl7.org/CodeSystem/v2-0203#USID
* type = $SCT#119361006
* type.text = "Specimen Type"
* subject = Reference(GeneralPatientExample)
* collection.collectedDateTime = "2022-07-28"
* receivedTime = "2022-07-28"
* status = #unsatisfactory
* request = Reference(CompletedServiceRequestExample)

Instance: LabResultsDiagnosticReportExample
InstanceOf: UATDiagnosticReport
Usage: #example
Title: "Diagnostic Report - Lab Result"
Description: "Represents the results for the lab order."
* basedOn = Reference(CompletedServiceRequestExample)
* status = #final
* code.text = "Some Test Type"
* subject = Reference(GeneralPatientExample)
* encounter = Reference(GeneralEncounterExample)
* performer = Reference(GeneralPractitionerExample)
* result = Reference(TestResultExample)
* issued = "2022-07-28T13:28:17-05:00"

Instance: TestResultExample
InstanceOf: UATDiagnosticTestResultObservation
Usage: #example
Title: "Observation - Diagnostic Test Result"
Description: "Documents the patient's diagnostic test result."
* status = #final
* code.text = "Some code"
* subject = Reference(GeneralPatientExample)
* encounter = Reference(GeneralEncounterExample)
* effectiveDateTime = "2022-11-30"
* valueString = "Positive"
* performer = Reference(LaboratoryProviderExample)
* specimen = Reference(AvailableSpecimenForCompletedRequestsExample)

Instance: LabReportCompositionExample
InstanceOf: LabReportComposition
Usage: #example
Title: "Composition - Lab report"
Description: "Clinical document used to represent the results for a lab order"
* identifier.value = "PAT0001-v1"
* identifier.system = "http://moh.gov.bw/fhir/identifier/lab-report-document"
* status = #final
* subject = Reference(GeneralPatientExample)
* encounter = Reference(GeneralEncounterExample)
* type = $LNC#11502-2
* date = "2024-02-20"
* author[+] = Reference(GeneralPractitionerExample)
* author[+] = Reference(CurrentServiceProviderExample)
* title = "Lab Report Summary Document"

* section[sectionPractitioners][+].title = "List of practitioners section"
* section[sectionPractitioners][=].code = $LNC#LA9327-3
* section[sectionPractitioners][=].entry[practitioner][+] = Reference(GeneralPractitionerExample)
* section[sectionPractitioners][=].text.status = #generated
* section[sectionPractitioners][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Practitioner GeneralPractitionerExample</b></p><a name=\"GeneralPractitionerExample\"> </a><a name=\"hcGeneralPractitionerExample\"> </a><a name=\"GeneralPractitionerExample-en-US\"> </a><p><b>name</b>: Tom Junes Smith </p><p><b>telecom</b>: ph: 27537652509(Work), <a href=\"mailto:someone@something.org\">someone@something.org</a></p></div>"

* section[sectionServiceRequest][+].title = "Lab order summary section"
* section[sectionServiceRequest][=].code = $SCT#165332000
* section[sectionServiceRequest][=].entry[serviceRequest][+] = Reference(CompletedServiceRequestExample)
* section[sectionServiceRequest][=].text.status = #generated
* section[sectionServiceRequest][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: ServiceRequest CompletedServiceRequestExample</b></p><a name=\"CompletedServiceRequestExample\"> </a><a name=\"hcCompletedServiceRequestExample\"> </a><a name=\"CompletedServiceRequestExample-en-US\"> </a><p><b>identifier</b>: Placer Identifier/ORDER12345</p><p><b>status</b>: Completed</p><p><b>intent</b>: Order</p><p><b>code</b>: <span title=\"Codes:\">Some Test Type</span></p><p><b>subject</b>: <a href=\"Patient-GeneralPatientExample.html\">Mark Adams  Male, DoB: 2000-11-11 ( Medical record number)</a></p><p><b>encounter</b>: <a href=\"Encounter-GeneralEncounterExample.html\">Encounter: status = finished; class = observation encounter (ActCode#OBSENC); period = 2012-12-09 --&gt; 2012-12-09</a></p><p><b>occurrence</b>: 2012-01-05</p><p><b>requester</b>: <a href=\"Practitioner-GeneralPractitionerExample.html\">Practitioner Tom Junes Smith </a></p><p><b>performer</b>: <a href=\"Organization-LaboratoryProviderExample.html\">Organization Meshwalkiya Health Center</a></p><p><b>specimen</b>: <a href=\"Specimen-AvailableSpecimenForCompletedRequestsExample.html\">Specimen: identifier = Unique Specimen ID; status = available; type = Plasma specimen; receivedTime = 2022-07-28</a></p></div>"

* section[sectionTask][+].title = "Task summary section"
* section[sectionTask][=].code = $LNC#92235-1
* section[sectionTask][=].entry[task][+] = Reference(LabResultTaskExample)
* section[sectionTask][=].text.status = #generated
* section[sectionTask][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Task LabResultTaskExample</b></p><a name=\"LabResultTaskExample\"> </a><a name=\"hcLabResultTaskExample\"> </a><a name=\"LabResultTaskExample-en-US\"> </a><p><b>identifier</b>: Filler Identifier/ORDER12345</p><p><b>basedOn</b>: <a href=\"ServiceRequest-CompletedServiceRequestExample.html\">ServiceRequest </a></p><p><b>status</b>: Completed</p><p><b>intent</b>: order</p><p><b>executionPeriod</b>: 2022-07-28 --&gt; 2022-07-30</p><p><b>requester</b>: <a href=\"Organization-CurrentServiceProviderExample.html\">Organization Meshwalkiya Health Center</a></p><p><b>owner</b>: <a href=\"Organization-CurrentServiceProviderExample.html\">Organization Meshwalkiya Health Center</a></p><h3>Outputs</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Type</b></td><td><b>Value[x]</b></td></tr><tr><td style=\"display: none\">*</td><td><span title=\"Codes:\">Some Lab Result</span></td><td><a href=\"DiagnosticReport-LabResultsDiagnosticReportExample.html\">Diagnostic Report for '' for '-&gt;Mark Adams  Male, DoB: 2000-11-11 ( Medical record number)'</a></td></tr></table></div>"

* section[sectionSpecimen][+].title = "Specimen summary section"
* section[sectionSpecimen][=].code = $LNC#LP404274-5
* section[sectionSpecimen][=].entry[specimen][+] = Reference(AvailableSpecimenForCompletedRequestsExample)
* section[sectionSpecimen][=].text.status = #generated
* section[sectionSpecimen][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Specimen AvailableSpecimenForCompletedRequestsExample</b></p><a name=\"AvailableSpecimenForCompletedRequestsExample\"> </a><a name=\"hcAvailableSpecimenForCompletedRequestsExample\"> </a><a name=\"AvailableSpecimenForCompletedRequestsExample-en-US\"> </a><p><b>identifier</b>: Unique Specimen ID/abc123</p><p><b>status</b>: Available</p><p><b>type</b>: <span title=\"Codes:{http://snomed.info/sct 119361006}\">Specimen Type</span></p><p><b>subject</b>: <a href=\"Patient-GeneralPatientExample.html\">Mark Adams  Male, DoB: 2000-11-11 ( Medical record number)</a></p><p><b>receivedTime</b>: 2022-07-28</p><p><b>request</b>: <a href=\"ServiceRequest-CompletedServiceRequestExample.html\">ServiceRequest </a></p><h3>Collections</h3><table class=\"grid\"><tr><td style=\"display: none\">-</td><td><b>Collected[x]</b></td></tr><tr><td style=\"display: none\">*</td><td>2022-07-28</td></tr></table></div>"

* section[sectionObservations][+].title = "Lab results summary section"
* section[sectionObservations][=].code = $LNC#LP281480-6
* section[sectionObservations][=].entry[result][+] = Reference(TestResultExample)
* section[sectionObservations][=].text.status = #generated
* section[sectionObservations][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Observation TestResultExample</b></p><a name=\"TestResultExample\"> </a><a name=\"hcTestResultExample\"> </a><a name=\"TestResultExample-en-US\"> </a><p><b>status</b>: Final</p><p><b>category</b>: <span title=\"Codes:{http://terminology.hl7.org/CodeSystem/observation-category laboratory}\">Laboratory</span></p><p><b>code</b>: <span title=\"Codes:\">Some code</span></p><p><b>subject</b>: <a href=\"Patient-GeneralPatientExample.html\">Mark Adams  Male, DoB: 2000-11-11 ( Medical record number)</a></p><p><b>encounter</b>: <a href=\"Encounter-GeneralEncounterExample.html\">Encounter: status = finished; class = observation encounter (ActCode#OBSENC); period = 2012-12-09 --&gt; 2012-12-09</a></p><p><b>effective</b>: 2022-11-30</p><p><b>performer</b>: <a href=\"Organization-LaboratoryProviderExample.html\">Organization Meshwalkiya Health Center</a></p><p><b>value</b>: Positive</p><p><b>specimen</b>: <a href=\"Specimen-AvailableSpecimenForCompletedRequestsExample.html\">Specimen: identifier = Unique Specimen ID; status = available; type = Plasma specimen; receivedTime = 2022-07-28</a></p></div>"

* section[sectionDiagnosticReport][+].title = "Diagnostic report summary section"
* section[sectionDiagnosticReport][=].code = $LNC#LP420386-7
* section[sectionDiagnosticReport][=].entry[report][+] = Reference(LabResultsDiagnosticReportExample)
* section[sectionDiagnosticReport][=].text.status = #generated
* section[sectionDiagnosticReport][=].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: DiagnosticReport LabResultsDiagnosticReportExample</b></p><a name=\"LabResultsDiagnosticReportExample\"> </a><a name=\"hcLabResultsDiagnosticReportExample\"> </a><a name=\"LabResultsDiagnosticReportExample-en-US\"> </a><h2><span title=\"Codes:\">Some Test Type</span> (<span title=\"Codes:{http://loinc.org 11502-2}\">Laboratory report</span>) </h2><table class=\"grid\"><tr><td>Subject</td><td>No display for Patient </td></tr><tr><td>Reported</td><td>2022-07-28 13:28:17-0500</td></tr><tr><td>Performer</td><td> <a href=\"Practitioner-GeneralPractitionerExample.html\">Practitioner Tom Junes Smith </a></td></tr></table><p><b>Report Details</b></p><table class=\"grid\"><tr><td><b>Code</b></td><td><b>Value</b></td><td><b>Flags</b></td><td><b>When For</b></td></tr><tr><td><a href=\"Observation-TestResultExample.html\"><span title=\"Codes:\">Some code</span></a></td><td>Positive</td><td>Final</td><td>2022-11-30</td></tr></table></div>"
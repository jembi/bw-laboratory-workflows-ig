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
Title: "Service Request - Lab Order (Completd)"
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
Title: "Specimen - Used During Testing"
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
Title: "Specimen - Used During Testing"
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
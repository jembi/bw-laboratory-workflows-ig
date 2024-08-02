
Profile: UATServiceProvider
Parent: Organization
Id: uat-organization
Title: "Organization"
Description: "Organization providing health related services."
* identifier 1..*
* insert Slice(identifier, reasons why this should be supported, value, system, open, Slicing the identifier based on the system value, false)

* identifier contains
    MOHID 0..1 MS and
    HFUID 0..1 MS

* identifier[MOHID].value 1..1
* identifier[MOHID].system = "http://moh.gov.bw/fhir/identifier/mohid"

* identifier[HFUID].value 1..1
* identifier[HFUID].system = "http://moh.gov.bw/fhir/identifier/hfuid"

* active 1..1
* name 1..1

* type 1..*
* type from VSServiceProviderType (extensible)
* type.text 1..1

* address 1..1
* address.state 1..1
* address.city 1..1
* address.district 0..1
* address.line 0..* MS
* address.line ^definition =
    "reason(s) why this should be supported."

Profile: UATTargetFacilityEncounter
Parent: Encounter
Id: uat-target-facility-encounter
Title: "Encounter - Initiated By The Facility Providing the Service" 
Description: "Represents the current facility at which the patient is receiving health services."
* subject 1..1 
* subject only Reference(UATBwPatient)
* period 1..1
* period.start 1..1
* period.end 0..1 MS
* period.end ^definition = "reason(s) why this should be supported."
* serviceProvider 1..1
* serviceProvider only Reference(UATServiceProvider)

Profile: UATBwPatient
Parent: Patient
Id: uat-patient
Title: "Patient"
Description: "Is used to document demographics and other administrative information about an individual receiving care or other health-related services."
* identifier 1..*
* insert Slice(identifier, reasons why this should be supported, value, system, open, Slicing the identifier based on the system value, false)

* identifier contains
    MRN 0..1 MS and
    EMR-ID 0..1 MS

* identifier[MRN] ^definition = "reason(s) why this should be supported."
* identifier[MRN].value 1..1
* identifier[MRN].system = "http://moh.gov.bw/fhir/identifier/mrn"
* identifier[MRN].type = http://terminology.hl7.org/CodeSystem/v2-0203#MR

* identifier[EMR-ID] ^definition = "reason(s) why this should be supported."
* identifier[EMR-ID].value 1..1
* identifier[EMR-ID].system = "http://moh.gov.bw/fhir/identifier/emr-id"

* name 1..*
* name.given 1..*
* name.family 1..1

* gender 1..1
* birthDate 1..1
* maritalStatus 0..1 MS
* maritalStatus ^definition =
    "reason(s) why this should be supported."
* address 0..* MS
* address ^definition =
    "reason(s) why this should be supported."
* address.city 0..1 MS
* address.city ^definition =
    "reason(s) why this should be supported."
* address.line 0..* MS
* address.line ^definition =
    "reason(s) why this should be supported."
* address.district 0..1 MS
* address.district ^definition =
    "reason(s) why this should be supported."
* address.state 0..1 MS
* address.state ^definition =
    "reason(s) why this should be supported."

* telecom 0..* MS
* telecom ^definition =
    "reason(s) why this should be supported."

* managingOrganization 1..1
* managingOrganization only Reference(UATServiceProvider)

Profile: UATLabTask
Parent: Task
Id: uat-lab-order-task
Title: "Task - Lab Orders"
Description: "Assists with tracking the state of the lab order and its completion status."
* identifier 1..*

* insert Slice(identifier, reasons why this should be supported, value, system, open, Slicing identifier based on the system value, false)

* identifier contains
    FILL 1..1
  
* identifier[FILL].value 1..1
* identifier[FILL].system = "http://moh.gov.bw/fhir/identifier/task-id"
* identifier[FILL].type = http://terminology.hl7.org/CodeSystem/v2-0203#FILL

* basedOn only Reference(UATServiceRequest)
* statusReason 0..1 MS
* statusReason ^definition = "Indicates a reason to support the status. For example, why the lab order was cancelled or rejected"
* statusReason ^short = "Indicates a reason for the lab order being cancelled or rejected."
* statusReason from VSReasonForSampleCancellationOrRejection (extensible)
* intent = #order
* executionPeriod 1..1
* requester 1..1
* requester only Reference(UATPractitioner or UATServiceProvider)
* owner 1..1
* owner only Reference(UATPractitioner or UATServiceProvider)
* output 0..* MS
* output ^definition = "Indicates artifacts that are directly associated with the task. For example, the specimen used or the diagnostic report for successfully completed lab orders"
* output ^short = "Indicates artifacts directly associated with the task."
* output.type 1..1
* output.type.text 1..1
* output.valueReference 1..1
* output.valueReference only Reference(UATDiagnosticReport)

Profile: UATServiceRequest
Parent: ServiceRequest
Id: uat-lab-order-service-request
Title: "Service Request - Lab Orders"
Description: "Represents the service request for lab orders."
* identifier 1..*

* insert Slice(identifier, reasons why this should be supported, value, system, open, Slicing identifier based on the system value, false)

* identifier contains
    PLAC 1..1 

* identifier[PLAC].value 1..1
* identifier[PLAC].system = "http://moh.gov.bw/fhir/identifier/service-request-id"
* identifier[PLAC].type = http://terminology.hl7.org/CodeSystem/v2-0203#PLAC

* intent = #order
* code 1..1
* code.text 1..1
* subject 1..1
* subject only Reference(UATBwPatient)
* encounter 1..1
* encounter only Reference(UATTargetFacilityEncounter)
* occurrenceDateTime 1..1
* requester 1..1
* requester only Reference(UATPractitioner or UATServiceProvider)
* performer 1..*
* performer only Reference(UATPractitioner or UATServiceProvider)
* specimen 1..1

Profile: UATPractitioner
Parent: Practitioner
Id: uat-practitioner
Title: "Practitioner - General Practitioner"
Description: 
    "Represents the practitioner who participated in the health related service."
* name 1..*
* name.given 1..*
* name.family 1..1
* name.prefix 0..* MS
* name.prefix ^definition =
    "reason(s) why this should be supported."
* telecom 1..*

Profile: UATSpecimen
Parent: Specimen
Id: uat-specimen
Title: "Specimen - Lab Orders"
Description: "The specimen associated with the lab order."
* identifier 1..*

* insert Slice(identifier, reasons why this should be supported, value, system, open, Slicing identifier based on the system value, false)

* identifier contains
    USID 1..1
  
* identifier[USID].value 1..1
* identifier[USID].system = "http://moh.gov.bw/fhir/identifier/specimen-id"
* identifier[USID].type = http://terminology.hl7.org/CodeSystem/v2-0203#USID

* type 1..1
* type from VSSpecimenType (extensible)
* subject 1..1
* subject only Reference(UATBwPatient)
* request 1..1
* request only Reference(UATServiceRequest)
* collection 1..1
* collection.collected[x] only dateTime
* collection.collectedDateTime 1..1
* receivedTime 1..1

Profile: UATDiagnosticTestResultObservation
Parent: Observation
Id: uat-diagnostic-test-result-observation
Title: "Observation - Diagnostic Test Result"
Description: "Documents the patient's diagnostic test result."
* category 1..1
* category = http://terminology.hl7.org/CodeSystem/observation-category#laboratory
* code.text 1..1
* value[x] 1..1
* subject 1..1
* subject only Reference(UATBwPatient)
* encounter 1..1
* encounter only Reference(UATTargetFacilityEncounter)
* effectiveDateTime 1..1
* performer 1..*
* performer only Reference(UATServiceProvider or UATPractitioner)
* specimen 1..1
* specimen only Reference(UATSpecimen)

Profile: UATDiagnosticReport
Parent: DiagnosticReport
Id: uat-diagnostic-report
Title: "Diagnostic Report - Lab Result"
Description: "Represents the results for the lab order."
* category 1..1
* category = $LNC#11502-2
* code.text 1..1
* subject 1..1
* subject only Reference(UATBwPatient)
* encounter 1..1
* encounter only Reference(UATTargetFacilityEncounter)
* result 1..*
* result only Reference(UATDiagnosticTestResultObservation)
* issued 1..1
* basedOn 1..1
* basedOn only Reference(UATServiceRequest)
* performer 1..*
* performer only Reference(UATPractitioner or UATServiceProvider)

Profile: LabReportComposition
Parent: Composition
Id: lab-report-composition
Title: "Composition - Lab report"
Description: "Clinical document used to represent the outcome for a lab order and when applicable, with lab results."
* identifier.value 1..1
* identifier.system 1..1
* identifier.system = "http://moh.gov.bw/fhir/identifier/lab-report-document"
* status 1..1
* subject 1..1
* subject only Reference(UATBwPatient)
* encounter 1..1
* encounter only Reference(UATTargetFacilityEncounter)
* type 1..1
* type = $LNC#11502-2
* date 1..1
* author 1..*
* author only Reference(UATPractitioner or UATServiceProvider)
* title 1..1
* section 1..*

* insert Slice(section, reasons why this should be supported, value, code, open, Slicing sections based on the code value, false)

* section contains
    sectionPractitioners 1..1 and
    sectionServiceRequest 1..1 and
    sectionTask 1..1 and
    sectionSpecimen 1..1 and
    sectionObservations 0..1 MS and
    sectionDiagnosticReport 0..1 MS

* section[sectionObservations] ^definition =
    "reason(s) why this should be supported."

* section[sectionDiagnosticReport] ^definition =
    "reason(s) why this should be supported."

* insert CompositionEntry(Practitioner, UATPractitioner, sectionPractitioners, $LNC#LA9327-3, List of practitioners section, practitioner, 
    Practitioners relevant for the scope of the lab report, This lists the practitioners relevant for the scope of the lab report., 1..*)

* insert CompositionEntry(ServiceRequest, UATServiceRequest, sectionServiceRequest, $SCT#165332000, Lab order summary section, serviceRequest, 
    Lab order relevant for the scope of the lab report, This lists the lab order relevant for the scope of the lab report., 1..1)

* insert CompositionEntry(Task, UATLabTask, sectionTask, $LNC#92235-1, Task summary section, task, 
    Task relevant for the scope of the lab report, This lists the task that is relevant for the scope of the lab report., 1..1)

* insert CompositionEntry(Specimen, UATSpecimen, sectionSpecimen, $LNC#LP404274-5, Specimen summary section, specimen, 
    Specimen relevant for the scope of the lab report, This lists the specimen relevant for the scope of the lab report., 1..1)

* insert CompositionEntry(Observation, UATDiagnosticTestResultObservation, sectionObservations, $LNC#LP281480-6, Lab results summary section, result, 
    Lab results relevant for the scope of the lab report, This lists the lab results relevant for the scope of the lab report., 1..*)

* insert CompositionEntry(DiagnosticReport, UATDiagnosticReport, sectionDiagnosticReport, $LNC#LP420386-7, Diagnostic report summary section, report, 
    Diagnostic report relevant for the scope of the lab report, This lists the diagnostic report relevant for the scope of the lab report., 1..1)
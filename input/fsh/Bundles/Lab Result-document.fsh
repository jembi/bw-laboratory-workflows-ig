Instance: lab-result-document-bundle
InstanceOf: Bundle
Usage: #example
Description: "Bundle - Lab Result (Document)"
Title: "Lab order has been completed"
* type = #document
* timestamp = "2024-02-18T09:30:00+02:00"
* identifier.value = "Lab-Report-12345"
* identifier.system = "http://moh.gov.bw/fhir/identifier/lab-report"

* insert ExampleDocumentEntry(LabReportCompositionExample, Composition)

* insert ExampleDocumentEntry(GeneralPatientExample, Patient)
* insert ExampleDocumentEntry(GeneralEncounterExample, Encounter)
* insert ExampleDocumentEntry(GeneralPractitionerExample, Practitioner)
* insert ExampleDocumentEntry(CurrentServiceProviderExample, Organization)
* insert ExampleDocumentEntry(LaboratoryProviderExample, Organization)
* insert ExampleDocumentEntry(LabResultTaskExample, Task)
* insert ExampleDocumentEntry(AvailableSpecimenForCompletedRequestsExample, Specimen)
* insert ExampleDocumentEntry(CompletedServiceRequestExample, ServiceRequest)
* insert ExampleDocumentEntry(LabResultsDiagnosticReportExample, DiagnosticReport)
* insert ExampleDocumentEntry(TestResultExample, Observation)
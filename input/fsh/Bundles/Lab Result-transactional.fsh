Instance: lab-result-transactional-bundle
InstanceOf: Bundle
Usage: #example
Description: "Bundle - Lab Result (Transactional)"
Title: "Lab order has been completed"
* type = #transaction

* insert ExampleTransactionalEntry(LabResultTaskExample, Task)
* insert ExampleTransactionalEntry(AvailableSpecimenForCompletedRequestsExample, Specimen)
* insert ExampleTransactionalEntry(CompletedServiceRequestExample, ServiceRequest)
* insert ExampleTransactionalEntry(LabResultsDiagnosticReportExample, DiagnosticReport)
* insert ExampleTransactionalEntry(TestResultExample, Observation)
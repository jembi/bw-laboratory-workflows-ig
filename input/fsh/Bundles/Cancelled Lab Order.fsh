Instance: cancelled-lab-order-bundle
InstanceOf: Bundle
Usage: #example
Description: "Bundle - Cancelled Lab Order"
Title: "Lab order has been cancelled"
* type = #transaction

* insert ExampleTransactionalEntry(LabOrderCancellationTaskExample, Task)
* insert ExampleTransactionalEntry(AvailableSpecimenForRevokedRequestExample, Specimen)
* insert ExampleTransactionalEntry(RevokedServiceRequestExample, ServiceRequest)
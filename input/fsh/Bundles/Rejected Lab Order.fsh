Instance: rejected-lab-order-bundle
InstanceOf: Bundle
Usage: #example
Description: "Bundle - Rejected Lab Order"
Title: "Lab order has been rejected"
* type = #transaction

* insert ExampleTransactionalEntry(LabOrderRejectionTaskExample, Task)
* insert ExampleTransactionalEntry(AvailableSpecimenForCompletedRequestsExample, Specimen)
* insert ExampleTransactionalEntry(CompletedServiceRequestExample, ServiceRequest)
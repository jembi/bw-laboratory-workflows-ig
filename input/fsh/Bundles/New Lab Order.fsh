Instance: lab-order-bundle
InstanceOf: Bundle
Usage: #example
Description: "Bundle - Lab Order"
Title: "Submit new lab orders"
* type = #transaction

* insert ExampleTransactionalEntry(LabOrderTaskExample, Task)
* insert ExampleTransactionalEntry(AvailableSpecimenForActiveRequestsExample, Specimen)
* insert ExampleTransactionalEntry(ActiveServiceRequestExample, ServiceRequest)
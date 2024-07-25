Alias: $SCT = http://snomed.info/sct
Alias: $LNC = http://loinc.org

ValueSet: VSReasonForSampleCancellationOrRejection
Id: vs-reason-sample-cancelled-or-rejected
Title: "Reasons why a lab order was cancelled or rejected"
Description: "Reasons why a lab order was cancelled or rejected."
* ^experimental = false
* $SCT#441510007 "Blood specimen with anticoagulant" 
* $SCT#123840003 "Sample contaminated"
* $SCT#397933008 "Equipment error/failure"
* $SCT#281264009 "Inappropriate bottle or container for sample"
* $SCT#281268007 "Insufficient sample"
* $SCT#281265005 "Sample incorrectly labeled"
* $SCT#419182006 "Supplies not available"

ValueSet: VSServiceProviderType
Id: vs-service-provider
Title: "Service Providers"
Description: "Code used for representing the classification of organizations providing health services."
* ^experimental = false
* $SCT#276052003 "Public facilities"
* $SCT#394794000 "Health clinic managed by voluntary or private agents"
* $SCT#185483006 "Outreach clinic"
* $SCT#310391008 "Community clinic"
* $SCT#257622000 "Healthcare facility"
* $SCT#45899008 "Free-standing laboratory facility"

ValueSet: VSSpecimenType
Id: vs-specimen-type
Title: "Specimen Type Used In Viral Load testing"
Description:  "A list of specimen types."
* ^experimental = false
* $SCT#119361006 "Plasma specimen"
* $SCT#440500007 "Dried blood spot specimen"
* $SCT#441620008 "Oral fluid specimen"
* $SCT#258580003 "Whole blood specimen"
* $SCT#119364003 "Serum specimen"
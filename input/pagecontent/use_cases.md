

### USE CASES

#### USE CASE NAME: CAPTURING LAB ORDERS

ACTORS: Clinician

DEPENDENCIES:

- Availability of PIMS

DESCRIPTION:
> Clinician login the system and access the lab module. Clinician then enters Lab specimen details using a lab form available in the lab module.

PRE CONDITION:

1: User successfully logs in to the system

ORDINARY SEQUENCE:

    Steps:

        2: Log into the system.
        3: Access the Laboratory module.
        4: Enter specimen details in lab order form available in the lab module.
        5: Save the order details.
        6: Send the lab order details to SHR

POST CONDITION:

- Data successfully pushed to the interoperability layer

EXCEPTIONS:

    Steps:
    
        3: Where the patient does not exist, the clinician creates the patient before paturing the order.
        6: System caches the lab order details when there is network failure and resend late

ASSUMPTIONS:
- PIMS is hosted in the facility with access to the operability layer.
- The lab order form is sent to the laboratory with the specimen.
- The specimen ID is attached to the container with the specimen


COMMENTS:
<br />
<br />
<br />

#### USE CASE NAME: LAB ORDER RESULTING
<br />

ACTOR/s: Laboratory technicians 
<br />

Dependencies:
- Received specimen with order form

Description:
> The use case enables laboratory technicians to enter lab order details into IPMS at the laboratory facility 

Pre-condition:

    1: User successfully logs in to the system 

Ordinary sequence

Step:
     Action
    
    2: Access the Lab Order component/module
    3: Access lab order details in to IPMS
    4: Update order details with lab test results
    5: Save the updated lab test results.

Post-condition

- Lab order results synchronized to SHR

Assumptions

> Some orders will be entered directly in to IPMS at the facility
Exceptions

Step:

    Action
      2: Enter/Capture the lab order


Comments


#### USE CASE NAME: RETIEVING LAB TEST RESULTS

ACTOR/s:  Clinicians 

DEPENDENCIES:

- Up to date synchronization of the SHR.

DESCRIPTION:

> This use case enables clinicians to retrieve lab order results at the facility and have the option to print out the results.

PRE-CONDITION:
> 1. Log into the system

Ordinary sequence

STEPS:

    > ACTIONS:

> 2. Access the Lab Order module
> 3. Search lab test results using lab order ID or Patient ID.
> 4. Open the selected results and consult with the patient
> 5. Print results out (optional)

POST-CONDITION:

 - Lab results received by the clinician.

ASSUMPTIONS:

- Lab test results can also be queried from the pool using a combination of patient identifiers.

EXCEPTIONS:

STEP/s:

    > ACTIONS

 > 2. Access the results using the client module

<br />
Comments
<br />
<br />
<br />


#### USE CASE NAME: TRANSMISSION OF LABORATORY RESULTS
<br />
ACTOR:
PIMS, IPMS, OpenHIM, SHR, OpenCR
<br />
<br />
DEPENDENCIES:

Active connection to interoperability layer 

DESCRIPTION:

>An interoperability layer facilitates information exchange of clinical laboratory orders between the electronic medical record and the laboratory information system, via the longitudinal record system (SHR). 

PRE-CONDITION:

>Queries are sent between interfacing systems and the interoperability layer to update and store new data.

Ordinary sequence

Steps:

Actions:

    1. PIMS/IPMS send captured orders to the interoperability layer and store them in the SHR
    2. MFL update the facility information in the SHR
    3. Patient demographic data is queried from the omang system as well as the deaths and births register.
    4. Updated lab order details with results are received by the interoperability layer and stored in the SHR
    5. PIMS pings the interoperability layer for lab test results
    6. Available results in the SHR are pulled to PIMS.

POST-CONDITION:

- Lab orders, lab test results, facility information and patient information updated and stored in the SHR.

ASSUMPTIONS:

- Each and every order that is created is assigned an identifier by IPMS.
- Lab orders are assigned identifiers by the system.
- No data is pushed to IPMS from SHR, only a pull is allowed

EXCEPTIONS:

Steps:

    Actions:
    6. Unidentifiable orders and order results sent to the interoperability layer are rejected


COMMENTS

<br />
<br />
<br />

### USE CASE DIAGRAM
<br />
<br />


<img src="captureLabOrders.png" alt="drawing" style="width: 80%; margin: 0 10%;"/>
<br />
<br />
<br />
<img src="retrieveLabOrders.png" alt="drawing" style="width: 80%; margin: 0 10%;"/>
<br />
<br />
<br />


<img src="dataTransmissionLayer.png" alt="drawing" style="width: 80%; margin: 0 10%;"/>
<br />
<br />
<br />

<img src="LabOrderResulting.png" alt="drawing" style="width: 80%; margin: 0 10%;"/>
<br />
<br />
<br />

<img src="retrieveLabResults.png" alt="drawing" style="width: 80%; margin: 0 10%;"/>

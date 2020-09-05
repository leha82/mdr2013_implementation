-- 4.3.3.1	References from Administered_Item Table
ALTER TABLE Administered_Item ADD CONSTRAINT administered_item_is_a_registered_item FOREIGN KEY (id) REFERENCES Registered_Item (id) ON DELETE CASCADE;
ALTER TABLE Administered_Item ADD CONSTRAINT stewardship FOREIGN KEY (stewardship_record) REFERENCES Stewardship_Record (id);

-- 4.3.3.2	References from Attached_Item Table
ALTER TABLE Attached_Item ADD CONSTRAINT attached_item_is_a_registered_item FOREIGN KEY (id) REFERENCES Registered_Item (id) ON DELETE CASCADE;
ALTER TABLE Attached_Item ADD CONSTRAINT attachment FOREIGN KEY (owner) REFERENCES Administered_Item (id) ON DELETE CASCADE;

-- 4.3.3.3	References from Contact Table
ALTER TABLE Contact ADD CONSTRAINT contact_individual FOREIGN KEY (individual) REFERENCES Individual (id);
ALTER TABLE Contact ADD CONSTRAINT contact_organization FOREIGN KEY (organization) REFERENCES Organization (id);
ALTER TABLE Contact ADD CONSTRAINT contact_role FOREIGN KEY (role) REFERENCES Role (id);

-- 4.3.3.4	A reference from Context Table
ALTER TABLE Context ADD CONSTRAINT context_is_an_item FOREIGN KEY (id) REFERENCES Item (id);

-- 4.3.3.5	References from Definition Table
ALTER TABLE Definition ADD CONSTRAINT definition_language FOREIGN KEY (attr_language) REFERENCES Language_Identification (id);
ALTER TABLE Definition ADD CONSTRAINT definition_source FOREIGN KEY (source) REFERENCES Reference_Document (id);
ALTER TABLE Definition ADD CONSTRAINT item_definition FOREIGN KEY (item) REFERENCES Designatable_Item (id) ON DELETE CASCADE;
ALTER TABLE Definition ADD CONSTRAINT definition_designation_pairing FOREIGN KEY (definition_heading) REFERENCES Designation (id);

-- 4.3.3.6	References from Definition_Context Table
ALTER TABLE Definition_Context ADD CONSTRAINT definition_context_scope FOREIGN KEY (attr_scope) REFERENCES Context (id);
ALTER TABLE Definition_Context ADD CONSTRAINT definition_context_relevant_definition FOREIGN KEY (relevant_definition) REFERENCES Definition (id);

-- 4.3.3.7	A reference from Designatable_Item Table
ALTER TABLE Designatable_Item ADD CONSTRAINT item_designatable_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;

-- 4.3.3.8	References from Designation Table
ALTER TABLE Designation ADD CONSTRAINT designation_language FOREIGN KEY (attr_language) REFERENCES Language_Identification (id);
ALTER TABLE Designation ADD CONSTRAINT item_designator FOREIGN KEY (item) REFERENCES Designatable_Item (id) ON DELETE CASCADE;
ALTER TABLE Designation ADD CONSTRAINT designation_definition_pairing FOREIGN KEY (specific_definition) REFERENCES Definition (id);

-- 4.3.3.9	References from Designation_Context Table
ALTER TABLE Designation_Context ADD CONSTRAINT designation_context_scope FOREIGN KEY (attr_scope) REFERENCES Context (id);
ALTER TABLE Designation_Context ADD CONSTRAINT designation_context_relevant_designation FOREIGN KEY (relevant_designation) REFERENCES Designation (id);

-- 4.3.3.10	References from Designation_Namespace Table
ALTER TABLE Designation_Namespace ADD CONSTRAINT designation_namespace_included_designation FOREIGN KEY (included_designation) REFERENCES Designation (id) ON DELETE CASCADE;
ALTER TABLE Designation_Namespace ADD CONSTRAINT designation_namespace_namespace FOREIGN KEY (namespace) REFERENCES Namespace (id) ON DELETE CASCADE;

-- 4.3.3.11	A reference from Identified_Item Table
ALTER TABLE Identified_Item ADD CONSTRAINT item_identified_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;

-- 4.3.3.12	References from Namespace Table
ALTER TABLE Namespace ADD CONSTRAINT namespace_naming_authority FOREIGN KEY (naming_authority) REFERENCES Organization (id);
ALTER TABLE Namespace ADD CONSTRAINT namespace_maintainer FOREIGN KEY (maintainer) REFERENCES Registration_Authority (id);

-- 4.3.3.13	References from Naming_Convention_Conformance Table
ALTER TABLE Naming_Convention_Conformance ADD CONSTRAINT conformant_designation FOREIGN KEY (conformant_designation) REFERENCES Designation (id);
ALTER TABLE Naming_Convention_Conformance ADD CONSTRAINT convention FOREIGN KEY (convention) REFERENCES Naming_Convention (id);

-- 4.3.3.14	References from Naming_Convention_Utilization Table
ALTER TABLE Naming_Convention_Utilization ADD CONSTRAINT utilization FOREIGN KEY (utilization) REFERENCES Namespace (id);
ALTER TABLE Naming_Convention_Utilization ADD CONSTRAINT acceptance_convention FOREIGN KEY (acceptable_convention) REFERENCES Naming_Convention (id);

-- 4.3.3.15	References from Reference Table
ALTER TABLE Reference ADD CONSTRAINT reference_document_reference FOREIGN KEY (document_reference) REFERENCES Reference_Document (id);
ALTER TABLE Reference ADD CONSTRAINT reference_referencing_item FOREIGN KEY (referencing_item) REFERENCES Registered_Item (id);

-- 4.3.3.16	References from Reference_Document Table
ALTER TABLE Reference_Document ADD CONSTRAINT reference_document_document_type FOREIGN KEY (document_type) REFERENCES Document_Type (id);
ALTER TABLE Reference_Document ADD CONSTRAINT reference_document_notation FOREIGN KEY (notation) REFERENCES Notation (id);

-- 4.3.3.17	A reference from Registered_Item Table
ALTER TABLE Registered_Item ADD CONSTRAINT registered_item_is_an_identified_item FOREIGN KEY (id) REFERENCES Identified_Item (id) ON DELETE CASCADE;

-- 4.3.3.18	References from Registrar Table
ALTER TABLE Registrar ADD CONSTRAINT registrar_is_a_contact FOREIGN KEY (id) REFERENCES Contact (id) ON DELETE CASCADE;
ALTER TABLE Registrar ADD CONSTRAINT registration_authority_registrar FOREIGN KEY (authority) REFERENCES Registration_Authority (id);

-- 4.3.3.19	References from Registration Table
ALTER TABLE Registration ADD CONSTRAINT registration_authority FOREIGN KEY (authority) REFERENCES Registration_Authority (id);
ALTER TABLE Registration ADD CONSTRAINT registration_administered_item FOREIGN KEY (administered_item) REFERENCES Administered_Item (id);
ALTER TABLE Registration ADD CONSTRAINT registration_state FOREIGN KEY (state) REFERENCES Registration_State (id);

-- 4.3.3.20	References from Registration_Authority Table
ALTER TABLE Registration_Authority ADD CONSTRAINT registration_authority_is_an_organization FOREIGN KEY (id) REFERENCES Organization (id) ON DELETE CASCADE;
ALTER TABLE Registration_Authority ADD CONSTRAINT registration_authority_registration_namespace FOREIGN KEY (registration_namespace) REFERENCES Namespace (id);
ALTER TABLE Registration_Authority ADD CONSTRAINT registration_authority_registration_authority_identifier FOREIGN KEY (registration_authority_identifier) REFERENCES Registration_Authority_Identifier (id);

-- 4.3.3.21	A reference from Registration_State Table
ALTER TABLE Registration_State ADD CONSTRAINT previous_state FOREIGN KEY (previous_state) REFERENCES Registration_State (id);

-- 4.3.3.22	References from Registry_Specification Table
ALTER TABLE Registry_Specification ADD CONSTRAINT registry_specification_primary_language FOREIGN KEY (primary_language) REFERENCES Language_Identification (id);
ALTER TABLE Registry_Specification ADD CONSTRAINT registry_specification_representation_class_scheme FOREIGN KEY (representation_class_scheme) REFERENCES Concept_System (id);
ALTER TABLE Registry_Specification ADD CONSTRAINT registry_specification_context FOREIGN KEY (context) REFERENCES Context (id);

-- 4.3.3.23	References from Scoped_Identifier Table
ALTER TABLE Scoped_Identifier ADD CONSTRAINT identifier_scope FOREIGN KEY (attr_scope) REFERENCES Namespace (id) ON DELETE CASCADE;
ALTER TABLE Scoped_Identifier ADD CONSTRAINT identification FOREIGN KEY (identified_item) REFERENCES Identified_Item (id);

-- 4.3.3.24	A reference from Slot Table
ALTER TABLE Slot ADD CONSTRAINT item_slot FOREIGN KEY (item) REFERENCES Identified_Item (id);

-- 4.3.3.25	References from Stewardship_Record Table
ALTER TABLE Stewardship_Record ADD CONSTRAINT stewardship_record_organization FOREIGN KEY (organization) REFERENCES Organization (id);
ALTER TABLE Stewardship_Record ADD CONSTRAINT stewardship_record_contact FOREIGN KEY (contact) REFERENCES Contact (id);

-- 4.3.3.26	References from Submission Table
ALTER TABLE Submission ADD CONSTRAINT submission_submitted_item FOREIGN KEY (submitted_item) REFERENCES Registered_Item (id);
ALTER TABLE Submission ADD CONSTRAINT submission_submission_record FOREIGN KEY (submission_record) REFERENCES Submission_Record (id);

-- 4.3.3.27	References from Submission_Record Table
ALTER TABLE Submission_Record ADD CONSTRAINT submission_record_organization FOREIGN KEY (organization) REFERENCES Organization (id);
ALTER TABLE Submission_Record ADD CONSTRAINT submission_record_contact FOREIGN KEY (contact) REFERENCES Contact (id);

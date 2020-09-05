-- 4.4.3.1	References from Assertion_Concept Table

ALTER TABLE Assertion_Concept ADD CONSTRAINT assertion_concept_concept FOREIGN KEY (concept) REFERENCES Concept (id);
ALTER TABLE Assertion_Concept ADD CONSTRAINT assertion_concept_assertion_about FOREIGN KEY (assertion_about) REFERENCES CLS_Assertion (id);

-- 4.4.3.2	References from Assertion_Inclusion Table

ALTER TABLE Assertion_Inclusion ADD CONSTRAINT assertion_inclusion_assertor FOREIGN KEY (assertor) REFERENCES Concept_System (id);
ALTER TABLE Assertion_Inclusion ADD CONSTRAINT assertion_inclusion_included_assertion FOREIGN KEY (included_assertion) REFERENCES CLS_Assertion (id);

-- 4.4.3.3	A reference from Classifiable_Item Table

ALTER TABLE Classifiable_Item ADD CONSTRAINT item_classifiable_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;

-- 4.4.3.4	References from Classification Table

ALTER TABLE Classification ADD CONSTRAINT classification_classified_item FOREIGN KEY (classified_item) REFERENCES Classifiable_Item (id);
ALTER TABLE Classification ADD CONSTRAINT classification_classifier FOREIGN KEY (classifier) REFERENCES Concept (id);

-- 4.4.3.5	References from Classification_Scheme Table

ALTER TABLE Classification_Scheme ADD CONSTRAINT classification_scheme_scheme FOREIGN KEY (scheme) REFERENCES Concept_System (id);
ALTER TABLE Classification_Scheme ADD CONSTRAINT classification_scheme_classification FOREIGN KEY (classification) REFERENCES Classification (id);

-- 4.4.3.6	A reference from CLS_Assertion Table

ALTER TABLE CLS_Assertion ADD CONSTRAINT assertion_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;

-- 4.4.3.7	References from Concept Table

ALTER TABLE Concept ADD CONSTRAINT concept_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;
ALTER TABLE Concept ADD CONSTRAINT concept_source FOREIGN KEY (source) REFERENCES Concept_System (id) ON DELETE CASCADE;

-- 4.4.3.8	References from Conceptual_Domain Table

ALTER TABLE Conceptual_Domain ADD CONSTRAINT cd_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;
ALTER TABLE Conceptual_Domain ADD CONSTRAINT cd_dimensionality FOREIGN KEY (dimensionality) REFERENCES Dimensionality (id);

-- 4.4.3.9	References from Concept_System Table

ALTER TABLE Concept_System ADD CONSTRAINT concept_system_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;
ALTER TABLE Concept_System ADD CONSTRAINT concept_system_notation FOREIGN KEY (notation) REFERENCES Notation (id);

-- 4.4.3.10	References from Concept_System_Membership Table

ALTER TABLE Concept_System_Membership ADD CONSTRAINT csm_including_concept_system FOREIGN KEY (including_concept_system) REFERENCES Concept_System (id);
ALTER TABLE Concept_System_Membership ADD CONSTRAINT csm_member_concept FOREIGN KEY (member_concept) REFERENCES Concept (id);

-- 4.4.3.11	References from Concept_System_Reference Table

ALTER TABLE Concept_System_Reference ADD CONSTRAINT csr_referencing_concept_system FOREIGN KEY (referencing_concept_system) REFERENCES Concept_System (id);
ALTER TABLE Concept_System_Reference ADD CONSTRAINT csr_referenced_concept_system FOREIGN KEY (referenced_concept_system) REFERENCES Concept_System (id);

-- 4.4.3.12	References from Data_Element Table

ALTER TABLE Data_Element ADD CONSTRAINT de_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;
ALTER TABLE Data_Element ADD CONSTRAINT data_element_meaning FOREIGN KEY (meaning) REFERENCES Data_Element_Concept (id);
ALTER TABLE Data_Element ADD CONSTRAINT data_element_domain FOREIGN KEY (domain) REFERENCES Value_Domain (id);
ALTER TABLE Data_Element ADD CONSTRAINT de_derivation FOREIGN KEY (derivation) REFERENCES Data_Element_Derivation (id);

-- 4.4.3.13	References from Data_Element_Concept Table

ALTER TABLE Data_Element_Concept ADD CONSTRAINT dec_object_class FOREIGN KEY (object_class) REFERENCES Object_Class (id);
ALTER TABLE Data_Element_Concept ADD CONSTRAINT dec_property FOREIGN KEY (property) REFERENCES Property (id);
ALTER TABLE Data_Element_Concept ADD CONSTRAINT dec_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;

-- 4.4.3.14	References from Data_Element_Concept_Domain Table

ALTER TABLE Data_Element_Concept_Domain ADD CONSTRAINT dec_domain_usage FOREIGN KEY (dec_usage) REFERENCES Data_Element_Concept (id);
ALTER TABLE Data_Element_Concept_Domain ADD CONSTRAINT dec_domain_domain FOREIGN KEY (domain) REFERENCES Conceptual_Domain (id);

-- 4.4.3.15	References from Data_Element_Derivation Table

ALTER TABLE Data_Element_Derivation ADD CONSTRAINT de_derivation_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;
ALTER TABLE Data_Element_Derivation ADD CONSTRAINT derivation_rule_application FOREIGN KEY (rule) REFERENCES Derivation_Rule (id);

-- 4.4.3.16	A reference from Data_Element_Example Table

ALTER TABLE Data_Element_Example ADD CONSTRAINT de_example_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;

-- 4.4.3.17	References from Datatype Table

ALTER TABLE Datatype ADD CONSTRAINT datatype_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;
ALTER TABLE Datatype ADD CONSTRAINT datatype_scheme_reference FOREIGN KEY (scheme_reference) REFERENCES Reference_Document (id);

-- 4.4.3.18	References from Derivation_Input Table

ALTER TABLE Derivation_Input ADD CONSTRAINT derivation_input_inputter FOREIGN KEY (inputter) REFERENCES Data_Element_Derivation (id);
ALTER TABLE Derivation_Input ADD CONSTRAINT derivation_input_input FOREIGN KEY (input) REFERENCES Data_Element (id);

-- 4.4.3.19	References from Derivation_Rule Table

ALTER TABLE Derivation_Rule ADD CONSTRAINT derivation_rule_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;
ALTER TABLE Derivation_Rule ADD CONSTRAINT derivation_rule_notation FOREIGN KEY (notation) REFERENCES Notation (id);

-- 4.4.3.20	A reference from Dimensionality Table

ALTER TABLE Dimensionality ADD CONSTRAINT dimensionality_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;

-- 4.4.3.21	References from Dimensionality_Measure_Class Table

ALTER TABLE Dimensionality_Measure_Class ADD CONSTRAINT dmc_dimensionality FOREIGN KEY (dimensionality) REFERENCES Dimensionality (id);
ALTER TABLE Dimensionality_Measure_Class ADD CONSTRAINT dmc_applicable_units FOREIGN KEY (applicable_units) REFERENCES Measure_Class (id);

-- 4.4.3.22	References from Exemplification Table

ALTER TABLE Exemplification ADD CONSTRAINT exemplification_example FOREIGN KEY (example) REFERENCES Data_Element_Example (id);
ALTER TABLE Exemplification ADD CONSTRAINT exemplification_exhibitor FOREIGN KEY (exhibitor) REFERENCES Data_Element (id);

-- 4.4.3.23	References from Link Table

ALTER TABLE Link ADD CONSTRAINT link_is_an_assertion FOREIGN KEY (id) REFERENCES CLS_Assertion (id) ON DELETE CASCADE;
ALTER TABLE Link ADD CONSTRAINT link_relation FOREIGN KEY (relation) REFERENCES Relation (id);

-- 4.4.3.24	References from Link_End Table

ALTER TABLE Link_End ADD CONSTRAINT link_end_role FOREIGN KEY (role) REFERENCES Relation_Role (id);
ALTER TABLE Link_End ADD CONSTRAINT link_end_concept FOREIGN KEY (concept) REFERENCES Concept (id);
ALTER TABLE Link_End ADD CONSTRAINT link_has_link_end FOREIGN KEY (link) REFERENCES Link (id) ON DELETE CASCADE;

-- 4.4.3.25	A reference from Measure_Class Table

ALTER TABLE Measure_Class ADD CONSTRAINT measure_class_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;

-- 4.4.3.26	A reference from Object_Class Table

ALTER TABLE Object_Class ADD CONSTRAINT object_class_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;

-- 4.4.3.27	References from Permissible_Value Table

ALTER TABLE Permissible_Value ADD CONSTRAINT permissible_value_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;
ALTER TABLE Permissible_Value ADD CONSTRAINT permissible_value_meaning FOREIGN KEY (meaning) REFERENCES Value_Meaning (id);

-- 4.4.3.28	References from Permissible_Value_Set Table

ALTER TABLE Permissible_Value_Set ADD CONSTRAINT permissible_value_set_member FOREIGN KEY (attr_member) REFERENCES Permissible_Value (id);
ALTER TABLE Permissible_Value_Set ADD CONSTRAINT permissible_value_set_containing_domain FOREIGN KEY (containing_domain) REFERENCES Value_Domain (id);

-- 4.4.3.29	A reference from Property Table

ALTER TABLE Property ADD CONSTRAINT property_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;

-- 4.4.3.30	A reference from Relation Table

ALTER TABLE Relation ADD CONSTRAINT relation_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;

-- 4.4.3.31	References from Relation_Role Table

ALTER TABLE Relation_Role ADD CONSTRAINT relation_role_set FOREIGN KEY (source) REFERENCES Relation (id) ON DELETE CASCADE;
ALTER TABLE Relation_Role ADD CONSTRAINT relation_role_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;

-- 4.4.3.32	A reference from Unit_of_Measure Table

ALTER TABLE Unit_of_Measure ADD CONSTRAINT unit_of_measure_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;

-- 4.4.3.33	References from Unit_of_Measure_Class Table

ALTER TABLE Unit_of_Measure_Class ADD CONSTRAINT uomc_measure_class FOREIGN KEY (measure_class) REFERENCES Measure_Class (id);
ALTER TABLE Unit_of_Measure_Class ADD CONSTRAINT uomc_member_unit FOREIGN KEY (member_unit) REFERENCES Unit_of_Measure (id);

-- 4.4.3.34	References from Value_Domain Table

ALTER TABLE Value_Domain ADD CONSTRAINT vd_is_an_item FOREIGN KEY (id) REFERENCES Item (id) ON DELETE CASCADE;
ALTER TABLE Value_Domain ADD CONSTRAINT value_domain_meaning FOREIGN KEY (meaning) REFERENCES Conceptual_Domain (id);
ALTER TABLE Value_Domain ADD CONSTRAINT vd_datatype FOREIGN KEY (datatype) REFERENCES Datatype (id);
ALTER TABLE Value_Domain ADD CONSTRAINT vd_unit_of_measure FOREIGN KEY (unit_of_measure) REFERENCES Unit_of_Measure (id);

-- 4.4.3.35	References from Value_Domain_Subset Table

ALTER TABLE Value_Domain_Subset ADD CONSTRAINT vd_subset_superdomain FOREIGN KEY (superdomain) REFERENCES Value_Domain (id);
ALTER TABLE Value_Domain_Subset ADD CONSTRAINT vd_subset_subdomain FOREIGN KEY (subdomain) REFERENCES Value_Domain (id);


-- 4.4.3.36	A reference from Value_Meaning Table

ALTER TABLE Value_Meaning ADD CONSTRAINT value_meaning_is_a_concept FOREIGN KEY (id) REFERENCES Concept (id) ON DELETE CASCADE;

-- 4.4.3.37	References from Value_Meaning_Set Table

ALTER TABLE Value_Meaning_Set ADD CONSTRAINT value_meaning_set_containing_domain FOREIGN KEY (containing_domain) REFERENCES Conceptual_Domain (id);
ALTER TABLE Value_Meaning_Set ADD CONSTRAINT value_meaning_set_member FOREIGN KEY (attr_member) REFERENCES Value_Meaning (id);

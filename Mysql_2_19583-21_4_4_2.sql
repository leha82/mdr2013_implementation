-- 4.4.2.1	Assertion_Concept Table
CREATE TABLE Assertion_Concept
(
  concept INTEGER NOT NULL,
  assertion_about INTEGER NOT NULL,
  PRIMARY KEY (concept,assertion_about)
);


-- 4.4.2.2	Assertion_Inclusion Table
CREATE TABLE Assertion_Inclusion
(
  assertor INTEGER NOT NULL,
  included_assertion INTEGER NOT NULL,
  PRIMARY KEY (assertor, included_assertion)
);

-- 4.4.2.3	Classifiable_Item
CREATE TABLE Classifiable_Item
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
);

-- 4.4.2.4	Classification Table
CREATE TABLE Classification
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  classified_item INTEGER,
  classifier INTEGER,
  PRIMARY KEY (id)
);

-- 4.4.2.5	Classification_Scheme Table
CREATE TABLE Classification_Scheme
(
  scheme INTEGER NOT NULL,
  classification INTEGER NOT NULL,
  PRIMARY KEY (scheme,classification)
);

-- 4.4.2.6	CLS_Assertion Table
CREATE TABLE CLS_Assertion
(
  id INTEGER NOT NULL,
  formula TEXT,
  PRIMARY KEY (id)
);

-- 4.4.2.7	Concept Table
CREATE TABLE Concept
(
  id INTEGER NOT NULL,
  source INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.8	Concept_System Table
CREATE TABLE Concept_System
(
  id INTEGER NOT NULL,
  notation INTEGER,
  PRIMARY KEY (id)
);

-- 4.4.2.9	Concept_System_Membership Table
CREATE TABLE Concept_System_Membership
(
  including_concept_system INTEGER NOT NULL,
  member_concept INTEGER NOT NULL,
  PRIMARY KEY (including_concept_system, member_concept)
);

-- 4.4.2.10	Concept_System_Reference Table
CREATE TABLE Concept_System_Reference
(
  referencing_concept_system INTEGER NOT NULL,
  referenced_concept_system INTEGER NOT NULL,
  csr_type INTEGER CHECK (csr_type IN (1,2)),
  PRIMARY KEY (referencing_concept_system, referenced_concept_system)
);

-- 4.4.2.11	Conceptual_Domain Table
CREATE TABLE Conceptual_Domain
(
  id INTEGER NOT NULL,
  dimensionality INTEGER,
  cd_type INTEGER CHECK (cd_type IN (1,2)),
  description TEXT,
  PRIMARY KEY (id)
);

-- 4.4.2.12	Data_Element Table
CREATE TABLE Data_Element
(
  id INTEGER NOT NULL,
  meaning INTEGER NOT NULL,
  domain INTEGER NOT NULL,
  de_precision INTEGER,
  derivation INTEGER,
  PRIMARY KEY (id)
);

-- 4.4.2.13	Data_Element_Concept Table
CREATE TABLE Data_Element_Concept
(
  id INTEGER NOT NULL,
  object_class INTEGER,
  property INTEGER,
  PRIMARY KEY (id)
);

-- 4.4.2.14	Data_Element_Concept_Domain Table
CREATE TABLE Data_Element_Concept_Domain
(
  dec_usage INTEGER NOT NULL,
  domain INTEGER NOT NULL,
  PRIMARY KEY (dec_usage, domain)
);

-- 4.4.2.15	Data_Element_Derivation Table
CREATE TABLE Data_Element_Derivation
(
  id INTEGER NOT NULL,
  rule INTEGER,
  PRIMARY KEY (id)
);

-- 4.4.2.16	Data_Element_Example Table
CREATE TABLE Data_Element_Example
(
  id INTEGER NOT NULL,
  example_item TEXT NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.17	Datatype Table
CREATE TABLE Datatype
(
  id INTEGER NOT NULL,
  name CHARACTER VARYING(2000) NOT NULL,
  description TEXT NOT NULL,
  scheme_reference INTEGER NOT NULL,
  annotation TEXT,
  PRIMARY KEY (id)
);

-- 4.4.2.18	Derivation_Input Table
CREATE TABLE Derivation_Input 
(
  inputter INTEGER NOT NULL,
  input INTEGER NOT NULL,
  PRIMARY KEY (inputter,input)
);

-- 4.4.2.19	Derivation_Rule Table
CREATE TABLE Derivation_Rule
(
  id INTEGER NOT NULL,
  specification TEXT NOT NULL,
  notation INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.20	Dimensionality Table
CREATE TABLE Dimensionality
(
  id INTEGER NOT NULL,
  coordinate_indicator BOOLEAN,
  PRIMARY KEY (id)
);

-- 4.4.2.21	Dimensionality_Measure_Class Table
CREATE TABLE Dimensionality_Measure_Class
(
  dimensionality INTEGER NOT NULL,
  applicable_units INTEGER NOT NULL,
  PRIMARY KEY (dimensionality, applicable_units)
);

-- 4.4.2.22	Exemplification Table
CREATE TABLE Exemplification
(
  example INTEGER NOT NULL,
  exhibitor INTEGER NOT NULL,
  PRIMARY KEY (example,exhibitor)
);

-- 4.4.2.23	Link Table
CREATE TABLE Link
(
  id INTEGER NOT NULL,
  relation INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.24	Link_End Table
CREATE TABLE Link_End
(
  id INTEGER NOT NULL AUTO_INCREMENT,
  concept INTEGER NOT NULL,
  link INTEGER NOT NULL,
  role INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.25	Measure_Class Table
CREATE TABLE Measure_Class
(
  id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.26	Object_Class Table
CREATE TABLE Object_Class
(
  id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.27	Permissible_Value Table
CREATE TABLE Permissible_Value
(
  id INTEGER NOT NULL,
  permitted_value CHARACTER VARYING(1000) NOT NULL,
  begin_date Datetime NOT NULL,
  end_date Datetime,
  meaning INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.28	Permissible_Value_Set Table
CREATE TABLE Permissible_Value_Set
(
  attr_member INTEGER NOT NULL,
  containing_domain INTEGER NOT NULL,
  PRIMARY KEY (attr_member, containing_domain)
);

-- 4.4.2.29	Property Table
CREATE TABLE Property
(
  id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.30	Relation Table
CREATE TABLE Relation
(
  id INTEGER NOT NULL,
  arity INTEGER,
  reflexivity INTEGER CHECK (reflexivity IN (1,2,3)),
  symmetry INTEGER CHECK (symmetry IN (1,2,3)),
  transitivity INTEGER CHECK (transitivity IN (1,2,3)),
  PRIMARY KEY (id)
);

-- 4.4.2.31	Relation_Role Table
CREATE TABLE Relation_Role
(
  id INTEGER NOT NULL,
  source INTEGER NOT NULL,
  multiplicity INTEGER,
  ordinal INTEGER,
  PRIMARY KEY (id)
);

-- 4.4.2.32	Unit_of_Measure Table
CREATE TABLE Unit_of_Measure
(
  id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.33	Unit_of_Measure_Class Table
CREATE TABLE Unit_of_Measure_Class
(
  measure_class INTEGER NOT NULL,
  member_unit INTEGER NOT NULL,
  PRIMARY KEY (measure_class, member_unit)
);

-- 4.4.2.34	Value_Domain Table
CREATE TABLE Value_Domain
(
  id INTEGER NOT NULL,
  datatype INTEGER NOT NULL,
  maximum_character_quantity INTEGER,
  format CHARACTER VARYING(2000),
  unit_of_measure INTEGER,
  vd_type INTEGER CHECK (vd_type IN (1,2)),
  description TEXT,
  meaning INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.4.2.35	Value_Domain_Subset Table
CREATE TABLE Value_Domain_Subset
(
  superdomain INTEGER NOT NULL,
  subdomain INTEGER NOT NULL,
  PRIMARY KEY (superdomain, subdomain)
);

-- 4.4.2.36	Value_Meaning Table
CREATE TABLE Value_Meaning
(
  id INTEGER NOT NULL,
  begin_date Datetime NOT NULL,
  end_date Datetime,
  PRIMARY KEY (id)
);

-- 4.4.2.37	Value_Meaning_Set Table
CREATE TABLE Value_Meaning_Set
(
  containing_domain INTEGER NOT NULL,
  attr_member INTEGER NOT NULL,
  PRIMARY KEY (containing_domain, attr_member)
);

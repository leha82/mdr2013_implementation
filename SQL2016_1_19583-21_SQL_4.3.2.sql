-- 4.3.2.1	Administered_Item Table

CREATE TABLE Administered_Item
(
  id INTEGER NOT NULL,
  creation_date TIMESTAMP NOT NULL,
  last_change_date TIMESTAMP,
  change_description CHARACTER LARGE OBJECT,
  explanatory_comment CHARACTER LARGE OBJECT,
  origin CHARACTER LARGE OBJECT,
  stewardship_record INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.3.2.2	Attached_Item Table

CREATE TABLE Attached_Item
(
  id INTEGER NOT NULL,
  owner INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.3.2.4	Contact Table

CREATE TABLE Contact
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  individual INTEGER,
  organization INTEGER NOT NULL,
  role INTEGER,
  PRIMARY KEY (id)
);

-- 4.3.2.5	Context Table

CREATE TABLE Context
(
  id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.3.2.6	Definition Table

CREATE TABLE Definition
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  text CHARACTER LARGE OBJECT NOT NULL,
  attr_language INTEGER,
  source INTEGER,
  item INTEGER NOT NULL,
  definition_heading INTEGER,
  PRIMARY KEY (id),
  UNIQUE (definition_heading)
);

-- 4.3.2.7	Definition_Context Table

CREATE TABLE Definition_Context
(
  attr_scope INTEGER NOT NULL,
  relevant_definition INTEGER NOT NULL,
  acceptability INTEGER CHECK (acceptability IN (1,2,3,4,5)),
  PRIMARY KEY (attr_scope, relevant_definition)
);

-- 4.3.2.8	Designatable_Item Table

CREATE TABLE Designatable_Item
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY (id)
);

-- 4.3.2.9	Designation Table

CREATE TABLE Designation
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  sign CHARACTER VARYING(1000) NOT NULL,
  attr_language INTEGER,
  item INTEGER NOT NULL,
  specific_definition INTEGER,
  PRIMARY KEY (id),
  UNIQUE (specific_definition)
);


-- 4.3.2.10	Designation_Context Table

CREATE TABLE Designation_Context
(
  attr_scope INTEGER NOT NULL,
  relevant_designation INTEGER NOT NULL,
  acceptability INTEGER CHECK (acceptability IN (1,2,3,4,5)),
  PRIMARY KEY (attr_scope, relevant_designation)
);

-- 4.3.2.11	Designation_Namespace Table

CREATE TABLE Designation_Namespace
(
  namespace INTEGER NOT NULL,
  included_designation INTEGER NOT NULL,
  PRIMARY KEY (namespace, included_designation)
);

-- 4.3.2.12	Document_Type Table

CREATE TABLE Document_Type
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  identifier CHARACTER(40),
  description CHARACTER LARGE OBJECT,
  scheme_reference CHARACTER VARYING(1000),
  PRIMARY KEY (id)
);

-- 4.3.2.13	Identified_Item Table

CREATE TABLE Identified_Item
(
  id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.3.2.14	Individual Table

CREATE TABLE Individual
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  name CHARACTER VARYING(1000),
  title CHARACTER VARYING(1000),
  mail_address CHARACTER VARYING(1000),
  email_address CHARACTER VARYING(4000),
  phone_number CHARACTER VARYING(4000),
  role CHARACTER VARYING(4000),
  PRIMARY KEY (id)
);


-- 4.3.2.15	Item Table

CREATE TABLE Item
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  PRIMARY KEY (id)
);

-- 4.3.2.16	Language_Identification Table

CREATE TABLE Language_Identification
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  language_identifier CHARACTER(40) NOT NULL,
  script_identifier CHARACTER(40),
  geopolitical_territory_identifier CHARACTER(40),
  variant_identifier CHARACTER VARYING(4000),
  extension_identifier CHARACTER VARYING(4000),
  private_use_qualifier CHARACTER VARYING(2000),
  PRIMARY KEY (id)
);


-- 4.3.2.17	Namespace Table

CREATE TABLE Namespace
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  naming_authority INTEGER,
  one_name_per_item_indicator BOOLEAN,
  one_item_per_name_indicator BOOLEAN,
  mandatory_naming_convention_indicator BOOLEAN,
  shorthand_prefix CHARACTER VARYING(2000),
  scheme_reference CHARACTER VARYING(1000),
  maintainer INTEGER,
  PRIMARY KEY (id),
  UNIQUE (maintainer)
);

-- 4.3.2.18	Naming_Convention Table

CREATE TABLE Naming_Convention
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  scope_rule CHARACTER LARGE OBJECT NOT NULL,
  authority_rule CHARACTER LARGE OBJECT NOT NULL,
  semantic_rule CHARACTER LARGE OBJECT NOT NULL,
  syntactic_rule CHARACTER LARGE OBJECT NOT NULL,
  lexical_rule CHARACTER LARGE OBJECT NOT NULL,
  PRIMARY KEY (id)
);

-- 4.3.2.19	Naming_Convention_Conformance Table

CREATE TABLE Naming_Convention_Conformance
(
  conformant_designation INTEGER NOT NULL,
  convention INTEGER NOT NULL,
  PRIMARY KEY (conformant_designation, convention)
);

-- 4.3.2.20	Naming_Convention_Utilization Table

CREATE TABLE Naming_Convention_Utilization
(
  utilization INTEGER NOT NULL,
  acceptable_convention INTEGER NOT NULL,
  PRIMARY KEY (utilization, acceptable_convention)
);

-- 4.3.2.21	Notation Table

CREATE TABLE Notation
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  notation CHARACTER VARYING(1000),
  PRIMARY KEY (id)
);

-- 4.3.2.22	Organization Table

CREATE TABLE Organization
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  name CHARACTER VARYING(4000) NOT NULL,
  mail_address CHARACTER VARYING(1000),
  email_address CHARACTER VARYING(4000),
  phone_number CHARACTER VARYING(4000),
  uri CHARACTER VARYING(2000),
  PRIMARY KEY (id)
);


-- 4.3.2.23	Reference Table

CREATE TABLE Reference
(
  document_reference INTEGER NOT NULL,
  referencing_item INTEGER NOT NULL,
  type CHARACTER VARYING(2000),
  PRIMARY KEY (document_reference, referencing_item)
);

-- 4.3.2.24	Reference_Document Table

CREATE TABLE Reference_Document
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  identifier CHARACTER(40) NOT NULL,
  document_type INTEGER NOT NULL,
  attr_language CHARACTER VARYING(4000),
  notation INTEGER,
  title CHARACTER LARGE OBJECT,
  provider CHARACTER VARYING(4000),
  uri CHARACTER VARYING(2000),
  PRIMARY KEY (id)
);

-- 4.3.2.25	Registered_Item Table

CREATE TABLE Registered_Item
(
  id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.3.2.26	Registrar Table

CREATE TABLE Registrar
(
  id INTEGER NOT NULL,
  identifier CHARACTER(40) NOT NULL,
  authority INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.3.2.27	Registration Table

CREATE TABLE Registration
(
  authority INTEGER NOT NULL,
  administered_item INTEGER NOT NULL,
  state INTEGER NOT NULL,
  PRIMARY KEY (authority, administered_item)
);

-- 4.3.2.28	Registration_Authority Table

CREATE TABLE Registration_Authority
(
  id INTEGER NOT NULL,
  registration_authority_identifier INTEGER NOT NULL,
  document_language_identifier CHARACTER VARYING(4000),
  registration_namespace INTEGER,
  PRIMARY KEY (id),
  UNIQUE (registration_namespace)
);

-- 4.3.2.29	Registration_Authority_Identifier Table

CREATE TABLE Registration_Authority_Identifier
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  international_code_designator CHARACTER VARYING(2000) NOT NULL,
  organization_identifier CHARACTER(40) NOT NULL,
  organization_part_identifier CHARACTER(40),
  OPI_source CHARACTER VARYING(2000),
  PRIMARY KEY (id)
);

-- 4.3.2.30	Registration_State Table

CREATE TABLE Registration_State
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  registration_status CHARACTER VARYING(2000) NOT NULL,
  effective_date TIMESTAMP NOT NULL,
  until_date TIMESTAMP,
  administrative_note CHARACTER LARGE OBJECT,
  unresolved_issue CHARACTER LARGE OBJECT,
  administrative_status CHARACTER VARYING(2000),
  previous_state INTEGER,
  PRIMARY KEY (id)
);

-- 4.3.2.31	Registry_Specification Table

CREATE TABLE Registry_Specification
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  name CHARACTER VARYING(1000) NOT NULL,
  comment CHARACTER LARGE OBJECT,
  web_address CHARACTER VARYING(2000),
  standard CHARACTER VARYING(2000) NOT NULL,
  conformance_level CHARACTER VARYING(2000) NOT NULL,
  primary_language INTEGER,
  character_repertoire CHARACTER VARYING(2000) NOT NULL,
  reference_document_identifier_form CHARACTER VARYING(2000) NOT NULL,
  representation_class_scheme INTEGER,
  context INTEGER,
  PRIMARY KEY (id)
);

-- 4.3.2.32	Role Table

CREATE TABLE Role
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  title CHARACTER VARYING(1000),
  mail_address CHARACTER VARYING(1000),
  email_address CHARACTER VARYING(4000),
  phone_number CHARACTER VARYING(4000),
  PRIMARY KEY (id)
);

-- 4.3.2.33	Scoped_Identifier Table

CREATE TABLE Scoped_Identifier
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  identifier CHARACTER(40) NOT NULL,
  version CHARACTER VARYING(2000) NOT NULL,
  full_expansion CHARACTER VARYING(2000),
  shorthand_expansion CHARACTER VARYING(2000),
  attr_scope INTEGER NOT NULL,
  identified_item INTEGER,
  PRIMARY KEY (id)
);

-- 4.3.2.34	Slot Table

CREATE TABLE Slot
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  name CHARACTER VARYING(2000) NOT NULL,
  attr_value CHARACTER VARYING(4000),
  type CHARACTER VARYING(2000),
  item INTEGER NOT NULL,
  PRIMARY KEY (id)
);


-- 4.3.2.35	Stewardship_Record Table

CREATE TABLE Stewardship_Record
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  organization INTEGER NOT NULL,
  contact INTEGER NOT NULL,
  PRIMARY KEY (id)
);

-- 4.3.2.36	Submission Table

CREATE TABLE Submission
(
  submitted_item INTEGER NOT NULL,
  submission_record INTEGER NOT NULL,
  PRIMARY KEY (submitted_item, submission_record)
);

-- 4.3.2.37	Submission_Record Table

CREATE TABLE Submission_Record
(
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
  organization INTEGER NOT NULL,
  contact INTEGER NOT NULL,
  PRIMARY KEY (id)
);


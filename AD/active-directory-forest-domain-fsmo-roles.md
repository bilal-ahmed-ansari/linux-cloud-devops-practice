# Active Directory - Forest, Domain and FSMO Roles

## 1. Forest

A **Forest** is the top-level structure in Active Directory.

A forest can contain:

- One or more Domains
- Parent Domain
- Child Domains

Example:

```text
Forest
   |
   +-- Root Domain
   |      |
   |      +-- Child Domain 1
   |      |
   |      +-- Child Domain 2
   |
   +-- Other Domains

Example:

Forest: azure.online

Root Domain:
azure.online

Child Domain:
hr.azure.online

2. Domain

A Domain is a logical group of computers, users, servers and other resources.

A Domain is managed by a Domain Controller (DC).

Example:

Domain: azure.online

Users
Computers
Servers
Groups
Policies
      |
      v
Domain Controller

The Domain Controller manages authentication and other Active Directory services.

3. Domain Controller (DC)

A Domain Controller is a Windows Server that has the Active Directory Domain Services (AD DS) role installed.

It is responsible for things like:

User authentication
Computer authentication
User and computer accounts
Group Policy
Active Directory database
Domain management

Example:

Domain: azure.online

        Domain Controller
              |
       +------+------+
       |             |
     Users        Computers

4. Root Domain and Child Domain

A Root Domain is the first domain created in a forest.

A Child Domain is a domain created under another domain.

Example:

Forest: azure.online
          |
          +-- Root Domain
          |      azure.online
          |
          +-- Child Domain
                 hr.azure.online

Here:

azure.online
      |
      └── hr.azure.online

hr.azure.online is a child domain of azure.online.

5. FSMO Roles

FSMO stands for:

Flexible Single Master Operations

Active Directory has 5 FSMO roles.

These roles are divided into:

a) 2 Forest-level roles
b) 3 Domain-level roles

6. Forest-Level FSMO Roles

There are 2 forest-level roles.

1. Schema Master

The Schema Master controls changes to the Active Directory schema.

The schema defines what types of objects and attributes can exist in Active Directory.

Example:

Schema Master
      |
      +-- Defines AD object structure
      |
      +-- User attributes
      +-- Computer attributes
      +-- Group attributes

There is only one Schema Master in a forest.

2. Domain Naming Master

The Domain Naming Master manages adding and removing domains in the forest.

Example:

Forest
  |
  +-- azure.online
  |
  +-- hr.azure.online
  |
  +-- finance.azure.online

When adding or removing a domain from the forest, the Domain Naming Master is involved.

There is only one Domain Naming Master in a forest.

7. Domain-Level FSMO Roles

There are 3 domain-level FSMO roles.

3. RID Master

RID stands for Relative Identifier.

The RID Master helps Domain Controllers provide unique IDs to security principals such as:

Users
Groups
Computers

4. PDC Emulator

PDC stands for Primary Domain Controller.

The PDC Emulator has several important responsibilities.

For example:


Password change handling
Account lockout processing
Some Group Policy operations

Example:

Domain
  |
  +-- PDC Emulator
          |
          +-- Password changes
          +-- Account lockout

There is one PDC Emulator per domain.

5. Infrastructure Master

The Infrastructure Master is responsible for updating references to objects from other domains.

It is mainly important in environments that contain multiple domains.

Example:

Domain A
   |
   | references
   v
Domain B

The Infrastructure Master helps keep these cross-domain references updated.

There is one Infrastructure Master per domain.

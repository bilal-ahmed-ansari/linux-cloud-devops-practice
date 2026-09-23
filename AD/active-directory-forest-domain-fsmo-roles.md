=> Active Directory - Forest, Domain and FSMO Roles

1. Forest

A Forest is the top-level structure in Active Directory.

A forest can contain:

- One or more Domains
- Parent Domain
- Child Domains

Forest
   |
   +-- Root Domain
   |      |
   |      +-- Child Domain 1
   |      |
   |      +-- Child Domain 2
   |
   +-- Other Domains

=> Example:

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

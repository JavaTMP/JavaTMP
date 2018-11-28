---
title: Role-Based Access Control Design
---
# Role-Based Access Control Design

Role-based access control is a way to provide authentication and authorization because it only allows authorized users
to access information they need to do their jobs, while preventing them from accessing additional information
that is not relevant to them. An user's role determines the permissions he or she is granted
and ensures that lower level users are not able to access sensitive information or perform high-level tasks.

Within an organization, roles are created for various job functions.
The permissions to perform certain operations are assigned to specific roles.
Users or Group of users are assigned particular roles, and through those role assignments acquire
the permissions needed to perform particular system functions. Since users are not assigned permissions directly,
but only acquire them through their role (or roles), management of individual user rights becomes
a matter of simply assigning appropriate roles to the user's account;
this simplifies common operations, such as adding a user, or changing a user's department.

Access management for resources is a critical function for any organization.
Role-based access control (RBAC) helps you manage who has access to resources,
what they can do with those resources, and what areas they have access to.

The way you control access to resources using RBAC is to create role assignments.
it’s how permissions are enforced. A role assignment consists of three elements: principal, role, and module.

### Entity Definitions
The main entities of RBAC system are:
- Operation, Function or Action. Things that users can do with the resource. Like create, read, update, delete, print, email or share.
Actions are important because they’re the verbs in the “can user X do Y to object Z” question.
Certain actions will apply to all types, such as read/write/delete, but others will only apply to specific types
- Role. Collection of actions that users can have. like manager, admin, supervisor or editor.
A role lists the operations that can be performed, such as read, write, and delete.
Roles conceptually represent a named collection of permissions.
Roles can be high-level, like owner, or specific, like reader.
System should include several built-in roles that you can use like Owner, Reader, Manager or Administrator.
- Module. Entity/resource type in your application on which certain actions can be performed on.
A module could be a User, a Membership, a Product, accounting, billing or resource type module.
Each of these modules come with a set of operations, functions or actions which are pre-defined by the module,
e.g actions to create a user, activate users etc. These actions get installed along with the modules
into the applications database table called 'action'.
Module is the boundary that the access applies to. When you assign a role,
you can further limit the actions allowed by defining a module.
This is helpful if you want to make someone an administrator on one module but a reader on another module.
- Resource. Thing that users can manipulate. Like instance of contract, user, document or module.
- User. An individual who has a profile in the system with username and password.
- Group. A set of users. When you assign a role to a group, all users within that group have that role.
- Principal. A principal is an object that represents a user or a group.
- Permission. A mapping involving User, Role and module.
A role assignment is the process of binding a role definition to a user or group principal
on a particular module for the purpose of granting access to specific resources.
Access is granted by creating a role assignment, and access is revoked by removing a role assignment.
- Deny assignments. A deny assignment binds a set of deny actions to a user or group principal
on a particular module for the purpose of denying access to resource.
A role assignment defines a set of actions that are allowed,
while a deny assignment defines a set of actions that not allowed.
In other words, deny assignments block users from performing specified actions
even if a role assignment grants them access.
Deny assignments take precedence over role assignments.

### Main Features
The main feature of RBAC system are:
- A user must be assigned a certain role in order to exercise a certain action, called a permission.
- Permission authorization allows the user to perform certain action.
- All access is controlled through roles that people are given, which is a set of actions.
This role determines what permissions he or she is granted.
- A principal can have multiple roles.
- A role can have multiple principals.
- A role can have many actions.
- An action can be assigned to many roles.
- An user can belong to multiple groups.
- A group can have many users.
- A group can have many groups but only one parent group.
- It will answer the question "does user X have permission to perform action Y ?".

### Permission Types
There are three types of permissions:
- “row”: a regular row-level permission.
- “table”: a permission granted upon a table itself, as opposed to its contents.
For example, “create” action cannot be applied to a row, because a row has to exist for a permission to apply to it.
“create” can be granted upon a table, which allows a user to create a row in that table.
- “global”: a permission granted on all rows in a given table existed or not yet.
For example, User Auditor Group should be able to view details for every user which might be hidden from other users.
A single global permission in the ACL can grant this.

### Implementation
We will implement a role-based access control to enforce row-level privileges on every row in the database
and providing a table-level control too.
- Create a RBAC database schema.
- Populate RBAC database schema with metadata and a set of actions for each module or type.
- Implement a way to determine whether a user can take an action.
- Implement standard RBAC reports. like:
    - All object permissions. shows you every permission a given user has on an object.
    - All table permissions shows you every permission a given user has on a table.
    - All ACL entries shows you all ACL entries defined for a particular row.
    - All actionable rows shows you all rows a user can take a particular action on.

## References
- [Role-based access control](https://en.wikipedia.org/wiki/Role-based_access_control)
- [A Role-Based Access Control (RBAC) system for PHP](https://www.tonymarston.net/php-mysql/role-based-access-control.html)
- [Role Based Access Control in PHP](https://www.sitepoint.com/role-based-access-control-in-php/)
- [Role-Based Access Control Design](https://stackoverflow.com/questions/28157798/is-my-role-based-access-control-a-feasible-solution/28159647#28159647)
- [How to Build Role-Based Access Control in SQL](https://www.xaprb.com/blog/2006/08/16/how-to-build-role-based-access-control-in-sql/)
- [Role-Based Access Control in SQL, Part 2](https://www.xaprb.com/blog/2006/08/18/role-based-access-control-in-sql-part-2/)
- [What is role-based access control (RBAC)?](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview)
- [How to design role based access control?](https://softwareengineering.stackexchange.com/questions/348636/how-to-design-role-based-access-control)
- [High Level Design of Role Based Access Controller](https://cwiki.apache.org/confluence/display/SQOOP/High+Level+Design+of+Role+Based+Access+Controller)
- [Implement Access Control in Node.js](https://blog.nodeswat.com/implement-access-control-in-node-js-8567e7b484d1)
- [How to design a hierarchical role based access control system](https://stackoverflow.com/questions/16139712/how-to-design-a-hierarchical-role-based-access-control-system)
- []()
- []()

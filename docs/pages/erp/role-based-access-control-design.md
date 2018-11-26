---
title: Role-Based Access Control Design
---
# Role-Based Access Control Design

Role-based access control is a way to provide authentication and authorization because it only allows authorized users
to access information they need to do their jobs, while preventing them from accessing additional information
that is not relevant to them. An user's role determines the permissions he or she is granted
and ensures that lower level users are not able to access sensitive information or perform high-level tasks.

In our RBAC Design, there are three rules:
- A user must be assigned a certain role in order to conduct a certain action, called a transaction.
- A user needs a role authorization to be allowed to hold that role.
- Permission authorization allows the user to perform certain action.
The permission has to be allowed to occur through the role membership.
Users won’t be able to perform action permission other than the ones they are authorized for.
All access is controlled through roles that people are given, which is a set of permissions.
An user's role determines what permissions he or she is granted.

Access management for resources is a critical function for any organization.
Role-based access control (RBAC) helps you manage who has access to resources,
what they can do with those resources, and what areas they have access to.

The way you control access to resources using RBAC is to create role assignments.
it’s how permissions are enforced. A role assignment consists of three elements: principal, role, and module.

### Principal
A security principal is an object that represents a user, group.
- User. An individual who has a profile in the system with username and password.
- Group. A set of users. When you assign a role to a group, all users within that group have that role.

### Role
A role is a collection of permissions. A role lists the operations that can be performed,
such as read, write, and delete. Roles can be high-level, like owner, or specific, like reader.
System should include several built-in roles that you can use. The following lists four fundamental built-in roles:
- Owner. Has full access to all resources including the right to delegate access to others.
- Reader. Can view existing resources.
- Manager. Has full access to resource.
- Administrator. Lets you manage user access to resources.

### Module
Module is the boundary that the access applies to. When you assign a role,
you can further limit the actions allowed by defining a module.
This is helpful if you want to make someone an administrator on module and a reader on another module.

### Role assignments
A role assignment is the process of binding a role definition to a user or group principal
at a particular module for the purpose of granting access to specific resources.
Access is granted by creating a role assignment, and access is revoked by removing a role assignment.

### Deny assignments
A deny assignment binds a set of deny actions to a user or group principal
on a particular module for the purpose of denying access to resource.
A role assignment defines a set of actions that are allowed,
while a deny assignment defines a set of actions that not allowed.
In other words, deny assignments block users from performing specified actions
even if a role assignment grants them access.
Deny assignments take precedence over role assignments.

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
- []()
- []()
- []()

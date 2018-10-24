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
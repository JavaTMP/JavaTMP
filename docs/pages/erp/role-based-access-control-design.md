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
- []()
- []()
- []()
- []()
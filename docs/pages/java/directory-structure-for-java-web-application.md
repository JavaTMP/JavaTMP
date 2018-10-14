---
title: Directory Structure For Java Web Application
---
## Directory Structure For Java Web Application
The directory structure is the most important thing encountered by a developer when browsing source code.
Everything flows from it. Everything depends on it. It is clearly one of the most important aspects of the source code.
So, the first question in building an application is "How do I divide it up into packages?".
For typical business applications, there seems to be two ways of answering this question.

### Package By Feature or Module
Package-by-feature uses packages to reflect the feature set.
It tries to place all items related to a single feature (and only that feature) into a single directory/package.
This results in packages with high cohesion and high modularity, and with minimal coupling between packages.
Items that work closely together are placed next to each other. They aren't spread out all over the application.
It's also interesting to note that, in some cases, deleting a feature can reduce to a single operation - deleting a directory.
(Deletion operations might be thought of as a good test for maximum modularity: an item has maximum modularity only
if it can be deleted in a single operation.)

In package-by-feature, the package names correspond to important, high-level aspects of the problem domain.
For example, a javatmp web application might have these packages:
```
com.javatmp.country
com.javatmp.dms
com.javatmp.cms
com.javatmp.user
com.javatmp.mvc
com.javatmp.util
```

Each package usually contains only the items related to that particular feature, and no other feature.
For example, the com.javatmp.user package might contain these items:
- CreateUserController.java - an action or controller object
- User.java - a Model Object
- UserService.java - Data Access And Service Object
- database items (SQL statements)
- user interface items (JSP, JS, and CSS files)

It's important to note that a package can contain not just Java code, but other files as well.
Indeed, in order for package-by-feature to really work as desired, all items related to a given feature -
from user interface, to Java code, to database items - must be placed in a single directory dedicated to that feature
(and only that feature).

In some cases, a feature/package will not be used by any other feature in the application.
If that's the case, it may be removed simply by deleting the directory.
If it is indeed used by some other feature, then its removal will not be as simple as a single delete operation.

That is, the package-by-feature idea does not imply that one package can never use items belonging to other packages.
Rather, package-by-feature aggressively prefers package-private as the default scope,
and only increases the scope of an item to public only when needed.

### Package By Layer
The competing package-by-layer style is different. In package-by-layer, the highest level packages reflect
the various application "layers", instead of features, as in:
```
com.javatmp.domain
com.javatmp.mvc
com.javatmp.service
com.javatmp.web
com.javatmp.util
```

Here, each feature has its implementation spread out over multiple directories,
over what might be loosely called "implementation categories".
Each directory contains items that usually aren't closely related to each other.
This results in packages with low cohesion and low modularity, with high coupling between packages.
As a result, editing a feature involves editing files across different directories. In addition,
deleting a feature can almost never be performed in a single operation.

### Use Package By Feature
For typical business applications, the package-by-feature style seems to be the superior of the two:

**Higher Modularity**
Package-by-feature has packages with high cohesion, high modularity, and low coupling between packages.

**Easier Code Navigation**
Maintenance programmers need to do a lot less searching for items,
since all items needed for a given task are usually in the same directory.
Some tools that encourage package-by-layer use package naming conventions to ease the problem of tedious code navigation.
However, package-by-feature transcends the need for such conventions in the first place,
by greatly reducing the need to navigate between directories.

**Higher Level of Abstraction**
Staying at a high level of abstraction is one of programming's guiding principles of lasting value.
It makes it easier to think about a problem, and emphasizes fundamental services over implementation details.
As a direct benefit of being at a high level of abstraction, the application becomes more self-documenting:
the overall size of the application is communicated by the number of packages,
and the basic features are communicated by the package names.
The fundamental flaw with package-by-layer style, on the other hand,
is that it puts implementation details ahead of high level abstractions - which is backwards.

**Separates Both Features and Layers**
The package-by-feature style still honors the idea of separating layers,
but that separation is implemented using separate classes. The package-by-layer style, on the other hand,
implements that separation using both separate classes and separate packages,
which doesn't seem necessary or desirable.

**Minimizes Scope**
Minimizing scope is another guiding principle of lasting value.
Here, package-by-feature allows some classes to decrease their scope from public to package-private.
This is a significant change, and will help to minimize ripple effects. The package-by-layer style, on the other hand,
effectively abandons package-private scope, and forces you to implement nearly all items as public.
This is a fundamental flaw, since it doesn't allow you to minimize ripple effects by keeping secrets.

**Better Growth Style**
In the package-by-feature style, the number of classes within each package remains limited to the items related
to a specific feature. If a package becomes too large, it may be refactored in a natural way into two or more packages.
The package-by-layer style, on the other hand, is monolithic. As an application grows in size,
the number of packages remains roughly the same, while the number of classes in each package will increase without bound.

### References
- [Package by feature, not layer](http://www.javapractices.com/topic/TopicAction.do?Id=205)
- [Package by Layer for Spring Projects Is Obsolete](https://dzone.com/articles/package-by-layer-for-spring-projects-is-obsolete)
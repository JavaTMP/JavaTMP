---
title: Java Bootstrap Web Application Features And Resources
---
## Java Bootstrap Web Application Features And Resources

### Java Bootstrap Backend Features And Resources
`JavaTMP-User-Starter` project is a dynamic version of JavaTMP Bootstrap admin and dashboard template which consists of the following backend features and resouces:

1.  Create a Java Web Application Project from NetBeans IDE 8.2 new web application project.

2.  Copy all static files and resources from JavaTMP-Static-Ajax projects.

3.  Convert all .html pages and Ajax snippets to .jsp equivalent and move them to /WEB-INF to be restricted access through servlets only.
4.  add `<%@page contentType="text/html" pageEncoding="UTF-8"%>` to the top of all JSP pages.
5.  Create a custom Java Web MVC using Java Servlet/JSP and below libraries.
6.  Use Apache Commons BeanUtils 1.9.3 for auto injection of request parameters into specific bean instance.
    [https://commons.apache.org/proper/commons-beanutils/](https://commons.apache.org/proper/commons-beanutils/)
    [http://www-us.apache.org/dist//commons/beanutils/binaries/commons-beanutils-1.9.3-bin.zip](http://www-us.apache.org/dist//commons/beanutils/binaries/commons-beanutils-1.9.3-bin.zip)

7.  Use Apache Commons Collections 3.2.2 as a dependency for above Apache Commons BeanUtils
    [http://commons.apache.org/proper/commons-collections/](http://commons.apache.org/proper/commons-collections/)
    [http://www-us.apache.org/dist//commons/collections/binaries/commons-collections-3.2.2-bin.zip](http://www-us.apache.org/dist//commons/collections/binaries/commons-collections-3.2.2-bin.zip)

8.  Use Apache Commons Logging 1.2 as a dependency for above Apache Commons BeanUtils
    [http://commons.apache.org/proper/commons-logging/](http://commons.apache.org/proper/commons-logging/)
    [http://www-us.apache.org/dist//commons/logging/binaries/commons-logging-1.2-bin.zip](http://www-us.apache.org/dist//commons/logging/binaries/commons-logging-1.2-bin.zip)

9.  Use Apache Commons Lang 3.8.1 for auto converting of bean instance to string for printing.
    [http://commons.apache.org/proper/commons-lang/](http://commons.apache.org/proper/commons-lang/)

10.  Use Google Gson 2.8.5 for marshaling and unmarshaling of AJAX request and response beans.
    [https://github.com/google/gson](https://github.com/google/gson)
    [https://repo1.maven.org/maven2/com/google/code/gson/gson/2.8.5/](https://repo1.maven.org/maven2/com/google/code/gson/gson/2.8.5/)

11.  Use Standard Taglib 1.2 in JSP pages for formatting and looping.
    [http://central.maven.org/maven2/javax/servlet/jstl/1.2/](http://central.maven.org/maven2/javax/servlet/jstl/1.2/)
    [https://tomcat.apache.org/taglibs/standard/](https://tomcat.apache.org/taglibs/standard/)

### Dynamic Java Bootstrap Web Application features
The Java dynamic web application version of JavaTMP built using Java servlet 4.0 and JSP 2.3 and deployed on Apache tomcat 9. The following list provides the main features of dynamic Java Bootstrap web application version `JavaTMP-Java-Ajax` Project:

1.  Dynamically switching of interface language using server side session object User and i18n propertybundle:
    URL Links:
    Switch to English: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/updateLanguage?lang=en](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/updateLanguage?lang=en)
    Switch to Arabic: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/updateLanguage?lang=ar](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/updateLanguage?lang=ar)
    File Paths:
    AJAX Links: /JavaTMP-Java-Ajax/updateLanguage?lang=ar
    Servlets Classes: com.javatmp.web.controller.UpdateLanguageController

2.  Dynamically switching of theme using server side session object User and bootswatch css files.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/themes/bootswatch](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/themes/bootswatch)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\themes\\bootswatch.jsp
    AJAX Links: /JavaTMP-Java-Ajax/updateTheme
    Servlets Classes: com.javatmp.web.controller.UpdateThemeController

3.  Dynamically login using dynamic login page and server side servlet for Login
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/login](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/login)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\custom-pages\\login-pages\\default-login-page.jsp
    AJAX Links:
    Servlets Classes:
    com.javatmp.web.controller.LoginController
    com.javatmp.web.filter.AuthenticatorFilter

4.  Dynamically logout using dynamic server side servlet:
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/logout](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/logout)
    File Paths:
    AJAX Links:
    Servlets Classes: com.javatmp.web.controller.LogoutController

5.  Dynamically fetch card content using jQuery AJAX, BlockUI and toastr plugins.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/custom-components/dynamic-cards-content](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/custom-components/dynamic-cards-content)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\custom-components\\dynamic-cards-content.jsp
    AJAX Links:
    /JavaTMP-Java-Ajax/card/AjaxTextContentCardController
    /JavaTMP-Java-Ajax/util/AjaxSleeperController
    /card/ajaxJSPContentCardController
    Servlets Classes:
    com.javatmp.web.controller.card.AjaxTextContentCardController
    com.javatmp.web.controller.util.AjaxSleeperController
    com.javatmp.web.controller.card.AjaxJSPContentCardController

6.  Dynamically list web application folders and files using fancytree plugin in:
    URL Links:
    [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/tree/fancytree/plain\_fancytree](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/tree/fancytree/plain_fancytree)
    [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/tree/fancytree/table\_fancytree](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/tree/fancytree/plain_fancytree)
    File Paths:
    \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\plugins\\tree\\fancytree\\plain\_fancytree.jsp
    \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\plugins\\tree\\fancytree\\table\_fancytree.jsp
    AJAX Links: /JavaTMP-Java-Ajax/tree/files
    Servlets Classes:
    com.javatmp.web.controller.tree.FilesBrowserController

7.  Dynamically list chart of accounts as parent/child records using fancytree plugin in:
    URL Link:
    [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/tree/fancytree/chart-of-accounts](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/tree/fancytree/chart-of-accounts)
    File Path:
    \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\plugins\\tree\\fancytree\\chart-of-accounts.jsp
    AJAX Link:
    /JavaTMP-Java-Ajax/tree/chartOfAccounts
    Servlet Controller Class: com.javatmp.web.controller.tree.ChartOfAccountsController

8.  Diary Web Calendar through fullcalendar, inputmask, daterangepicker and bootstrap modal wrapper.
    URL Links:
    [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/calendar/jQuery-fullcalendar-diary-system](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/calendar/jQuery-fullcalendar-diary-system)
    File Paths:
    \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\plugins\\calendar\\jQuery-fullcalendar-diary-system.jsp
    AJAX Links:
    /calendar/populateFakeDatabase
    /calendar/ManageEventController
    /calendar/updateEvent
    /calendar/addNewEvent
    /calendar/deleteEvent
    Servlets Classes:
    com.javatmp.web.controller.calendar.PopulateFakeDatabaseController
    com.javatmp.web.controller.calendar.ManageEventController
    com.javatmp.web.controller.calendar.UpdateEventController
    com.javatmp.web.controller.calendar.AddNewEventController
    com.javatmp.web.controller.calendar.DeleteEventController

9.  Dynamically populate and fetch select2 AJAX data with/out custom result data.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/DynamicSelect2PageController](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/DynamicSelect2PageController)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\plugins\\dynamic-jQuery-select2-bootstrap.jsp
    AJAX Links:
    /country/ListCountryController
    /user/ListUsersPositionsController
    /user/ListUsersController
    Servlets Classes:
    com.javatmp.web.controller.country.ListCountryController
    com.javatmp.web.controller.user.ListUsersPositionsController
    com.javatmp.web.controller.user.ListUsersController

10.  Dynamically populate summernote editor plugin in JSP or from AJAX request's content:
    URL Links:
    [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/cms/ContentPageController](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/DynamicSelect2PageController)
    File Paths:
    \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\plugins\\dynamic-bootstrap-summernote-editor.jsp
    AJAX Links:
    /JavaTMP-Java-Ajax/cms/UpdateContentController
    /JavaTMP-Java-Ajax/cms/ReadContentController
    Servlets Classes:
    com.javatmp.web.controller.cms.ContentPageController
    com.javatmp.web.controller.cms.UpdateContentController
    com.javatmp.web.controller.cms.ReadContentController

11.  Dynamically serve static resources through simple servlet for binary content.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/gallery/file-controller-serve](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/gallery/file-controller-serve)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\gallery\\file-controller-serve.jsp
    AJAX Links: /FileController/assets/img/gallery/12.jpg
    Servlets Classes:
    com.javatmp.web.controller.dms.FileController

12.  Open image on client side to crop it and then upload cropped version to server.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/gallery/edit-image-locally](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/gallery/edit-image-locally)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\gallery\\edit-image-locally.jsp
    AJAX Links: /JavaTMP-Java-Ajax/UploadController
    Servlets Classes:
    com.javatmp.web.controller.dms.UploadController

13.  Dynamically load malihu scrollable pane with ajax content.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/dynamic-malihu-custom-scrollbar-plugin](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/plugins/dynamic-malihu-custom-scrollbar-plugin)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\plugins\\dynamic-malihu-custom-scrollbar-plugin.jsp
    AJAX Links: /JavaTMP-Java-Ajax/cms/ListContentController
    Servlets Classes:
    com.javatmp.web.controller.cms.ListContentController

14.  Dynamically submitting form using jQuery AJAX form, jQuery validation, summernote editor, upload URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/form/advance-form-plugins](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/form/advance-form-plugins)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\form\\advance-form-plugins.jsp
    AJAX Links: /JavaTMP-Java-Ajax/user/CreateUserController
    Servlets Classes:
    com.javatmp.web.controller.user.CreateUserController

15.  Dynamic wizard with form and validations.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/form/dynamic-wizard-with-advanced-form-page](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/form/dynamic-wizard-with-advanced-form-page)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\form\\dynamic-wizard-with-advanced-form-page.jsp
    \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\form\\dynamic-wizard-with-advanced-form.jsp
    AJAX Links: /JavaTMP-Java-Ajax/user/CreateUserController
    Servlets Classes:
    com.javatmp.web.controller.user.CreateUserController

16.  Dynamic Datatables content and pagination plugins and filtration.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/table/datatable/dynamic-datatables](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/table/datatable/dynamic-datatables)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\table\\datatable\\dynamic-datatables.jsp
    AJAX Links: /JavaTMP-Java-Ajax/user/ListUsersController
    Servlets Classes:
    com.javatmp.web.controller.user.ListUsersController

17.  Individual-column search using ajax and select2 and daterangepicker and inputmask.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/table/datatable/dynamic-individual-column-searching-datatables](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/table/datatable/dynamic-individual-column-searching-datatables)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\table\\datatable\\dynamic-individual-column-searching-datatables.jsp
    AJAX Links:
    /JavaTMP-Java-Ajax/user/ListUsersPositionsController
    /JavaTMP-Java-Ajax/user/ListUsersController
    Servlets Classes:
    com.javatmp.web.controller.user.ListUsersPositionsController
    com.javatmp.web.controller.user.ListUsersController

18.  Implements dynamic charts using echarts plugin with ajax contents.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/chart/dynamic-echarts](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/chart/dynamic-echarts)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\chart\\dynamic-echarts.jsp
    AJAX Links: /JavaTMP-Java-Ajax/user/ListAllUsersController
    Servlets Classes:
    com.javatmp.web.controller.user.ListAllUsersController

19.  Implements create new message for user using select2 & summernote .
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/custom-pages/inbox/ajax/ajax-compose-message](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/custom-pages/inbox/ajax/ajax-compose-message)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\custom-pages\\inbox\\ajax\\ajax-compose-message.jsp
    AJAX Links: /JavaTMP-Java-Ajax/message/CreateMessageController
    Servlets Classes:
    com.javatmp.web.controller.message.CreateMessageController

20.  Implements file manager feature to upload and download files using jquery Ajax form and binary servlet.
    URL Links: [http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/gallery/file-uploader-manager](http://java.javatmp.com:8080/JavaTMP-Java-Ajax/#/JavaTMP-Java-Ajax/pages/gallery/file-uploader-manager)
    File Paths: \\JavaTMP-Java-Ajax\\web\\WEB-INF\\pages\\gallery\\file-uploader-manager.jsp
    AJAX Links:
    /JavaTMP-Java-Ajax/UploadController
    Servlets Classes:
    com.javatmp.web.controller.dms.FileManagerPageController
    com.javatmp.web.controller.dms.UploadController

### Directory Structure For Java Web Application
The directory structure is the most important thing encountered by a developer when browsing source code.
Everything flows from it. Everything depends on it. It is clearly one of the most important aspects of the source code.
So, the first question in building an application is "How do I divide it up into packages?".
For typical business applications, there seems to be two ways of answering this question.

#### Package By Feature or Module
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

#### Package By Layer
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

#### Use Package By Feature
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
#### Java Directory Structure References
- [Package by feature, not layer](http://www.javapractices.com/topic/TopicAction.do?Id=205)
- [Package by Layer for Spring Projects Is Obsolete](https://dzone.com/articles/package-by-layer-for-spring-projects-is-obsolete)

#### Java Web Based MVC Application Design References
- [Core J2EE Patterns - Front Controller](https://www.oracle.com/technetwork/java/frontcontroller-135648.html)
- [Design Patterns web based applications](https://stackoverflow.com/questions/3541077/design-patterns-web-based-applications)
- [How to avoid Java code in JSP files?](https://stackoverflow.com/questions/3177733/how-to-avoid-java-code-in-jsp-files)
- [Servlet for serving static content](https://stackoverflow.com/questions/132052/servlet-for-serving-static-content)
- [File Servlet](http://balusc.omnifaces.org/2007/07/fileservlet.html)
- [FileServlet supporting resume and caching and GZIP](http://balusc.omnifaces.org/2009/02/fileservlet-supporting-resume-and.html)

### Uploading files from front end to Java Web Application
There are different ways for sending binary files from front end web browsers to Java Web Applications, The following links provides you more information:
-   [https://developer.mozilla.org/en-US/docs/Web/API/File/Using\_files\_from\_web\_applications](https://developer.mozilla.org/en-US/docs/Web/API/File/Using_files_from_web_applications)
-   [https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using\_FormData\_Objects](https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects)
-   [https://developer.mozilla.org/en-US/docs/Web/API/FileList](https://developer.mozilla.org/en-US/docs/Web/API/FileList)
-   [https://www.mkyong.com/jquery/jquery-ajax-submit-a-multipart-form/](https://www.mkyong.com/jquery/jquery-ajax-submit-a-multipart-form/)
-   [https://www.sanwebe.com/2014/04/ajax-contact-form-attachment-jquery-php](https://www.sanwebe.com/2014/04/ajax-contact-form-attachment-jquery-php)
-   [https://dotnetthoughts.net/how-to-upload-multiple-files-with-html5-and-jquery/](https://dotnetthoughts.net/how-to-upload-multiple-files-with-html5-and-jquery/)
-   [http://www.nickdesteffen.com/blog/file-uploading-over-ajax-using-html5](http://www.nickdesteffen.com/blog/file-uploading-over-ajax-using-html5)
-   [http://jsfiddle.net/javatmp/av06zfk2/](http://jsfiddle.net/javatmp/av06zfk2/)
-   [https://www.codeforest.net/html5-image-upload-resize-and-crop](https://www.codeforest.net/html5-image-upload-resize-and-crop)
-   [https://stackoverflow.com/questions/4459379/preview-an-image-before-it-is-uploaded](https://stackoverflow.com/questions/4459379/preview-an-image-before-it-is-uploaded)


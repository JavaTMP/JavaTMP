---
title: Dynamic Java Bootstrap Web Application features
---
# Dynamic Java Bootstrap Web Application features
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


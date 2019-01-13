---
title: Steps to add new Javascript plugin
---
# Steps to add new Javascript plugin
We use the following steps when we add new plugins for our template to make sure the functionalities of new plugin meet our need:

1.  Check first that there is not any exiting plugins with same required functionalities exist in JavaTMP template.
2.  Check that the new plugin is free and the source code is publically available preferable on github and the new plugin has demo pages and examples that describe the plugin.
3.  Check the new plugin does not interfere with any exiting plugin and it is supported with current jQuery and Bootstrap versions.
4.  Check any prerequisite plugins or frameworks for new plugin to download them too.
5.  Check that the new plugin has active development community.
6.  Check online demo of plugin and make sure it provide needed functionalities.
7.  Check that the new plugin is supported and published in node.js.
8.  Install and register the new plugin in node module by running the following command at the command prompt in root folder of JavaTMP-Static-Ajax Project:

    npm install <<module name>> --save

9.  Make sure that the previous command downloaded the plugin folder in `./node_modules` folder and updated the `./package.json`'s dependencies section by adding the new module name as dependency.
10.  Create a demo page for new plugin by using one of empty pages like `./web/pages/custom-pages/empty-pages/card-page.html` page.
11.  Add a link for new page in sidebar menu in index.html page and make it point to above new plugin page.
12.  Implement the plugin functionalities in the new page and check if the new plugin need a custom style to reflect the standard JavaTMP template styling.
13.  If the new plugin need a custom styling page, then create a new empty sass file in assets/sass/plugins folder.
14.  Add or override the new plugin styling in the created sass file above.
15.  The above sass file will be compiled and minimized to css file when one of the following gulp's task run: "plugins-sass", "sass", "watch-sass-and-js", and "default". Explicitly Run the following command to check the generation of new plugin custom css file by (re-generate all CSS files):

    gulp sass

16.  Use the custom styling file for new plugin after the main plugin styling files in your demo page or wherever you use the plugin as we don't merge files for plugins and each custom plugins styling should use explicitly after the its main styling files.
17.  Update by adding a row of information to [JavaTMP Front-end Plugins And Frameworks](/pages/reference/javatmp-front-end-plugins-and-frameworks) page describing the name, description, URL, Prerequisite and License of new plugin.
18.  Adding plugin information in credit section of [documentation home page](/pages/java-bootstrap-admin-dashboard-template "Java Bootstrap Admin and Dashboard Template") .
19.  Update [Version Change Log](/pages/java-bootstrap-template-versions-change-log) page by adding information about your modification in next or current version release.
20.  Check if the new plugins should be exist in the other versions, then implement it there.
21.  Check if the new plugins need a dynamic backend components and can be run through AJAX and Java, then implement a dynamic behaviour for it in Java version too.

## Steps to remove Javascript plugin
1. Remove plugin reference from `package.json`.
2. Remove plugin reference from `gulpfile.js` in `config` and `src` variables.
3. Remove a custom SASS file for plugin in `./web/assets/src/sass/plugins/` if there is any file for this plugin.
4. Remove a custom SASS file calling in `./web/assets/src/sass/main.sass` file for this plugin if there is any one.
5. Run `gulp` command.
6. Remove Any use for the plugin in any front-end HTML and JSP pages.
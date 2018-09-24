---
title: Front-end Resources Customization
---
# Front-end Resources Customization
You should read first : [Setting Up Development Environment](/pages/setting-up-development-environment) .

After we downloaded front-end plugins using Node's `npm` command , We remove many plugins unneeded files and kept only needed
files like dist folder and images, and merge them to be included in 'javatmp-plugins-all.min.js' when gulp's task 'generate-dist' run.

So it is your responsibilities to decide which plugins you need and if you want to merge them in one large js or css files.

we provide a separate CSS customization file for each plugin, so it is simple to change and understand.

You should include custom CSS file after each plugin's main css file. for this reason we include the
plugins customizations CSS style after main plugin CSS files. like this:
```
<link href="assets/dist/css/javatmp-plugins-all.min.css" rel="stylesheet" type="text/css"/>
<link href="assets/dist/css/javatmp-default.min.css" rel="stylesheet" type="text/css"/>
```

## Custom Plugins CSS
All plugins in JavaTMP template projects are located in the `./node_modules` and `./web/components` folder and
their custom SASS files are located in `./web/assets/src/sass|-rtl/plugins` folder. The compiled CSS files are generated
in gulp's task `generate-dist`.

Kindly see the source code of gulp's task `generate-dist` for more information about this process.
and folder `./web/assets/src/sass/plugins` and `./web/assets/src/sass-rtl/plugins`
for more information about the plugins that we customized to adapt default or custom bootstrap themes and skins.
---
title: JavaTMP CSS/SASS Template Files
---
# JavaTMP CSS/SASS Template Files
The main JavaTMP Javascript files are located in the `./web/assets/dist/js`
and generated from the gulp's task 'generate-dist` from these locations:
- From `./web/assets/src/js-src` after compile and minificate to `javatmp.min.js`.
- From `src.js` array for each plugin js file after merging to `javatmp-plugins-all.min.js`
- From `src.localeJS` array for each locale object we create `javatmp-plugins-all-locale-*.min.js` file.

The following file structure provide the output JS files from gulp's task 'generate-dist':
```
./web/assets/dist/js
+---javatmp-plugins-all-locale-*.min.js (For each Locale key defines `src.localeJS` object like `src.localeJS.en`)
+---javatmp-plugins-all.min.js
+---javatmp.min.js
```

These Javascript files are referenced from index html/JSP page. kindly see the following pages for more information:
- `./JavaTMP/JavaTMP-Static-Ajax/web/index.html`
- `./JavaTMP/JavaTMP-Static-Ajax/web/index-rtl.html`
- `./JavaTMP/JavaTMP-Java-Ajax/web/WEB-INF/index.jsp`
- `./JavaTMP/JavaTMP-User-Starter/web/WEB-INF/index.jsp`
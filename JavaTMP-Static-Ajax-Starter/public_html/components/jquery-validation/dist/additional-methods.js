/*!
 * jQuery Validation Plugin v1.17.0
 *
 * https://jqueryvalidation.org/
 *
 * Copyright (c) 2017 Jörn Zaefferer
 * Released under the MIT license
 */
!function(t){"function"==typeof define&&define.amd?define(["jquery","./jquery.validate"],t):"object"==typeof module&&module.exports?module.exports=t(require("jquery")):t(jQuery)}(function(s){return function(){function n(t){return t.replace(/<.[^<>]*?>/g," ").replace(/&nbsp;|&#160;/gi," ").replace(/[.(),;:!?%#$'\"_+=\/\-“”’]*/g,"")}s.validator.addMethod("maxWords",function(t,e,a){return this.optional(e)||n(t).match(/\b\w+\b/g).length<=a},s.validator.format("Please enter {0} words or less.")),s.validator.addMethod("minWords",function(t,e,a){return this.optional(e)||n(t).match(/\b\w+\b/g).length>=a},s.validator.format("Please enter at least {0} words.")),s.validator.addMethod("rangeWords",function(t,e,a){var d=n(t),i=/\b\w+\b/g;return this.optional(e)||d.match(i).length>=a[0]&&d.match(i).length<=a[1]},s.validator.format("Please enter between {0} and {1} words."))}(),s.validator.addMethod("accept",function(t,e,a){var d,i,n="string"==typeof a?a.replace(/\s/g,""):"image/*",r=this.optional(e);if(r)return r;if("file"===s(e).attr("type")&&(n=n.replace(/[\-\[\]\/\{\}\(\)\+\?\.\\\^\$\|]/g,"\\$&").replace(/,/g,"|").replace(/\/\*/g,"/.*"),e.files&&e.files.length))for(i=new RegExp(".?("+n+")$","i"),d=0;d<e.files.length;d++)if(!e.files[d].type.match(i))return!1;return!0},s.validator.format("Please enter a value with a valid mimetype.")),s.validator.addMethod("alphanumeric",function(t,e){return this.optional(e)||/^\w+$/i.test(t)},"Letters, numbers, and underscores only please"),s.validator.addMethod("bankaccountNL",function(t,e){if(this.optional(e))return!0;if(!/^[0-9]{9}|([0-9]{2} ){3}[0-9]{3}$/.test(t))return!1;var a,d=t.replace(/ /g,""),i=0,n=d.length;for(a=0;a<n;a++)i+=(n-a)*d.substring(a,a+1);return i%11==0},"Please specify a valid bank account number"),s.validator.addMethod("bankorgiroaccountNL",function(t,e){return this.optional(e)||s.validator.methods.bankaccountNL.call(this,t,e)||s.validator.methods.giroaccountNL.call(this,t,e)},"Please specify a valid bank or giro account number"),s.validator.addMethod("bic",function(t,e){return this.optional(e)||/^([A-Z]{6}[A-Z2-9][A-NP-Z1-9])(X{3}|[A-WY-Z0-9][A-Z0-9]{2})?$/.test(t.toUpperCase())},"Please specify a valid BIC code"),s.validator.addMethod("cifES",function(t,e){"use strict";if(this.optional(e))return!0;var a,d,i,n,r=new RegExp(/^([ABCDEFGHJKLMNPQRSUVW])(\d{7})([0-9A-J])$/gi),o=t.substring(0,1),s=t.substring(1,8),l=t.substring(8,9),u=0,c=0;if(9!==t.length||!r.test(t))return!1;for(a=0;a<s.length;a++)d=parseInt(s[a],10),a%2==0?c+=(d*=2)<10?d:d-9:u+=d;return i=(10-(u+c).toString().substr(-1)).toString(),i=9<parseInt(i,10)?"0":i,n="JABCDEFGHI".substr(i,1).toString(),o.match(/[ABEH]/)?l===i:o.match(/[KPQS]/)?l===n:l===i||l===n},"Please specify a valid CIF number."),s.validator.addMethod("cpfBR",function(t){if(11!==(t=t.replace(/([~!@#$%^&*()_+=`{}\[\]\-|\\:;'<>,.\/? ])+/g,"")).length)return!1;var e,a,d,i,n=0;if(e=parseInt(t.substring(9,10),10),a=parseInt(t.substring(10,11),10),d=function(t,e){var a=10*t%11;return 10!==a&&11!==a||(a=0),a===e},""===t||"00000000000"===t||"11111111111"===t||"22222222222"===t||"33333333333"===t||"44444444444"===t||"55555555555"===t||"66666666666"===t||"77777777777"===t||"88888888888"===t||"99999999999"===t)return!1;for(i=1;i<=9;i++)n+=parseInt(t.substring(i-1,i),10)*(11-i);if(d(n,e)){for(n=0,i=1;i<=10;i++)n+=parseInt(t.substring(i-1,i),10)*(12-i);return d(n,a)}return!1},"Please specify a valid CPF number"),s.validator.addMethod("creditcard",function(t,e){if(this.optional(e))return"dependency-mismatch";if(/[^0-9 \-]+/.test(t))return!1;var a,d,i=0,n=0,r=!1;if((t=t.replace(/\D/g,"")).length<13||19<t.length)return!1;for(a=t.length-1;0<=a;a--)d=t.charAt(a),n=parseInt(d,10),r&&9<(n*=2)&&(n-=9),i+=n,r=!r;return i%10==0},"Please enter a valid credit card number."),s.validator.addMethod("creditcardtypes",function(t,e,a){if(/[^0-9\-]+/.test(t))return!1;t=t.replace(/\D/g,"");var d=0;return a.mastercard&&(d|=1),a.visa&&(d|=2),a.amex&&(d|=4),a.dinersclub&&(d|=8),a.enroute&&(d|=16),a.discover&&(d|=32),a.jcb&&(d|=64),a.unknown&&(d|=128),a.all&&(d=255),1&d&&/^(5[12345])/.test(t)?16===t.length:2&d&&/^(4)/.test(t)?16===t.length:4&d&&/^(3[47])/.test(t)?15===t.length:8&d&&/^(3(0[012345]|[68]))/.test(t)?14===t.length:16&d&&/^(2(014|149))/.test(t)?15===t.length:32&d&&/^(6011)/.test(t)?16===t.length:64&d&&/^(3)/.test(t)?16===t.length:64&d&&/^(2131|1800)/.test(t)?15===t.length:!!(128&d)},"Please enter a valid credit card number."),s.validator.addMethod("currency",function(t,e,a){var d,i="string"==typeof a,n=i?a:a[0],r=!!i||a[1];return n=n.replace(/,/g,""),d="^["+(n=r?n+"]":n+"]?")+"([1-9]{1}[0-9]{0,2}(\\,[0-9]{3})*(\\.[0-9]{0,2})?|[1-9]{1}[0-9]{0,}(\\.[0-9]{0,2})?|0(\\.[0-9]{0,2})?|(\\.[0-9]{1,2})?)$",d=new RegExp(d),this.optional(e)||d.test(t)},"Please specify a valid currency"),s.validator.addMethod("dateFA",function(t,e){return this.optional(e)||/^[1-4]\d{3}\/((0?[1-6]\/((3[0-1])|([1-2][0-9])|(0?[1-9])))|((1[0-2]|(0?[7-9]))\/(30|([1-2][0-9])|(0?[1-9]))))$/.test(t)},s.validator.messages.date),s.validator.addMethod("dateITA",function(t,e){var a,d,i,n,r,o=!1;return/^\d{1,2}\/\d{1,2}\/\d{4}$/.test(t)?(a=t.split("/"),d=parseInt(a[0],10),i=parseInt(a[1],10),n=parseInt(a[2],10),o=(r=new Date(Date.UTC(n,i-1,d,12,0,0,0))).getUTCFullYear()===n&&r.getUTCMonth()===i-1&&r.getUTCDate()===d):o=!1,this.optional(e)||o},s.validator.messages.date),s.validator.addMethod("dateNL",function(t,e){return this.optional(e)||/^(0?[1-9]|[12]\d|3[01])[\.\/\-](0?[1-9]|1[012])[\.\/\-]([12]\d)?(\d\d)$/.test(t)},s.validator.messages.date),s.validator.addMethod("extension",function(t,e,a){return a="string"==typeof a?a.replace(/,/g,"|"):"png|jpe?g|gif",this.optional(e)||t.match(new RegExp("\\.("+a+")$","i"))},s.validator.format("Please enter a value with a valid extension.")),s.validator.addMethod("giroaccountNL",function(t,e){return this.optional(e)||/^[0-9]{1,7}$/.test(t)},"Please specify a valid giro account number"),s.validator.addMethod("iban",function(t,e){if(this.optional(e))return!0;var a,d,i,n,r,o=t.replace(/ /g,"").toUpperCase(),s="",l=!0,u="";if(o.length<5)return!1;if(void 0!==(i={AL:"\\d{8}[\\dA-Z]{16}",AD:"\\d{8}[\\dA-Z]{12}",AT:"\\d{16}",AZ:"[\\dA-Z]{4}\\d{20}",BE:"\\d{12}",BH:"[A-Z]{4}[\\dA-Z]{14}",BA:"\\d{16}",BR:"\\d{23}[A-Z][\\dA-Z]",BG:"[A-Z]{4}\\d{6}[\\dA-Z]{8}",CR:"\\d{17}",HR:"\\d{17}",CY:"\\d{8}[\\dA-Z]{16}",CZ:"\\d{20}",DK:"\\d{14}",DO:"[A-Z]{4}\\d{20}",EE:"\\d{16}",FO:"\\d{14}",FI:"\\d{14}",FR:"\\d{10}[\\dA-Z]{11}\\d{2}",GE:"[\\dA-Z]{2}\\d{16}",DE:"\\d{18}",GI:"[A-Z]{4}[\\dA-Z]{15}",GR:"\\d{7}[\\dA-Z]{16}",GL:"\\d{14}",GT:"[\\dA-Z]{4}[\\dA-Z]{20}",HU:"\\d{24}",IS:"\\d{22}",IE:"[\\dA-Z]{4}\\d{14}",IL:"\\d{19}",IT:"[A-Z]\\d{10}[\\dA-Z]{12}",KZ:"\\d{3}[\\dA-Z]{13}",KW:"[A-Z]{4}[\\dA-Z]{22}",LV:"[A-Z]{4}[\\dA-Z]{13}",LB:"\\d{4}[\\dA-Z]{20}",LI:"\\d{5}[\\dA-Z]{12}",LT:"\\d{16}",LU:"\\d{3}[\\dA-Z]{13}",MK:"\\d{3}[\\dA-Z]{10}\\d{2}",MT:"[A-Z]{4}\\d{5}[\\dA-Z]{18}",MR:"\\d{23}",MU:"[A-Z]{4}\\d{19}[A-Z]{3}",MC:"\\d{10}[\\dA-Z]{11}\\d{2}",MD:"[\\dA-Z]{2}\\d{18}",ME:"\\d{18}",NL:"[A-Z]{4}\\d{10}",NO:"\\d{11}",PK:"[\\dA-Z]{4}\\d{16}",PS:"[\\dA-Z]{4}\\d{21}",PL:"\\d{24}",PT:"\\d{21}",RO:"[A-Z]{4}[\\dA-Z]{16}",SM:"[A-Z]\\d{10}[\\dA-Z]{12}",SA:"\\d{2}[\\dA-Z]{18}",RS:"\\d{18}",SK:"\\d{20}",SI:"\\d{15}",ES:"\\d{20}",SE:"\\d{20}",CH:"\\d{5}[\\dA-Z]{12}",TN:"\\d{20}",TR:"\\d{5}[\\dA-Z]{17}",AE:"\\d{3}\\d{16}",GB:"[A-Z]{4}\\d{14}",VG:"[\\dA-Z]{4}\\d{16}"}[o.substring(0,2)])&&!new RegExp("^[A-Z]{2}\\d{2}"+i+"$","").test(o))return!1;for(a=o.substring(4,o.length)+o.substring(0,4),n=0;n<a.length;n++)"0"!==(d=a.charAt(n))&&(l=!1),l||(s+="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".indexOf(d));for(r=0;r<s.length;r++)u=(""+u+s.charAt(r))%97;return 1===u},"Please specify a valid IBAN"),s.validator.addMethod("integer",function(t,e){return this.optional(e)||/^-?\d+$/.test(t)},"A positive or negative non-decimal number please"),s.validator.addMethod("ipv4",function(t,e){return this.optional(e)||/^(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)\.(25[0-5]|2[0-4]\d|[01]?\d\d?)$/i.test(t)},"Please enter a valid IP v4 address."),s.validator.addMethod("ipv6",function(t,e){return this.optional(e)||/^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$/i.test(t)},"Please enter a valid IP v6 address."),s.validator.addMethod("lettersonly",function(t,e){return this.optional(e)||/^[a-z]+$/i.test(t)},"Letters only please"),s.validator.addMethod("letterswithbasicpunc",function(t,e){return this.optional(e)||/^[a-z\-.,()'"\s]+$/i.test(t)},"Letters or punctuation only please"),s.validator.addMethod("mobileNL",function(t,e){return this.optional(e)||/^((\+|00(\s|\s?\-\s?)?)31(\s|\s?\-\s?)?(\(0\)[\-\s]?)?|0)6((\s|\s?\-\s?)?[0-9]){8}$/.test(t)},"Please specify a valid mobile number"),s.validator.addMethod("mobileUK",function(t,e){return t=t.replace(/\(|\)|\s+|-/g,""),this.optional(e)||9<t.length&&t.match(/^(?:(?:(?:00\s?|\+)44\s?|0)7(?:[1345789]\d{2}|624)\s?\d{3}\s?\d{3})$/)},"Please specify a valid mobile number"),s.validator.addMethod("netmask",function(t,e){return this.optional(e)||/^(254|252|248|240|224|192|128)\.0\.0\.0|255\.(254|252|248|240|224|192|128|0)\.0\.0|255\.255\.(254|252|248|240|224|192|128|0)\.0|255\.255\.255\.(254|252|248|240|224|192|128|0)/i.test(t)},"Please enter a valid netmask."),s.validator.addMethod("nieES",function(t,e){"use strict";if(this.optional(e))return!0;var a,d=new RegExp(/^[MXYZ]{1}[0-9]{7,8}[TRWAGMYFPDXBNJZSQVHLCKET]{1}$/gi),i=t.substr(t.length-1).toUpperCase();return!(10<(t=t.toString().toUpperCase()).length||t.length<9||!d.test(t))&&(a=9===(t=t.replace(/^[X]/,"0").replace(/^[Y]/,"1").replace(/^[Z]/,"2")).length?t.substr(0,8):t.substr(0,9),"TRWAGMYFPDXBNJZSQVHLCKET".charAt(parseInt(a,10)%23)===i)},"Please specify a valid NIE number."),s.validator.addMethod("nifES",function(t,e){"use strict";return!!this.optional(e)||!!(t=t.toUpperCase()).match("((^[A-Z]{1}[0-9]{7}[A-Z0-9]{1}$|^[T]{1}[A-Z0-9]{8}$)|^[0-9]{8}[A-Z]{1}$)")&&(/^[0-9]{8}[A-Z]{1}$/.test(t)?"TRWAGMYFPDXBNJZSQVHLCKE".charAt(t.substring(8,0)%23)===t.charAt(8):!!/^[KLM]{1}/.test(t)&&t[8]==="TRWAGMYFPDXBNJZSQVHLCKE".charAt(t.substring(8,1)%23))},"Please specify a valid NIF number."),s.validator.addMethod("nipPL",function(t){"use strict";if(10!==(t=t.replace(/[^0-9]/g,"")).length)return!1;for(var e=[6,5,7,2,3,4,5,6,7],a=0,d=0;d<9;d++)a+=e[d]*t[d];var i=a%11;return(10===i?0:i)===parseInt(t[9],10)},"Please specify a valid NIP number."),s.validator.addMethod("notEqualTo",function(t,e,a){return this.optional(e)||!s.validator.methods.equalTo.call(this,t,e,a)},"Please enter a different value, values must not be the same."),s.validator.addMethod("nowhitespace",function(t,e){return this.optional(e)||/^\S+$/i.test(t)},"No white space please"),s.validator.addMethod("pattern",function(t,e,a){return!!this.optional(e)||("string"==typeof a&&(a=new RegExp("^(?:"+a+")$")),a.test(t))},"Invalid format."),s.validator.addMethod("phoneNL",function(t,e){return this.optional(e)||/^((\+|00(\s|\s?\-\s?)?)31(\s|\s?\-\s?)?(\(0\)[\-\s]?)?|0)[1-9]((\s|\s?\-\s?)?[0-9]){8}$/.test(t)},"Please specify a valid phone number."),s.validator.addMethod("phonesUK",function(t,e){return t=t.replace(/\(|\)|\s+|-/g,""),this.optional(e)||9<t.length&&t.match(/^(?:(?:(?:00\s?|\+)44\s?|0)(?:1\d{8,9}|[23]\d{9}|7(?:[1345789]\d{8}|624\d{6})))$/)},"Please specify a valid uk phone number"),s.validator.addMethod("phoneUK",function(t,e){return t=t.replace(/\(|\)|\s+|-/g,""),this.optional(e)||9<t.length&&t.match(/^(?:(?:(?:00\s?|\+)44\s?)|(?:\(?0))(?:\d{2}\)?\s?\d{4}\s?\d{4}|\d{3}\)?\s?\d{3}\s?\d{3,4}|\d{4}\)?\s?(?:\d{5}|\d{3}\s?\d{3})|\d{5}\)?\s?\d{4,5})$/)},"Please specify a valid phone number"),s.validator.addMethod("phoneUS",function(t,e){return t=t.replace(/\s+/g,""),this.optional(e)||9<t.length&&t.match(/^(\+?1-?)?(\([2-9]([02-9]\d|1[02-9])\)|[2-9]([02-9]\d|1[02-9]))-?[2-9]([02-9]\d|1[02-9])-?\d{4}$/)},"Please specify a valid phone number"),s.validator.addMethod("postalcodeBR",function(t,e){return this.optional(e)||/^\d{2}.\d{3}-\d{3}?$|^\d{5}-?\d{3}?$/.test(t)},"Informe um CEP válido."),s.validator.addMethod("postalCodeCA",function(t,e){return this.optional(e)||/^[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ] *\d[ABCEGHJKLMNPRSTVWXYZ]\d$/i.test(t)},"Please specify a valid postal code"),s.validator.addMethod("postalcodeIT",function(t,e){return this.optional(e)||/^\d{5}$/.test(t)},"Please specify a valid postal code"),s.validator.addMethod("postalcodeNL",function(t,e){return this.optional(e)||/^[1-9][0-9]{3}\s?[a-zA-Z]{2}$/.test(t)},"Please specify a valid postal code"),s.validator.addMethod("postcodeUK",function(t,e){return this.optional(e)||/^((([A-PR-UWYZ][0-9])|([A-PR-UWYZ][0-9][0-9])|([A-PR-UWYZ][A-HK-Y][0-9])|([A-PR-UWYZ][A-HK-Y][0-9][0-9])|([A-PR-UWYZ][0-9][A-HJKSTUW])|([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))\s?([0-9][ABD-HJLNP-UW-Z]{2})|(GIR)\s?(0AA))$/i.test(t)},"Please specify a valid UK postcode"),s.validator.addMethod("require_from_group",function(t,e,a){var d=s(a[1],e.form),i=d.eq(0),n=i.data("valid_req_grp")?i.data("valid_req_grp"):s.extend({},this),r=d.filter(function(){return n.elementValue(this)}).length>=a[0];return i.data("valid_req_grp",n),s(e).data("being_validated")||(d.data("being_validated",!0),d.each(function(){n.element(this)}),d.data("being_validated",!1)),r},s.validator.format("Please fill at least {0} of these fields.")),s.validator.addMethod("skip_or_fill_minimum",function(t,e,a){var d=s(a[1],e.form),i=d.eq(0),n=i.data("valid_skip")?i.data("valid_skip"):s.extend({},this),r=d.filter(function(){return n.elementValue(this)}).length,o=0===r||r>=a[0];return i.data("valid_skip",n),s(e).data("being_validated")||(d.data("being_validated",!0),d.each(function(){n.element(this)}),d.data("being_validated",!1)),o},s.validator.format("Please either skip these fields or fill at least {0} of them.")),s.validator.addMethod("stateUS",function(t,e,a){var d,i=void 0===a,n=!i&&void 0!==a.caseSensitive&&a.caseSensitive,r=!i&&void 0!==a.includeTerritories&&a.includeTerritories,o=!i&&void 0!==a.includeMilitary&&a.includeMilitary;return d=r||o?r&&o?"^(A[AEKLPRSZ]|C[AOT]|D[CE]|FL|G[AU]|HI|I[ADLN]|K[SY]|LA|M[ADEINOPST]|N[CDEHJMVY]|O[HKR]|P[AR]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY])$":r?"^(A[KLRSZ]|C[AOT]|D[CE]|FL|G[AU]|HI|I[ADLN]|K[SY]|LA|M[ADEINOPST]|N[CDEHJMVY]|O[HKR]|P[AR]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY])$":"^(A[AEKLPRZ]|C[AOT]|D[CE]|FL|GA|HI|I[ADLN]|K[SY]|LA|M[ADEINOST]|N[CDEHJMVY]|O[HKR]|PA|RI|S[CD]|T[NX]|UT|V[AT]|W[AIVY])$":"^(A[KLRZ]|C[AOT]|D[CE]|FL|GA|HI|I[ADLN]|K[SY]|LA|M[ADEINOST]|N[CDEHJMVY]|O[HKR]|PA|RI|S[CD]|T[NX]|UT|V[AT]|W[AIVY])$",d=n?new RegExp(d):new RegExp(d,"i"),this.optional(e)||d.test(t)},"Please specify a valid state"),s.validator.addMethod("strippedminlength",function(t,e,a){return s(t).text().length>=a},s.validator.format("Please enter at least {0} characters")),s.validator.addMethod("time",function(t,e){return this.optional(e)||/^([01]\d|2[0-3]|[0-9])(:[0-5]\d){1,2}$/.test(t)},"Please enter a valid time, between 00:00 and 23:59"),s.validator.addMethod("time12h",function(t,e){return this.optional(e)||/^((0?[1-9]|1[012])(:[0-5]\d){1,2}(\ ?[AP]M))$/i.test(t)},"Please enter a valid time in 12-hour am/pm format"),s.validator.addMethod("url2",function(t,e){return this.optional(e)||/^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)*(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(t)},s.validator.messages.url),s.validator.addMethod("vinUS",function(t){if(17!==t.length)return!1;var e,a,d,i,n,r,o=["A","B","C","D","E","F","G","H","J","K","L","M","N","P","R","S","T","U","V","W","X","Y","Z"],s=[1,2,3,4,5,6,7,8,1,2,3,4,5,7,9,2,3,4,5,6,7,8,9],l=[8,7,6,5,4,3,2,10,0,9,8,7,6,5,4,3,2],u=0;for(e=0;e<17;e++){if(i=l[e],d=t.slice(e,e+1),8===e&&(r=d),isNaN(d)){for(a=0;a<o.length;a++)if(d.toUpperCase()===o[a]){d=s[a],d*=i,isNaN(r)&&8===a&&(r=o[a]);break}}else d*=i;u+=d}return 10===(n=u%11)&&(n="X"),n===r},"The specified vehicle identification number (VIN) is invalid."),s.validator.addMethod("zipcodeUS",function(t,e){return this.optional(e)||/^\d{5}(-\d{4})?$/.test(t)},"The specified US ZIP Code is invalid"),s.validator.addMethod("ziprange",function(t,e){return this.optional(e)||/^90[2-5]\d\{2\}-\d{4}$/.test(t)},"Your ZIP-code must be in the range 902xx-xxxx to 905xx-xxxx"),s});
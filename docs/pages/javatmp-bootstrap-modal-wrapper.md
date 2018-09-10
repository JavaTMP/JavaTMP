---
title: JavaTMP Bootstrap Modal Wrapper
---
# JavaTMP Bootstrap Modal Wrapper
`[Bootstrap Modal Wrapper Plugin](https://github.com/JavaTMP/bootstrap-modal-wrapper)` extendes native Bootstrap modal plugin to support dynamic modal generation and nested modals features. We use them globally and it is implemented it in external repository `[https://github.com/JavaTMP/bootstrap-modal-wrapper](https://github.com/JavaTMP/bootstrap-modal-wrapper)`. See the [online demo page for bootstrap modal](http://demo.javatmp.com/JavaTMP-Static-Ajax/index.html#pages/bootstrap/modal.html "Online Demo Page for Bootstrap Modal") for quick examples. The following examples are the main features of the plugin:

Quick Demo Links: 

[Bootstrap Modal Demo](http://demo.javatmp.com/JavaTMP-Static-Ajax/#pages/plugins/bootstrap-modal-wrapper.html "Bootstrap Modal Wrapper demo page")

Bootstrap Alert Modal
---------------------

The simple scenario of modal wrapper is to show a simple alert when use press a button:
```
<button id="simple-alert" type="button" class="btn btn-primary">
    Basic Alert
</button>
<script type="text/javascript">
    jQuery(function ($) {
        $("#simple-alert").on("click", function (event) {
            BootstrapModalWrapperFactory.alert("Delfault alert <b>with only message Text</b>");
        });
    });
</script>
```
Bootstrap Confirmation Modal
----------------------------

JavaTMP Bootstrap modal wrapper factory provides a confirmation dialog too with ability to run different code. See the following example:
```
<button id="simple-confirm" type="button" class="btn btn-primary">
    Basic Confirm
</button>
<script type="text/javascript">
    jQuery(function ($) {
        $("#simple-confirm").on("click", function (event) {
            BootstrapModalWrapperFactory.confirm({
                title: "Confirm",
                message: "Are You Sure ?",
                onConfirmAccept: function () {
                    BootstrapModalWrapperFactory.alert("Thank you for ACCEPTING the previous confiramtion dialog");
                },
                onConfirmCancel: function () {
                    BootstrapModalWrapperFactory.alert("Thank you for CANCELING the previous confiramtion dialog");
                }
            });
        });
    });
</script>
```
JavaTMP Bootstrap Modal Wrapper `createModal` Method
----------------------------------------------------

The JavaTMP Bootstrap Modal wrapper object provides a general method `createModal` which creates modals dynamically. the implementation of `BootstrapModalWrapperFactory.alert` and `BootstrapModalWrapperFactory.confirm` methods use `createModal` to provide desired behaviors. The following examples show you how to us createModal method in action:

Create simple Bootstrap Modal wrapper instance dynamically:
```
var onlyBody = BootstrapModalWrapperFactory.createModal({
    message: "Simple Message body",
    closable: false,
    closeByBackdrop: true
});
onlyBody.show();
```
Create a simple bootstrap modal wrapper with body and title only:
```
var modalWrapper = BootstrapModalWrapperFactory.createModal({
    message: "Simple Message body",
    title: "Header Title",
    closable: true,
    closeByBackdrop: true
});
modalWrapper.show();
```
Create a simple bootstrap modal wrapper with a button to close and destroy it
```
var modalWrapper = BootstrapModalWrapperFactory.createModal({
    message: "Simple Message body",
    title: "Header Title",
    closable: false,
    closeByBackdrop: false,
    buttons: \[
        {
            label: "Close Me",
            cssClass: "btn btn-primary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                return modalWrapper.hide();
            }
        }
    \]
});
modalWrapper.show();
```
Create nested bootstrap modal wrapper instances dynamically:
```
var modalWrapper = BootstrapModalWrapperFactory.createModal({
    message: "Simple Message body",
    title: "Header Title",
    closable: false,
    closeByBackdrop: false,
    buttons: \[
        {
            label: "Close",
            cssClass: "btn btn-secondary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                return modalWrapper.hide();
            }
        },
        {
            label: "Create alert",
            cssClass: "btn btn-primary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                BootstrapModalWrapperFactory.alert("Alert Modal Created");
            }
        }
    \]
}).show();
```
Update title and body of bootstrap modal wrapper dynamically after showing:
```
BootstrapModalWrapperFactory.createModal({
    message: "Simple Message body",
    title: "Header Title",
    closable: false,
    closeByBackdrop: false,
    buttons: \[
        {
            label: "Close",
            cssClass: "btn btn-secondary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                return modalWrapper.hide();
            }
        },
        {
            label: "Update Title & Message",
            cssClass: "btn btn-primary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                modalWrapper.updateTitle("New Title");
                modalWrapper.updateMessage("Updated message content");
            }
        }
    \]
}).show();
```
Update the size of shown bootstrap modal dynamically:
```
BootstrapModalWrapperFactory.createModal({
    message: "Simple Message body",
    title: "Header Title",
    closable: false,
    closeByBackdrop: false,
    buttons: \[
        {
            label: "Close",
            cssClass: "btn btn-secondary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                return modalWrapper.hide();
            }
        },
        {
            label: "Make Me Large",
            cssClass: "btn btn-primary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                modalWrapper.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                modalWrapper.updateSize("modal-lg");
            }
        },
        {
            label: "Make Me Small",
            cssClass: "btn btn-primary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                modalWrapper.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                modalWrapper.updateSize("modal-sm");
            }
        },
        {
            label: "Make Me Default",
            cssClass: "btn btn-primary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                modalWrapper.originalModal.find(".modal-dialog").css({transition: 'all 0.4s'});
                modalWrapper.updateSize(null);
            }
        }
    \]
}).show();
```
Create Bootstrap Modal wrapper buttons dynamically and remove them:
```
var buttonsCount = 0;
BootstrapModalWrapperFactory.createModal({
    message: "Simple Message body",
    title: "Header Title",
    closable: false,
    closeByBackdrop: false,
    buttons: \[
        {
            label: "Close",
            cssClass: "btn btn-secondary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                return modalWrapper.hide();
            }
        },
        {
            label: "Add Button",
            cssClass: "btn btn-primary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                modalWrapper.addButton({
                    id: "id-" + (++buttonsCount),
                    label: "New " + buttonsCount,
                    cssClass: "btn btn-secondary",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        BootstrapModalWrapperFactory.showMessage("nothing only to show attached event to button id \[" + buttonData.id + "\]");
                        return true;
                    }
                });
            }
        },
        {
            label: "Delete Button",
            cssClass: "btn btn-primary",
            action: function (modalWrapper, button, buttonData, originalEvent) {
                modalWrapper.removeButton("id-" + (buttonsCount--));
            }
        }
    \]
}).show();
```
Simulate Updating Bootstrap Modal wrapper instace dynamically with AJAX response content:
```
var m = BootstrapModalWrapperFactory.createModal({
    message: '<div class="text-center"><i class="fa fa-refresh fa-spin fa-3x fa-fw text-primary"></i></div>',
    closable: false,
    closeByBackdrop: false
});
m.originalModal.find(".modal-dialog").css({transition: 'all 0.5s'});
m.show();
setTimeout(function () {
    m.updateSize("modal-lg");
    m.updateTitle("Message Received");
    m.updateMessage("Message Content");
    m.addButton({
        label: "Close",
        cssClass: "btn btn-secondary",
        action: function (modalWrapper, button, buttonData, originalEvent) {
            return modalWrapper.hide();
        }
    });
}, 3000);
```
You can simply adapt and use the bootstrap modal wrapper to provide a dynamic Bootstrap modal with remote AJAX contents using `createAjaxModal` method, For example:
```
var m = BootstrapModalWrapperFactory.createAjaxModal({
    message: '<div class="text-center">Loading</div>',
    closable: true,
    title: "AJAX Content",
    closeByBackdrop: false,
    url: "blank-ajax-response.html"
});
```
Kindly refer to [Bootstrap Modal Wrapper](https://github.com/JavaTMP/bootstrap-modal-wrapper "Bootstrap Modal Wrapper Plugin")
and [Bootstrap Actionable](https://github.com/JavaTMP/bootstrap-actionable "Bootstrap Actionable Plugin") plugins
for more details for calling and managing AJAX modals instances.

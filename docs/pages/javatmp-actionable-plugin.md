---
title: JavaTMP Bootstrap Actionable Plugin
---
# JavaTMP Bootstrap Actionable Plugin
[Bootstrap Actionable plugin](https://github.com/JavaTMP/bootstrap-actionable) is a small Javascript code that help us implement click actions for `<a>` and `<button>` tags by declarative way and provide functionalities to load AJAX content in Bootstrap Modal Wrapper instance. The following are the main action types provided by the plugin:

## `"action-ref-href"` Action Type

This is the simplest function of the plugin which fires other link's `click` event that contains the value of `href`'s attribute equal to provided one. We use this type on sidebar small shortcut `buttons` and on all `home.html`'s `buttons`. See the following button tags html code:
```
<button class="btn btn-primary"
        actionType="action-ref-href"
        action-ref-by-href="pages/home.html">
    <i class="fa fa-home fa-fw"></i>
</button>
```
Pressing the above button will make actionable code search for link with value `"pages/home.html"` in its `href` attribute and then fire a `click` event on it.

Another button code example from `home.html` page:
```
<button type="button" class="javatmp-btn btn btn-primary btn-block my-2"
        actionType="action-ref-href"
        actionScope=".sidebar"
        action-ref-by-href="pages/custom-pages/login-pages/default-login-page.html" >
    <i class="fa fa-file-o"></i>
    Default Login Page
</button>
```
Pressing the above button will make actionable code search for link value `"pages/custom-pages/login-pages/default-login-page.html"` in its `href` attribute in `.sidebar` div only as we explicitly set the `actionScope` attribute and because the link on sidebar contains target attribute the actionable plugin code will use `window.open` to open it. See the following code for target link in the sidebar:
```
<a target="\_blank"  href="pages/custom-pages/login-pages/default-login-page.html">
    <i class="fa fa-lg fa-fw fa-file-o"></i>
    Default Login Page
</a>
```

## `"action-ref"` Action Type
It is similar to `"action-ref-href"` but instead of using URL to search for value of `href` attribute, it uses an alias name to search for. See the following code for `"Compose Message"` and `"View Message"` sidebar link in `index.html` page:
```
<li>
    <a action-name="compose-page" href="pages/custom-pages/inbox/compose-message.html">
        <i class="fa fa-lg fa-fw fa-file-o"></i>
        Compose Message
    </a>
</li>
<li>
    <a action-name="view-message" href="pages/custom-pages/inbox/view-message.html">
        <i class="fa fa-lg fa-fw fa-file-o"></i>
        View Message
    </a>
</li>
```
And see the following tags from `./web/pages/custom-pages/inbox/inbox-messages.html` file:
```
<button
    type="button"
    actionType="action-ref"
    action-ref-by-name="compose-page"
    class="btn btn-danger btn-block actionable">
    Compose
</button>
<a
    actionType="action-ref"
    action-ref-by-name="view-message"
    alt=""
    href="">
    Customer Support
</a>
```

## `"ajax-request-in-model"` action type
This action type is very powerful and it fires an AJAX request using href URL and load its contents in [Bootstrap Modal Wrapper](/pages/javatmp-bootstrap-modal-wrapper "JavaTMP Bootstrap Modal Wrapper Plugin") instance and give the control to the modal. Example links are the message links in dropdown menu items in main navbar in `index.html` page:
```
<a actionType="ajax-request-in-model"
   href="pages/custom-pages/inbox/ajax/ajax-view-message.html"
   class="list-group-item list-group-item-action">
    <div>
        <strong>John Smith</strong>
        <span class="float-right text-muted">
            <em>Yesterday</em>
        </span>
    </div>
    <div>Lorem ipsum dolor sit amet adipis dolor sit elit ipsum dolor sit elit ...</div>
</a>
```
Pressing the above link will make actionable invokes the following method:
```
BootstrapModalWrapperFactory.createAjaxModal({
    message: $this.options.loadingHtml,
    dataType: $this.options.dataType,
    httpMethod: $this.options.ajaxHttpMethod,
    ajaxContainerReadyEventName: $this.options.ajaxContainerReady,
    url: href
});
```
The following HTML code is the response of above AJAX request:
```
<div class="dynamic-ajax-content">
    ...
    <script type="text/javascript">
        jQuery(function ($) {

            // here we can reference the container bootstrap modal by its id
            // passed as parameter to request by name "ajaxModalId"
            // or for demo purposese ONLY we can get a reference top modal
            // in current open managed instances in BootstrapModalWrapperFactory
            var currentParentModal = BootstrapModalWrapperFactory.globalModals\[BootstrapModalWrapperFactory.globalModals.length - 1\];

            $("#" + currentParentModal.options.id).on(javatmp.settings.javaTmpAjaxContainerReady, function (event, modal) {
                modal.updateSize("modal-lg");
                modal.updateTitle("View Message");
                modal.updateClosable(true);
                modal.addButton({
                    label: "Close",
                    cssClass: "btn btn-primary",
                    action: function (modalWrapper, button, buttonData, originalEvent) {
                        return modalWrapper.hide();
                    }
                });
            });
        });
    </script>
</div>
```
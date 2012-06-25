<li>
    <button type="button" id="go-minimal">
        Go beyond minimal
    </button>
</li>
<script type="text/javascript">
{literal}
var minimo = $('#go-minimal');
var stylesheets;
minimo.click(function(e) {
    e.preventDefault();
    if (!stylesheets) {
        stylesheets = $('link[type="text/css"]');
    }
    if (minimo.data('min')) {
        stylesheets.insertBefore('#page');
        minimo.text('Go beyond minimal').data('min', false);
    }
    else {
        stylesheets.remove();
        minimo.text('Go minimal').data('min', true);
    }
});
{/literal}
</script>

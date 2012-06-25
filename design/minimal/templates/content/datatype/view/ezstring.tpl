<div class="update-on-edit" data-id="{$attribute.id}">
    {if eq( $attribute.contentclass_attribute.identifier, 'name' )}
        <h2 class="inner">{$attribute.data_text|wash( xhtml )}</h2>
        {$attribute|exceed_editable}
    {else}
        {$attribute.data_text|wash( xhtml )}
    {/if}
</div>

{foreach $node.data_map as $attr}
    {attribute_view_gui attribute=$attr}
{/foreach}

<h3>{"More"|i18n}</h3>

<section class="node-children">
    {foreach $node.children as $child}
    <div>
        <a href={$child.url_alias|ezurl} title={"Go to &raquo;%name&laquo;"|i18n("", "", hash("%name", $child.name))}>{$child.name}</a>
        {if is_set( $child.data_map.preamble )}
            {$child.data_map.preamble.content.output.output_text}
        {/if}
    </div>
    {/foreach}
</section>

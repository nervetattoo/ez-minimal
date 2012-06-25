<!DOCTYPE html>
<html>
<head>
    {def $user_hash = concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

    {def $pagedata         = ezpagedata()
         $locales          = fetch( 'content', 'translation_list' )
         $pagedesign       = $pagedata.template_look
         $current_node_id  = $pagedata.node_id}

    {include uri='design:page_head.tpl'}
    {include uri='design:page_head_script.tpl'}

    {ezcss_load()}
    {ezcss(ezini('StylesheetSettings', 'EndUserCSSFileList', 'design.ini') )}

    {ezscript_require( array(
        ezini( 'JavaScriptSettings', 'JavaScriptList', 'design.ini' ),
        ezini( 'JavaScriptSettings', 'FrontendJavaScriptList', 'design.ini' ),
        'ezjsc::jquery'
    ))}

    <meta name="viewport" content="user-scalable=0;">
    <meta name="viewport" content="width=device-width; initial-scale=1.0; user-scalable=0;">
</head>

{* To simplify IE css targeting. IE9 conforms, so threat as rest *}
<!--[if lt IE 7 ]><body class="ie6"><![endif]-->
<!--[if IE 7 ]>   <body class="ie7"><![endif]-->
<!--[if IE 8 ]>   <body class="ie8"><![endif]-->
<!--[if (gt IE 8)|!(IE)]><!--><body><!--<![endif]-->

{include uri='design:page_toolbar.tpl'}

<div id="page" class="clear minimal">

    {def $menu = fetch('content', 'list', hash(
        'parent_node_id', 2,
        'sort_by', array('name', false())
        )
    )}
    <nav id="main-menu">
        <ul>
            <li>
                <a href={"/"|ezurl} title={"Go to frontpage"|i18n}>Home</a>
            </li>
        </ul>
        <h3>Content</h3>
        <ul>
        {foreach $menu as $node}
            {if $node.is_container}
            <li>
                <a href={$node.url_alias|ezurl} title={"Go to &raquo;%name&laquo;"|i18n("", "", hash("%name", $node.name))}>{$node.name}</a>
            </li>
            {/if}
        {/foreach}
        </ul>
    </nav>

    <div id="main">
        <section id="module-result">
        {$module_result.content}
        </section>
        {include uri=concat('design:parts/', $pagedata.show_path, '.tpl')}
    </div>

</div>

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->

</body>
</html>

{if is_set($module_result.content_info.persistent_variable.site_title)}
    {set scope=root site_title=$module_result.content_info.persistent_variable.site_title}
{else}
{let name=Path
     path=$module_result.path
     reverse_path=array()}
  {if is_set($pagedata.path_array)}
    {set path=$pagedata.path_array}
  {elseif is_set($module_result.title_path)}
    {set path=$module_result.title_path}
  {/if}
  {section loop=$:path}
    {set reverse_path=$:reverse_path|array_prepend($:item)}
  {/section}

{set-block scope=root variable=site_title}
{section loop=$Path:reverse_path}{$:item.text|wash}{delimiter} / {/delimiter}{/section} - {$site.title|wash}
{/set-block}

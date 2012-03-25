{* Example of resizeable
{include file='include/autosize.inc.tpl'}
*}
{if isset($MENUBAR)}{$MENUBAR}{/if}
<div id="content" {if isset($MENUBAR)}class="contentWithMenu"{/if}>
{if isset($errors) or not empty($infos)}
{include file='infos_errors.tpl'}
{/if}
{if !empty($PLUGIN_PICTURE_BEFORE)}{$PLUGIN_PICTURE_BEFORE}{/if}

<div id="imageHeaderBar">
	<div class="browsePath">
		{$SECTION_TITLE}<span class="browsePathSeparator">{$LEVEL_SEPARATOR}</span><h2>{$current.TITLE}</h2>
	</div>
</div>

<div id="imageToolBar">
<div class="imageNumber">{$PHOTO}</div>
<div class="actionButtons">

{if count($current.unique_derivatives)>1}
{footer_script}{literal}
function changeImgSrc(url,typeSave,typeMap)
{
	var theImg = document.getElementById("theMainImage");
	if (theImg)
	{
		theImg.removeAttribute("width");theImg.removeAttribute("height");
		theImg.src = url;
		theImg.useMap = "#map"+typeMap;
	}
  jQuery('.derivativeChecked').hide();
  jQuery('#derivativeChecked'+typeSave).show();
  jQuery('#derivativeSwitchBox .switchSelected').addClass('switchUnselected').removeClass('switchSelected');
  jQuery('#derivativeName'+typeSave).addClass('switchSelected').removeClass('switchUnselected');
	document.cookie = 'picture_deriv='+typeSave+';path={/literal}{$COOKIE_PATH}{literal}';
}

function toggleDerivativeSwitchBox()
{
	var elt = document.getElementById("derivativeSwitchBox"),
		ePos = document.getElementById("derivativeSwitchLink");
	if (elt.style.display==="none")
	{
		elt.style.position = "absolute";
		elt.style.left = (ePos.offsetLeft)+"px";
		elt.style.top = (ePos.offsetTop+ePos.offsetHeight)+"px";
		elt.style.display="";
	}
	else
		elt.style.display="none";
}
{/literal}{/footer_script}
{strip}<a id="derivativeSwitchLink" href="javascript:toggleDerivativeSwitchBox()" title="{'Photo sizes'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
<span class="pwg-icon pwg-icon-sizes">&nbsp;</span><span class="pwg-button-text">{'Photo sizes'|@translate}</span></a>
<div id="derivativeSwitchBox" class="switchBox" onclick="toggleDerivativeSwitchBox()" style="display:none" onmouseout="e=event.toElement||event.relatedTarget;e.parentNode==this||e==this||toggleDerivativeSwitchBox()">
<div class="switchBoxTitle">{'Photo sizes'|@translate}</div>
{foreach from=$current.unique_derivatives item=derivative key=derivative_type}
<span class="derivativeChecked switchCheck"
 id="derivativeChecked{$derivative_type}" {if $derivative->get_type() ne $current.selected_derivative->get_type()}style="display:none"{/if}>&#x2714; </span> 
<a href="javascript:changeImgSrc('{$derivative->get_url()|@escape:javascript}','{$derivative_type}','{$derivative->get_type()}')"
 id="derivativeName{$derivative_type}"
 class="{if $derivative->get_type() == $current.selected_derivative->get_type()}switchSelected{else}switchUnselected{/if}">
	{$derivative->get_type()|@translate}<span class="derivativeSizeDetails"> ({$derivative->get_size_hr()})</span>
</a><br>
{/foreach}
{if isset($U_ORIGINAL)}
<a href="javascript:phpWGOpenWindow('{$U_ORIGINAL}','xxx','scrollbars=yes,toolbar=no,status=no,resizable=yes')" rel="nofollow">{'Original'|@translate}</a>
{/if}
</div>
{/strip}{/if}


{strip}{if isset($U_SLIDESHOW_START)}
	<a href="{$U_SLIDESHOW_START}" title="{'slideshow'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-slideshow"> </span><span class="pwg-button-text">{'slideshow'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($U_METADATA)}
	<a href="{$U_METADATA}" title="{'Show file metadata'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-camera-info"> </span><span class="pwg-button-text">{'Show file metadata'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($current.U_DOWNLOAD)}
	<a href="{$current.U_DOWNLOAD}" title="{'Download this file'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-save"> </span><span class="pwg-button-text">{'Download'|@translate}</span>
	</a>
{/if}{/strip}
{if isset($PLUGIN_PICTURE_ACTIONS)}{$PLUGIN_PICTURE_ACTIONS}{/if}
{strip}{if isset($favorite)}
	<a href="{$favorite.U_FAVORITE}" title="{if $favorite.IS_FAVORITE}{'delete this photo from your favorites'|@translate}{else}{'add this photo to your favorites'|@translate}{/if}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-favorite-{if $favorite.IS_FAVORITE}del{else}add{/if}"> </span><span class="pwg-button-text">{'Favorites'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($U_SET_AS_REPRESENTATIVE)}
	<a href="{$U_SET_AS_REPRESENTATIVE}" title="{'set as album representative'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-representative"> </span><span class="pwg-button-text">{'representative'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($U_ADMIN)}
	<a href="{$U_ADMIN}" title="{'Modify information'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-edit"> </span><span class="pwg-button-text">{'Edit'|@translate}</span>
	</a>
{/if}{/strip}
{strip}{if isset($U_CADDIE)}{*caddie management BEGIN*}
{footer_script}
{literal}function addToCadie(aElement, rootUrl, id)
{
if (aElement.disabled) return;
aElement.disabled=true;
var y = new PwgWS(rootUrl);
y.callService(
	"pwg.caddie.add", {image_id: id} ,
	{
		onFailure: function(num, text) { alert(num + " " + text); document.location=aElement.href; },
		onSuccess: function(result) { aElement.disabled = false; }
	}
	);
}{/literal}
{/footer_script}
	<a href="{$U_CADDIE}" onclick="addToCadie(this, '{$ROOT_URL}', {$current.id}); return false;" title="{'Add to caddie'|@translate}" class="pwg-state-default pwg-button" rel="nofollow">
		<span class="pwg-icon pwg-icon-caddie-add"> </span><span class="pwg-button-text">{'Caddie'|@translate}</span>
	</a>
{/if}{/strip}{*caddie management END*}
</div>

	{include file='picture_nav_buttons.tpl'|@get_extent:'picture_nav_buttons'}
</div>{*<!-- imageToolBar -->*}

<div id="theImageAndInfos">
<div id="theImage">
{$ELEMENT_CONTENT}

{if isset($COMMENT_IMG)}
<p class="imageComment">{$COMMENT_IMG}</p>
{/if}

{if isset($U_SLIDESHOW_STOP)}
<p>
	[ <a href="{$U_SLIDESHOW_STOP}">{'stop the slideshow'|@translate}</a> ]
</p>
{/if}

</div><!--

--><div id="infoSwitcher"></div><!--
--><div id="imageInfos">
{if $DISPLAY_NAV_THUMB}
	<div class="navThumbs">
		{if isset($previous)}
			<a class="navThumb" id="linkPrev" href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE}" rel="prev">
				<span class="thumbHover prevThumbHover">&nbsp;</span>
				<img src="{$previous.derivatives.square->get_url()}" alt="{$previous.TITLE}">
			</a>
		{/if}
		{if isset($next)}
			<a class="navThumb" id="linkNext" href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE}" rel="next">
				<span class="thumbHover nextThumbHover">&nbsp;</span>
				<img src="{$next.derivatives.square->get_url()}" alt="{$next.TITLE}">
			</a>
		{/if}
	</div>
{/if}

<dl id="standard" class="infoTable">
{strip}
	{if $display_info.author}
	<div id="Author">
		<dt>{'Author'|@translate}</dt>
		<dd>{if isset($INFO_AUTHOR)}{$INFO_AUTHOR}{else}{'N/A'|@translate}{/if}</dd>
	</div>
	{/if}
	{if $display_info.created_on}
	<div id="datecreate">
		<dt>{'Created on'|@translate}</dt>
		<dd>{if isset($INFO_CREATION_DATE)}{$INFO_CREATION_DATE}{else}{'N/A'|@translate}{/if}</dd>
	</div>
	{/if}
	{if $display_info.posted_on}
	<div id="datepost">
		<dt>{'Posted on'|@translate}</dt>
		<dd>{$INFO_POSTED_DATE}</dd>
	</div>
	{/if}
	{if $display_info.dimensions}
	<div id="Dimensions">
		<dt>{'Dimensions'|@translate}</dt>
		<dd>{if isset($INFO_DIMENSIONS)}{$INFO_DIMENSIONS}{else}{'N/A'|@translate}{/if}</dd>
	</div>
	{/if}
	{if $display_info.file}
	<div id="File">
		<dt>{'File'|@translate}</dt>
		<dd>{$INFO_FILE}</dd>
	</div>
	{/if}
	{if $display_info.filesize}
	<div id="Filesize">
		<dt>{'Filesize'|@translate}</dt>
		<dd>{if isset($INFO_FILESIZE)}{$INFO_FILESIZE}{else}{'N/A'|@translate}{/if}</dd>
	</div>
	{/if}
	{if $display_info.tags }
	<div id="Tags">
		<dt>{'Tags'|@translate}</dt>
		<dd>
			{if isset($related_tags)}
				{foreach from=$related_tags item=tag name=tag_loop}{if !$smarty.foreach.tag_loop.first}, {/if}<a href="{$tag.URL}">{$tag.name}</a>{/foreach}
			{else}&nbsp;
			{/if}
		</dd>
	</div>
	{/if}
	{if $display_info.categories}
<!--	<div id="Categories">-->
		<dt>{'Albums'|@translate}</dt>
		<dd>
			{if isset($related_categories)}
			<ul>
				{foreach from=$related_categories item=cat}
				<li>{$cat}</li>
				{/foreach}
			</ul>
			{/if}
		</dd>
<!--	</div>-->
	{/if}
	{if $display_info.visits}
	<div id="Visits">
		<dt>{'Visits'|@translate}</dt>
		<dd>{$INFO_VISITS}</dd>
	</div>
	{/if}

{if $display_info.rating_score and isset($rate_summary)}
	<div id="Average">
		<dt>{'Rating score'|@translate}</dt>
		<dd>
		{if $rate_summary.count}
			<span id="ratingScore">{$rate_summary.score}</span> <span id="ratingCount">({assign var='rate_text' value='%d rates'|@translate}{$pwg->sprintf($rate_text, $rate_summary.count)})</span>
		{else}
			<span id="ratingScore">{'no rate'|@translate}</span> <span id="ratingCount"></span>
		{/if}
		</dd>
	</div>
{/if}

{if isset($rating)}
	<div id="rating">
		<dt>
			<span id="updateRate">{if isset($rating.USER_RATE)}{'Update your rating'|@translate}{else}{'Rate this photo'|@translate}{/if}</span>
		</dt>
		<dd>
			<form action="{$rating.F_ACTION}" method="post" id="rateForm" style="margin:0;">
			<div>
			{foreach from=$rating.marks item=mark name=rate_loop}
			{if isset($rating.USER_RATE) && $mark==$rating.USER_RATE}
				<input type="button" name="rate" value="{$mark}" class="rateButtonSelected" title="{$mark}">
			{else}
				<input type="submit" name="rate" value="{$mark}" class="rateButton" title="{$mark}">
			{/if}
			{/foreach}
			{strip}{combine_script id='core.scripts' load='async' path='themes/default/js/scripts.js'}
			{combine_script id='rating' load='async' require='core.scripts' path='themes/default/js/rating.js'}
			{footer_script}
				var _pwgRatingAutoQueue = _pwgRatingAutoQueue||[];
				_pwgRatingAutoQueue.push( {ldelim}rootUrl: '{$ROOT_URL}', image_id: {$current.id},
					onSuccess : function(rating) {ldelim}
						var e = document.getElementById("updateRate");
						if (e) e.innerHTML = "{'Update your rating'|@translate|@escape:'javascript'}";
						e = document.getElementById("ratingScore");
						if (e) e.innerHTML = rating.score;
						e = document.getElementById("ratingCount");
						if (e) e.innerHTML = "({'%d rates'|@translate|@escape:'javascript'})".replace( "%d", rating.count);
					{rdelim}{rdelim} );
			{/footer_script}
			{/strip}
			</div>
			</form>
		</dd>
	</div>
{/if}

{if $display_info.privacy_level and isset($available_permission_levels)}
	<div id="Privacy">
		<dt><a id="privacyLevelLink" href="javascript:togglePrivacyLevelBox()">{'Who can see this photo?'|@translate}</a></dt>
		<dd>
{combine_script id='core.scripts' require='jquery' load='async' path='themes/default/js/scripts.js'}
{footer_script}
{literal}function setPrivacyLevel(rootUrl, id, level)
{
var y = new PwgWS(rootUrl);
y.callService(
	"pwg.images.setPrivacyLevel", {image_id: id, level:level} ,
	{
		method: "POST",
		onFailure: function(num, text) { alert(num + " " + text); },
		onSuccess: function(result) {
			  jQuery('.levelCheck').hide();
			  jQuery('#levelCheck'+level).show();
			  jQuery('#privacyLevelBox .switchSelected').addClass('switchUnselected').removeClass('switchSelected');
			  jQuery('#switchLevel'+level).addClass('switchSelected').removeClass('switchUnselected');
		}
	}
	);
}
function togglePrivacyLevelBox()
{
	var elt = document.getElementById("privacyLevelBox"),
		ePos = document.getElementById("privacyLevelLink");
	if (elt.style.display == "none")
	{
		elt.style.position = "absolute";
		elt.style.left = (ePos.offsetLeft)+"px";
		elt.style.top = (ePos.offsetTop+ePos.offsetHeight)+"px";
		elt.style.display="";
	}
	else
		elt.style.display="none";
}
{/literal}
{/footer_script}
	
			<div id="privacyLevelBox" class="switchBox" onclick="togglePrivacyLevelBox()" style="display:none" onmouseout="e=event.toElement||event.relatedTarget;e.parentNode==this||e==this||togglePrivacyLevelBox()">
				{foreach from=$available_permission_levels item=label key=level}
					<span id="levelCheck{$level}" class="levelCheck switchCheck" {if $level != $current.level}style="display:none;"{/if}>&#x2714; </span>
					<a id="switchLevel{$level}" {if $level == $current.level}class="switchSelected"{else}class="switchUnselected"{/if} href="javascript:setPrivacyLevel('{$ROOT_URL}', {$current.id}, {$level})">{$label}</a><br>
				{/foreach}
			</div>

		</dd>
	</div>
{/if}
{/strip}
</dl>

{if isset($metadata)}
<dl id="Metadata" class="infoTable2">
{foreach from=$metadata item=meta}
	<h3>{$meta.TITLE}</h3>
	{foreach from=$meta.lines item=value key=label}
		<dt>{$label}</dt>
		<dd>{$value}</dd>
	{/foreach}
{/foreach}
</dl>
{/if}
</div>
</div>

{if isset($COMMENT_COUNT)}
<div id="comments" {if (!isset($comment_add) && ($COMMENT_COUNT == 0))}class="noCommentContent"{else}class="commentContent"{/if}><div id="commentsSwitcher"></div>
	{if $COMMENT_COUNT > 0}
		<h3>{$pwg->l10n_dec('%d comment', '%d comments',$COMMENT_COUNT)}</h3>
		{if $COMMENT_COUNT > 2}
			<a href="{$COMMENTS_ORDER_URL}#comments" rel="nofollow">{$COMMENTS_ORDER_TITLE}</a>
		{/if}
	{else}
		<h3 class="noCommentText">{$pwg->l10n_dec('%d comment', '%d comments',$COMMENT_COUNT)}</h3>
	{/if}
	{if !empty($navbar)}{include file='navigation_bar.tpl'|@get_extent:'navbar'}{/if}

	{if isset($comments)}
		{include file='comment_list.tpl'}
	{/if}

	{if isset($comment_add)}
	<form method="post" action="{$comment_add.F_ACTION}" class="filter" id="addComment">
	<fieldset>
		<legend>{'Add a comment'|@translate}</legend>
		{if $comment_add.SHOW_AUTHOR}
		<label>{'Author'|@translate}<input type="text" name="author"></label>
		{/if}
		<label>{'Comment'|@translate}<textarea name="content" id="contentid" rows="5" cols="80">{$comment_add.CONTENT}</textarea></label>
		<input type="hidden" name="key" value="{$comment_add.KEY}">
		<input type="submit" value="{'Submit'|@translate}">
	</fieldset>
	</form>
	{/if}
</div>
{/if}{*comments*}

{if !empty($PLUGIN_PICTURE_AFTER)}{$PLUGIN_PICTURE_AFTER}{/if}

</div>
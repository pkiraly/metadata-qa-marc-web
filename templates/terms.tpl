{include 'common/html-head.tpl'}
<div class="container">
  {include 'common/header.tpl'}
  {include 'common/nav-tabs.tpl'}
  <div class="tab-content" id="myTabContent">
    <div class="tab-pane active" id="terms" role="tabpanel" aria-labelledby="terms-tab">
      <h2>Terms</h2>
      {if $scheme == ''}
        <form id="facetselection">
          <input type="hidden" name="tab" value="terms" />
          <input type="hidden" name="query" value="{$query}" />
          <select name="facet">
            <option value="">-- select --</option>
            {foreach $solrFields as $field}
              <option value="{$field}"{if $field == $facet} selected="selected"{/if}>{$field}</option>
            {/foreach}
          </select>
          <button type="submit" class="btn">
            <i class="fa fa-search" aria-hidden="true"></i> Term list
          </button>
        </form>
      {/if}

      {if $scheme != ''}
        <div>vocabulary: <strong>{$scheme|htmlentities}</strong></div>
      {elseif $facet != ''}
        <div>query: {$query|htmlentities}</div>
      {/if}
      <div id="terms-content">
        {include 'marc-facets.tpl'}
      </div>
    </div>
  </div>
</div>
{include 'common/html-footer.tpl'}
{include 'common/html-head.tpl'}
<div class="container">
  {include 'common/header.tpl'}
  {include 'common/nav-tabs.tpl'}
  <div class="tab-content" id="myTabContent">
    <div class="tab-pane active" id="classifications" role="tabpanel" aria-labelledby="classifications-tab">
      <h2>Subject analysis</h2>
      <div id="classifications-content">
        {include 'classifications-by-records.tpl'}
        {include 'classifications-histogram.tpl'}
        {include 'classifications-by-field.tpl'}
      </div>
    </div>
  </div>
</div>
{include 'common/html-footer.tpl'}
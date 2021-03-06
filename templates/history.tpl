{include 'common/html-head.tpl'}
<div class="container">
  {include 'common/header.tpl'}
  {include 'common/nav-tabs.tpl'}
  <div class="tab-content" id="myTabContent">
    <div class="tab-pane active" id="history" role="tabpanel" aria-labelledby="history-tab">
      <h2>History of cataloging</h2>

      <p>The Y axis is based on the "date entered on file" data element that indicates the date the MARC record was created (008/00-05),
        the X axis is based on "Date 1" element (008/07-10).</p>

      <p>This chart was implemented based on Benjamin Schmidt's blog post
        <a href="http://sappingattention.blogspot.com/2017/05/a-brief-visual-history-of-marc.html">A brief visual history of MARC cataloging at the Library of Congress.</a>
        (Tuesday, May 16, 2017).
      </p>

      <div id="history-content">
        {foreach $files as $index => $file}
          <p><img src="images/{$db}/{$file}" width="1000"/></p>
        {/foreach}
      </div>
    </div>
  </div>
</div>
{include 'common/html-footer.tpl'}

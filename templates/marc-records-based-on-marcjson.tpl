{foreach $docs as $doc}
  {assign var="record" value=$controller->getRecord($doc)}
  {assign var="id" value=$doc->id|regex_replace:"/ +$/":""}
  {assign var="type" value=$record->getFirstField('type_ss')}
  <div class="record">
    <h2>
      <i class="fa fa-{$record->type2icon($type)}" title="type: {$type}"></i>
      <strong>{$id}</strong>
      <a href="#" class="record-details" data="details-{$id}" title="display details"><i class="fa fa-info-circle" aria-hidden="true"></i></a>
      <a href="{$record->opacLink($doc->id)}" target="_blank" title="Display record in the library catalogue"><i class="fa fa-external-link" aria-hidden="true"></i></a>
    </h2>
    {include 'marc/245.tpl'}
    {* include 'marc/773.tpl' *}
        {*
      {assign var="tag245" value=$record->getField('245')}
      {assign var="tag773" value=$record->getField('773')}
      {if isset($tag245->subfields->a) || isset($tag245->subfields->b)}
        {include 'conditional-foreach.tpl' obj=$tag245->subfields key='a'}
        {include 'conditional-foreach.tpl' obj=$tag245->subfields key='b'}
      {elseif isset($tag773)}
        {include 'conditional-foreach.tpl' obj=$tag773->subfields key='t'}
        {if isset($tag245->subfields->n)}
          {include 'conditional-foreach.tpl' obj=$tag245->subfields key='n'}
        {/if}
      {/if}
       *}
    {* 245c_Title_responsibilityStatement_ss *}
    {if isset($tag245->subfields->c)}
      {include 'conditional-foreach.tpl' obj=$tag245->subfields key='c'
        label='<i class="fa fa-pencil" aria-hidden="true"></i>' suffix='<br/>'}
    {* 773a_PartOf_ss *}
    {elseif isset($tag773->subfields->a)}
      {include 'conditional-foreach.tpl' obj=$tag773->subfields key='a'
        label='<i class="fa fa-pencil" aria-hidden="true"></i>' suffix='<br/>'}
    {/if}

    {* 250a_Edition_editionStatement_ss *}
    {assign var="fieldInstances" value=$record->getFields('250')}
    {if !is_null($fieldInstances)}
      {foreach $fieldInstances as $field}
        {if isset($field->subfields->a)}
          <span class="250a_Edition_editionStatement_ss">{$field->subfields->a}</span>
        {/if}
      {/foreach}
      <br/>
    {/if}

    {if $record->hasPublication()}
      {* 250a_Edition_editionStatement_ss *}
      {assign var="tag260" value=$record->getField('260')}
      <i class="fa fa-calendar" aria-hidden="true"></i>
      Published
      {* 260a_Publication_place_ss *}
      {include 'conditional-foreach.tpl' obj=$tag260->subfields key='a' label='in' tag='260a'}
      {* 260b_Publication_agent_ss *}
      {include 'conditional-foreach.tpl' obj=$tag260->subfields key='b' label='by' tag='260b'}
      {* 260c_Publication_date_ss *}
      {include 'conditional-foreach.tpl' obj=$tag260->subfields key='c' label='in' tag='260c'}
      <br/>
    {/if}

    {include 'marc/264.tpl'}

    {if $record->hasPhysicalDescription()}
      {assign var="tag300" value=$record->getField('300')}
      {* 300a_PhysicalDescription_extent_ss *}
      {include 'conditional-foreach.tpl' obj=$tag300->subfields key='a' tag='300a'}
      {* 300c_PhysicalDescription_dimensions_ss *}
      {include 'conditional-foreach.tpl' obj=$tag300->subfields key='b' tag='300b'}
      {* 300c_PhysicalDescription_dimensions_ss *}
      {include 'conditional-foreach.tpl' obj=$tag300->subfields key='c' tag='300c'}
      <br/>
    {/if}

    {* Series Statement *}
    {include 'marc/490.tpl'}

    {* Dates of Publication *}
    {include 'marc/362.tpl'}

    {* 520a_Summary_ss *}
    {assign var="tag520s" value=$record->getFields('520')}
    {if !is_null($tag520s)}
      <!-- 520a_Summary_ss -->
      {foreach $tag520s as $field}
        {include 'conditional-foreach.tpl' obj=$field->subfields key='a' suffix='<br/>'}
      {/foreach}
    {/if}

    {* 505a_TableOfContents_ss *}
    {assign var="tag505s" value=$record->getFields('505')}
    {if !is_null($tag505s)}
      <!-- 505a_TableOfContents_ss -->
      {foreach $tag505s as $field}
        {include 'conditional-foreach.tpl' obj=$field->subfields key='a' suffix='<br/>'}
      {/foreach}
    {/if}

    {* Host Item Entry *}
    {assign var="fieldInstances" value=$record->getFields('773')}
    {if !is_null($fieldInstances)}
      {foreach $fieldInstances as $field}
        <span class="773">
          {if isset($field->subfields->a)}
            <span class="main-entry">{$field->subfields->a}</span>
          {/if}
          {if isset($field->subfields->b)}
            <span class="edition">{$field->subfields->b}</span>
          {/if}
          {if isset($field->subfields->d)}
            <span class="place-publisher-dates">{$field->subfields->d}</span>
          {/if}
          {if isset($field->subfields->t)}
            <span class="title">{$field->subfields->t}</span>
          {/if}
          {if isset($field->subfields->x)}
            <span class="issn">{$field->subfields->x}</span>
          {/if}
          {if isset($field->subfields->g)}
            <span class="related-parts">{$field->subfields->g}</span>
          {/if}
          {if isset($field->subfields->w)}
            <span class="record-control-number">{$field->subfields->w}</span>
          {/if}
        </span>
        <br/>
      {/foreach}
    {/if}

    {if $record->hasAuthorityNames() || $record->hasSubjectHeadings()}
      <table class="authority-names">
      {if $record->hasAuthorityNames()}
        <tr><td colspan="2" class="heading">Authority names</td></tr>
        {* TODO: 740, 751, 752, 753, 754, 800, 810, 811, 830 *}
        {* Main personal names *}
        {include 'marc/100.tpl'}
        {* Main corporate names *}
        {include 'marc/110.tpl'}
        {* Main meeting names *}
        {include 'marc/111.tpl'}
        {* Main meeting names *}
        {include 'marc/130.tpl'}
        {* Additional personal names *}
        {include 'marc/700.tpl'}
        {* Additional corporate names *}
        {include 'marc/710.tpl'}
        {* Additional meeting names *}
        {include 'marc/711.tpl'}
        {* uncontrolled name *}
        {include 'marc/720.tpl'}
        {* Additional uniform title *}
        {include 'marc/730.tpl'}
      {/if}

      {if $record->hasSubjectHeadings()}
        <tr><td colspan="2" class="heading">Subjects</td></tr>
        {* TODO: 055, 654, 656, 657, 658, 662 *}
        {* geographic classification *}
        {include 'marc/052.tpl'}
        {* subject category code *}
        {include 'marc/072.tpl'}
        {* UDC *}
        {include 'marc/080.tpl'}
        {* Dewey Decimal Classification *}
        {include 'marc/082.tpl'}
        {* Additional Dewey Decimal Classification *}
        {include 'marc/083.tpl'}
        {* other classifications *}
        {include 'marc/084.tpl'}
        {* synthesized classifications *}
        {include 'marc/085.tpl'}
        {* government document classifications *}
        {include 'marc/086.tpl'}
        {* Personal names as subjects *}
        {include 'marc/600.tpl'}
        {* Corporate names as subjects *}
        {include 'marc/610.tpl'}
        {* Meeting names as subjects *}
        {include 'marc/611.tpl'}
        {* Uniform title as subjects *}
        {include 'marc/630.tpl'}
        {* named event *}
        {include 'marc/647.tpl'}
        {* chronological term *}
        {include 'marc/648.tpl'}
        {* Topics *}
        {include 'marc/650.tpl'}
        {* Geographic names *}
        {include 'marc/651.tpl'}
        {* Uncontrolled Index Term *}
        {include 'marc/653.tpl'}
        {* Genres *}
        {include 'marc/655.tpl'}
      {/if}
      </table>
    {/if}

    {* Cataloging Source *}
    {include 'marc/040.tpl'}

    {if $record->hasSimilarBooks()}
      <div class="similarity">
        <i class="fa fa-search" aria-hidden="true"></i>
        Search for similar items:
        {if isset($doc->{'9129_WorkIdentifier_ss'})}
          works:
          <a href="{$record->filter('9129_WorkIdentifier_ss', $doc->{'9129_WorkIdentifier_ss'})}" class="record-link">{$doc->{'9129_WorkIdentifier_ss'}}</a>
        {/if}
        {if isset($doc->{'9119_ManifestationIdentifier_ss'})}
          manifestations:
          <a href="{$record->filter('9119_ManifestationIdentifier_ss', $doc->{'9119_ManifestationIdentifier_ss'})}" class="record-link">{$doc->{'9119_ManifestationIdentifier_ss'}}</a>
        {/if}
      </div>
    {/if}

    <div class="details" id="details-{$id}">
      <ul class="nav nav-tabs" id="record-views-{$id}">
        <li class="nav-item">
          <a class="nav-link active" data-toggle="tab" role="tab" aria-selected="true"
             id="marc-raw-tab-{$id}" href="#marc-raw-{$id}"
             aria-controls="marc-raw-tab">MARC21</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" role="tab" aria-selected="true"
             id="marc-leader-tab-{$id}" href="#marc-leader-{$id}"
             aria-controls="marc-leader-tab">Leader explained</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" role="tab" aria-selected="true"
             id="marc-008-tab-{$id}" href="#marc-008-{$id}"
             aria-controls="marc-008-tab">008 explained</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" role="tab" aria-selected="false"
             id="marc-human-tab-{$id}" href="#marc-human-{$id}"
             aria-controls="marc-human-tab">labels</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="tab" role="tab" aria-selected="false"
             id="marc-issue-tab-{$id}" href="{$record->issueLink($id)}"
             aria-controls="marc-issue-tab" data-id="{$id}">issues</a>
        </li>
      </ul>

      <div class="tab-content" id="details-tab-{$id}">
        <div class="tab-pane active" id="marc-raw-{$id}" role="tabpanel" aria-labelledby="data-tab">
          <div class="marc-details" id="marc-details-{$id}">
            {if isset($doc->record_sni)}
              <table>
                {foreach $record->getMarcFields() as $row}
                  <tr>
                    {foreach $row as $cell}
                      <td>{$cell}</td>
                    {/foreach}
                  </tr>
                {/foreach}
              </table>
            {/if}
          </div>
        </div>
        <div class="tab-pane marc-leader" id="marc-leader-{$id}" role="tabpanel" aria-labelledby="data-tab">
          {include 'marc/leader.tpl'}
        </div>
        <div class="tab-pane marc-008" id="marc-008-{$id}" role="tabpanel" aria-labelledby="data-tab">
          {include 'marc/008.tpl'}
        </div>
        <div class="tab-pane" id="marc-human-{$id}" role="tabpanel" aria-labelledby="data-tab">
          <ul>
            {foreach $record->getAllSolrFields() as $field}
              <li>
                <span class="label">{$field->label}:</span>
                {foreach $field->value as $value}
                  {$value}{if !$value@last} &mdash; {/if}
                {/foreach}
              </li>
            {/foreach}
          </ul>
        </div>
        <div class="tab-pane" id="marc-issue-{$id}" role="tabpanel" aria-labelledby="data-tab">
          <p>Retrieving issues detected in this MARC record (if any). It might take for a while.</p>
        </div>
      </div>
    </div>
  </div>
{/foreach}
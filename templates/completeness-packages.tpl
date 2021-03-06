<table>
  <thead>
    <tr>
      <th>tags</th>
      <th>label</th>
      <th></th>
      <th class="text-right">count</th>
      <th class="text-right">%</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="5"><h4>Fields defined in MARC21</h4></td>
    </tr>
    {foreach $packages as $package}
      {assign var=percent value="{$package->count * 100 / $max}"}
      {if !isset($package->iscoretag) || $package->iscoretag}
        <tr>
          <td><a href="#package-{$package->packageid}">{$package->name}</a></td>
          <td>{if ($package->label != 'null')}{$package->label}{/if}</td>
          <td class="chart"><div style="width: {ceil($percent * 2)}px;">&nbsp;</div></td>
          <td class="text-right">{$package->count|number_format}</td>
          <td class="text-right">{$percent|number_format:2}</td>
        </tr>
      {/if}
    {/foreach}
    {if $hasNonCoreTags}
      <tr>
        <td colspan="5"><h4>Fields defined in extensions of MARC</h4></td>
      </tr>
      {foreach $packages as $package}
        {assign var=percent value="{$package->count * 100 / $max}"}
        {if isset($package->iscoretag) && !$package->iscoretag}
          <tr>
            <td><a href="#package-{$package->packageid}">{$package->name}</a></td>
            <td>{if ($package->label != 'null')}{$package->label}{/if}</td>
            <td class="chart"><div style="width: {ceil($percent * 2)}px;">&nbsp;</div></td>
            <td class="text-right">{$package->count|number_format}</td>
            <td class="text-right">{$percent|number_format:2}</td>
          </tr>
        {/if}
      {/foreach}
    {/if}
  </tbody>
</table>

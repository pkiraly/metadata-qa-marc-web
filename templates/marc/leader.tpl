<p>Leader: {getLeader($doc, 'Leader_ss')}<br/>
  type*: {getLeader($doc, 'type_ss')}
</p>
<table>
  <thead>
  <tr>
    <th>pos.</th>
    <th>field</th>
    <th>value</th>
    <th>meaning</th>
  </tr>
  </thead>
  <tbody>
  <tr>
    <td>00-04</td>
    <td>length:</td>
    <td>{getLeaderByPosition($doc, 0, 4)}</td>
    <td>{* getLeader($doc, 'Leader_00-04_recordLength_ss') *}</td>
  </tr>
  <tr>
    <td>05</td>
    <td>record status:</td>
    <td>{getLeaderByPosition($doc, 5)}</td>
    <td>{getLeader($doc, 'Leader_05_recordStatus_ss')}</td>
  </tr>
  <tr>
    <td>06</td>
    <td>type of record:</td>
    <td>{getLeaderByPosition($doc, 6)}</td>
    <td>{getLeader($doc, 'Leader_06_typeOfRecord_ss')}</td>
  </tr>
  <tr>
    <td>07</td>
    <td>bibliographic level:</td>
    <td>{getLeaderByPosition($doc, 7)}</td>
    <td>{getLeader($doc, 'Leader_07_bibliographicLevel_ss')}</td>
  </tr>
  <tr>
    <td>08</td>
    <td>type of control:</td>
    <td>{getLeaderByPosition($doc, 8)}</td>
    <td>{getLeader($doc, 'Leader_08_typeOfControl_ss')}</td>
  </tr>
  <tr>
    <td>09</td>
    <td>character coding scheme:</td>
    <td>{getLeaderByPosition($doc, 9)}</td>
    <td>{getLeader($doc, 'Leader_09_characterCodingScheme_ss')}</td>
  </tr>
  <tr>
    <td>10</td>
    <td>indicator count:</td>
    <td>{getLeaderByPosition($doc, 10)}</td>
    <td>{* getLeader($doc, 'Leader_10_indicatorCount_ss') *}</td>
  </tr>
  <tr>
    <td>11</td>
    <td>subfield code count:</td>
    <td>{getLeaderByPosition($doc, 11)}</td>
    <td>{* getLeader($doc, 'Leader_11_subfieldCodeCount_ss') *}</td>
  </tr>
  <tr>
    <td>12-16</td>
    <td>base address of data:</td>
    <td>{getLeaderByPosition($doc, 12, 16)}</td>
    <td>{* getLeader($doc, 'Leader_12-16_baseAddressOfData_ss') *}</td>
  </tr>
  <tr>
    <td>17</td>
    <td>encoding level:</td>
    <td>{getLeaderByPosition($doc, 17)}</td>
    <td>{getLeader($doc, 'Leader_17_encodingLevel_ss')}</td>
  </tr>
  <tr>
    <td>18</td>
    <td>descriptive cataloging form:</td>
    <td>{getLeaderByPosition($doc, 18)}</td>
    <td>{getLeader($doc, 'Leader_18_descriptiveCatalogingForm_ss')}</td>
  </tr>
  <tr>
    <td>19</td>
    <td>multipart resource record level:</td>
    <td>{getLeaderByPosition($doc, 19)}</td>
    <td>{getLeader($doc, 'Leader_19_multipartResourceRecordLevel_ss')}</td>
  </tr>
  <tr>
    <td>20</td>
    <td>length of field portion:</td>
    <td>{getLeaderByPosition($doc, 20)}</td>
    <td>{* getLeader($doc, 'Leader_20_lengthOfTheLengthOfFieldPortion_ss') *}</td>
  </tr>
  <tr>
    <td>21</td>
    <td>length of the starting character position portion:</td>
    <td>{getLeaderByPosition($doc, 21)}</td>
    <td>{* getLeader($doc, 'Leader_21_lengthOfTheStartingCharacterPositionPortion_ss') *}</td>
  </tr>
  <tr>
    <td>22</td>
    <td>length of the implementation defined portion:</td>
    <td>{getLeaderByPosition($doc, 22)}</td>
    <td>{* getLeader($doc, 'Leader_22_lengthOfTheImplementationDefinedPortion_ss') *}</td>
  </tr>
  <tr>
    <td>23</td>
    <td>undefined</td>
    <td>0</td>
    <td></td>
  </tr>
  </tbody>
</table>

<p>* Type comes from the combination of type of record (06) and bibliographic level (07) positions.
  See 'Dependencies' section of
  <a href="https://www.loc.gov/marc/bibliographic/bdleader.html" target="_blank">Leader</a></p>
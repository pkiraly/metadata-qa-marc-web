<?php


class FunctionalAnalysisHistogram extends BaseTab {

  public function prepareData(Smarty &$smarty) {
    parent::prepareData($smarty);

    $this->output = 'none';
    $this->read('functional-analysis-histogram');
  }

  public function getTemplate() {
    return 'history.tpl';
  }

  private function read($filename) {
    $elementsFile = $this->getFilePath($filename . '.csv');
    if (file_exists($elementsFile)) {
      $lineNumber = 0;
      $header = [];
      $in = fopen($elementsFile, "r");
      $groupped_csv = [];
      while (($line = fgets($in)) != false) {
        $lineNumber++;
        $values = str_getcsv($line);
        if ($lineNumber == 1) {
          $header = $values;
          $current_function = '';
          $function_report = [];
          $groupped_csv[] = $header;
        } else {
          if (count($header) != count($values)) {
            error_log('line #' . $lineNumber . ': ' . count($header) . ' vs ' . count($values));
          }
          $record = (object)array_combine($header, $values);
          if ($record->frbrfunction != $current_function) {
            if ($current_function != '') {
              $this->addFunctionReport($current_function, $function_report, $groupped_csv);
            }
            $function_report = [];
            $current_function = $record->frbrfunction;
          }

          $rounded = round($record->score * 100);
          if (!isset($function_report[$rounded])) {
            $function_report[$rounded] = $record->count;
          } else {
            $function_report[$rounded] += $record->count;
          }
        }
      }
      $this->addFunctionReport($current_function, $function_report, $groupped_csv);
      fclose($in);

      header("Content-type: text/csv");
      echo $this->formatAsCsv($groupped_csv);
    }
  }

  private function addFunctionReport($current_function, $function_report, &$groupped_csv) {
    foreach ($function_report as $score => $count) {
      $groupped_csv[] = [$current_function, $score, $count];
    }
  }

  private function formatAsCsv($groupped_csv) {
    $lines = [];
    foreach ($groupped_csv as $row) {
      $lines[] = join(',', $row);
    }
    return join("\n", $lines);
  }
}
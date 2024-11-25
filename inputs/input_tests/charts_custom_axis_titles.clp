size: 2048px 1024px;
dpi: 240;
limit-x: 1404278100 1404299700;

axes {
  label-format-left: scientific();
  title-left: "Value";
  title-font-size-left: 14pt;
  label-format-right: scientific();
  title-right: "Value";
  title-rotate-right: 90;
  title-font-size-right: 14pt;
  label-format-top: datetime("%H:%M");
  title-top: "Time";
  title-font-size-top: 14pt;
  label-format-bottom: datetime("%H:%M");
  title-bottom: "Time";
  title-font-size-bottom: 14pt;
}

lines {
  data-x: csv("inputs/csv_data/measurement.csv" time);
  data-y: csv("inputs/csv_data/measurement.csv" value1);
}

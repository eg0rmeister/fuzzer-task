size: 1200px 480px;
dpi: 96;
limit-x: 0 150;
limit-y: 1404278100 1404299700;

axes {
  position: left bottom;
  label-format-y: datetime("%H:%M:%S");
}

areas {
  data-x: csv("inputs/csv_data/measurement.csv" value2);
  data-y: csv("inputs/csv_data/measurement.csv" time);
  direction: horizontal;
  color: #999;
}

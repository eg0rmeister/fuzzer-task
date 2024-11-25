size: 2048px 512px;
dpi: 180;
limit-x: 1404278100 1404299700;
limit-y: 6000000 10000000;

axes {
  position: bottom left;
  label-format-y: scientific();
  label-format-x: datetime("%H:%M:%S");
  label-placement-x: linear-align(1800);
}

lines {
  data-x: csv("inputs/csv_data/measurement.csv" time);
  data-y: csv("inputs/csv_data/measurement.csv" value1);
  color: #06c;
}

legend {
  position: top right;

  item {
    label: "Random Data";
    color: #06c;
  }
}

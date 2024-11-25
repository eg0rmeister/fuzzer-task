size: 1024px 512px;
dpi: 96;
limit-y: 0 20000000;
limit-x: 1404278100 1404299700;

axes {
  position: bottom left;
  label-format-y: scientific();
  label-format-x: datetime("%H:%M:%S");
}

grid {
  color: #fff;
}

areas {
  data-x: csv("inputs/csv_data/measurement.csv" time);
  data-y: csv("inputs/csv_data/measurement.csv" value1);
  color: #888;
}

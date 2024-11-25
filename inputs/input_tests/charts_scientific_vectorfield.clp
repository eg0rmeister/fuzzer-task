size: 2048px 1024px;
dpi: 240;
font: "Latin Modern Roman";
limit-x: -4 4;
limit-y: -2 2;

axes {
}

vectors {
  size: 1pt;
  data-x: csv("inputs/csv_data/vectorfield.csv" x);
  data-y: csv("inputs/csv_data/vectorfield.csv" y);
  data-dx: csv("inputs/csv_data/vectorfield.csv" dx);
  data-dy: csv("inputs/csv_data/vectorfield.csv" dy);
}

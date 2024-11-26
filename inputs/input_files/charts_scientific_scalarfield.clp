size: 2048px 1024px;
dpi: 240;
font: "Latin Modern Roman";
limit-x: -500 500;
limit-y: -200 200;

axes {
}

rectangles {
  data-x: csv(inputs/csv_data/field2d.csv x);
  data-y: csv(inputs/csv_data/field2d.csv y);
  data-size: 10;
  colors: csv(inputs/csv_data/field2d.csv a);
  color-map: gradient(0 #fff 1.0 #000);
}

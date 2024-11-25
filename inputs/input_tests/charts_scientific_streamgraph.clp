size: 2048px 768px;
dpi: 240;
font: "Latin Modern Roman";
limit-y: -80 80;

axes {
  limit-x: 0 1;
}

grid {
  color: rgba(0 0 0 0.05);
  stroke-style: dashed;
  tick-placement-y: none;
}

areas {
  data-x: csv("inputs/csv_data/areadata2.csv" x);
  data-y: csv("inputs/csv_data/areadata2.csv" z);
  data-y-low: csv("inputs/csv_data/areadata2.csv" y);
  stroke-width: 1pt;
  fill: hatch(angle(65) width(.8pt) stride(3.5pt));
}

areas {
  data-x: csv("inputs/csv_data/areadata2.csv" x);
  data-y: csv("inputs/csv_data/areadata2.csv" z2);
  data-y-low: csv("inputs/csv_data/areadata2.csv" y2);
  stroke-width: 1pt;
  fill: #eee;
}

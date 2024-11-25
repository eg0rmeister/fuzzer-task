size: 1600px 900px;
dpi: 240;
font: "Latin Modern Roman";
scale-x: categorical(A B C D E F);
limit-y: -10 70;

legend {
  position: bottom center;
  margin-bottom: 1em;
  item-flow: on;

  item {
    label: "Series A";
    marker-shape: custom "▢";
  }

  item {
    label: "Series B";
    marker-shape: square-hatch-diag-right;
  }
}

axes {
  margin-bottom: 3.6em;
  label-placement-bottom: none;
  label-placement-y: linear-interval(10 0 60);
}

grid {
  stroke-color: #000;
  stroke-style: dashed;
  tick-placement-x: categorical-bounds;
  tick-placement-y: none;
}

bars {
  data-x: csv("inputs/csv_data/bardata.csv" var3);
  data-y: csv("inputs/csv_data/bardata.csv" var1);
  data-y-low: csv("inputs/csv_data/bardata.csv" var2);
  width: 1em;
  offset: -.8em;
  stroke-width: .8pt;
  fill: none;
}

bars {
  data-x: csv("inputs/csv_data/bardata.csv" var3);
  data-y: csv("inputs/csv_data/bardata.csv" var4);
  data-y-low: csv("inputs/csv_data/bardata.csv" var5);
  width: 1em;
  offset: .8em;
  stroke-width: .8pt;
  fill: hatch;
}

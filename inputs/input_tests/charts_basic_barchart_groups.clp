size: 2048px 512px;
dpi: 240;
scale-x: categorical(A B C D E F);
limit-y: 0 80;

axes {
  label-placement-y: linear-interval(10 10 70);
}

grid {
  color: rgba(0 0 0 0.05);
  stroke-style: dashed;
  tick-placement-x: none;
}

bars {
  data-x: csv("inputs/csv_data/bardata.csv" var3);
  data-y: csv("inputs/csv_data/bardata.csv" var1);
  width: 1em;
  offset: -.8em;
  color: #444;
}

bars {
  data-x: csv("inputs/csv_data/bardata.csv" var3);
  data-y: csv("inputs/csv_data/bardata.csv" var2);
  width: 1em;
  offset: .8em;
  color: #999;
}

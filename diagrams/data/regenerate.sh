#!/bin/bash

curl http://www.tepco.co.jp/en/nu/fukushima-np/f1/images/csv_temp_data_2u-e.csv > csv_temp_data_2u-e.csv
perl temperature.pl < csv_temp_data_2u-e.csv
gnuplot commands.gpl
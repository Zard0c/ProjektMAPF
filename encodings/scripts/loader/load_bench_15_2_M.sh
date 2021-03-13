#!/bin/bash

cp ./benchmarks/4-robots/bench_test_15_mod/instance.png ./lab/instances/instance_15_2.png

cp ./benchmarks/4-robots/bench_test_15_mod/instance.lp ./lab/instances/instance_15_12.lp

cp ./benchmarks/4-robots/bench_test_15_mod/encoding.lp ./lab/instances/encoding_15_2_M.lp

./encodings/scripts/plan_creater/plan_create_15_2_M.sh

clingo --out-atomf="%s." -V0 -c horizon=9 ./lab/instances/encoding_15_2_M.lp ./lab/instances/instance_15_2.lp | grep object > ./lab/results/result_15_2_M.lp

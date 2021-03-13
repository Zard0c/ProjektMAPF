#!/bin/bash

cp ./benchmarks/4-robots/bench_test_15/instance.png ./lab/instances/instance_15_1.png

cp ./benchmarks/4-robots/bench_test_15/instance.lp ./lab/instances/instance_15_1.lp

cp ./benchmarks/4-robots/bench_test_15/encoding.lp ./lab/instances/encoding_15_1_M.lp

./encodings/scripts/plan_creater/plan_create_15_1_M.sh

clingo --out-atomf="%s." -V0 -c horizon=4 ./lab/instances/encoding_15_1_M.lp ./lab/instances/instance_15_1.lp | grep object > ./lab/results/result_15_1_M.lp

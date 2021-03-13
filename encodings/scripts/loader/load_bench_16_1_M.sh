#!/bin/bash

cp ./benchmarks/4-robots/bench_test_16/instance.png ./lab/instances/instance_16_1.png

cp ./benchmarks/4-robots/bench_test_16/instance.lp ./lab/instances/instance_16_1.lp

cp ./benchmarks/4-robots/bench_test_16/encoding.lp ./lab/instances/encoding_16_1_M.lp

./encodings/scripts/plan_creater/plan_create_16_1_M.sh

clingo --out-atomf="%s." -V0 -c horizon=8 ./lab/instances/encoding_16_1_M.lp ./lab/instances/instance_16_1.lp | grep object > ./lab/results/result_16_1_M.lp

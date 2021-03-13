#!/bin/bash

cp ./benchmarks/4-robots/bench_test_16_mod1/instance.png ./lab/instances/instance_16_2.png

cp ./benchmarks/4-robots/bench_test_16_mod1/instance.lp ./lab/instances/instance_16_2.lp

cp ./benchmarks/4-robots/bench_test_16_mod1/encoding.lp ./lab/instances/encoding_16_2_M.lp

./encodings/scripts/plan_creater/plan_create_16_2_M.sh

clingo --out-atomf="%s." -V0 -c horizon=9 ./lab/instances/encoding_16_2_M.lp ./lab/instances/instance_16_2.lp | grep object > ./lab/results/result_16_2_M.lp

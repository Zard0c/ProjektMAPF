#!/bin/bash

cp ./benchmarks/2-robots/domain_independend/bench_test_1/instance.png ./lab/instances/instance_1.png

cp ./benchmarks/2-robots/domain_independend/bench_test_1/instance.lp ./lab/instances/instance_1.lp

cp ./benchmarks/2-robots/domain_independend/bench_test_1/encoding.lp ./lab/instances/encoding_1_M.lp

./encodings/scripts/plan_creater/plan_create_1_M.sh

clingo --out-atomf="%s." -V0 -c horizon=4 ./lab/instances/encoding_1_M.lp ./lab/instances/instance_1.lp | grep object > ./lab/results/result_1_M.lp

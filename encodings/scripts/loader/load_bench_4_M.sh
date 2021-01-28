#!/bin/bash

cp ./benchmarks/2-robots/domain_independend/bench_test_4/instance.png ./lab/instances/instance_4.png

cp ./benchmarks/2-robots/domain_independend/bench_test_4/instance.lp ./lab/instances/instance_4.lp

cp ./benchmarks/2-robots/domain_independend/bench_test_4/encoding.lp ./lab/instances/encoding_4_M.lp

./encodings/scripts/plan_creater/plan_create_4_M.sh

clingo --out-atomf="%s." -V0 -c horizon=10 ./lab/instances/encoding_4_M.lp ./lab/instances/instance_4.lp | grep object > ./lab/results/result_4_M.lp

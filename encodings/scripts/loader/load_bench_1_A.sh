#!/bin/bash

cp ./benchmarks/2-robots/domain_independend/bench_test_1/instance.png ./lab/instances/instance_1.png

cp ./benchmarks/2-robots/domain_independend/bench_test_1/instance.lp ./lab/instances/instance_1.lp

cp ./benchmarks/2-robots/domain_independend/bench_test_1/encoding_A.lp ./lab/instances/encoding_1_A.lp

./encodings/scripts/plan_creater/plan_create_1_A.sh

clingo --out-atomf="%s." -V0 -c horizon=7 ./lab/instances/encoding_1_A.lp ./lab/instances/instance_1.lp | grep object > ./lab/results/result_1_A.lp

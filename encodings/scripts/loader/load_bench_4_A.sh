#!/bin/bash

cp ./benchmarks/2-robots/domain_independend/bench_test_4/instance.png ./lab/instances/instance_4.png

cp ./benchmarks/2-robots/domain_independend/bench_test_4/instance.lp ./lab/instances/instance_4.lp

cp ./benchmarks/2-robots/domain_independend/bench_test_4/encoding_A.lp ./lab/instances/encoding_4_A.lp

./encodings/scripts/plan_creater/plan_create_4_A.sh

clingo --out-atomf="%s." -V0 -c horizon=14 ./lab/instances/encoding_4_A.lp ./lab/instances/instance_4.lp | grep object > ./lab/results/result_4_A.lp

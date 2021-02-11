#!/bin/bash

cp ./benchmarks/2-robots/domain_independend/bench_test_7/instance.png ./lab/instances/instance_7.png

cp ./benchmarks/2-robots/domain_independend/bench_test_7/instance.lp ./lab/instances/instance_7.lp

cp ./benchmarks/2-robots/domain_independend/bench_test_7/encoding_A.lp ./lab/instances/encoding_7_A.lp

./encodings/scripts/plan_creater/plan_create_7_A.sh

clingo --out-atomf="%s." -V0 -c horizon=23 ./lab/instances/encoding_7_A.lp ./lab/instances/instance_7.lp | grep object > ./lab/results/result_7_A.lp

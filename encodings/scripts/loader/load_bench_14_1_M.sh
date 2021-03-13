#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_14/instance.png ./lab/instances/instance_14_1.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_14/instance.lp ./lab/instances/instance_14_1.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_14/encoding.lp ./lab/instances/encoding_14_1_M.lp

./encodings/scripts/plan_creater/plan_create_14_1_M.sh

clingo --out-atomf="%s." -V0 -c horizon=8 ./lab/instances/encoding_14_1_M.lp ./lab/instances/instance_14_1.lp | grep object > ./lab/results/result_14_1_M.lp

#!/bin/bash

cp ./benchmarks/2-robots/M-domain_only/bench_test_18/instance.png ./lab/instances/instance_18_1.png

cp ./benchmarks/2-robots/M-domain_only/bench_test_18/instance.lp ./lab/instances/instance_18_1.lp

cp ./benchmarks/2-robots/M-domain_only/bench_test_18/encoding.lp ./lab/instances/encoding_18_1_M.lp

./encodings/scripts/plan_creater/plan_create_18_1_M.sh

clingo --out-atomf="%s." -V0 -c horizon=8 ./lab/instances/encoding_18_1_M.lp ./lab/instances/instance_18_1.lp | grep object > ./lab/results/result_18_1_M.lp

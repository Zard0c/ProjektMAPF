#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_11/instance.png ./lab/instances/instance_11_1.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_11/instance.lp ./lab/instances/instance_11_1.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding.lp ./lab/instances/encoding_11_1_M.lp

./encodings/scripts/plan_creater/plan_create_11_1_M.sh


clingo --out-atomf="%s." -V0 -c horizon=11 ./lab/instances/encoding_11_1_M.lp ./lab/instances/instance_11_1.lp | grep object > ./lab/results/result_11_1_M.lp

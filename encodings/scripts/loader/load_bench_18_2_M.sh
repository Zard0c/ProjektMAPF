#!/bin/bash

cp ./benchmarks/2-robots/M-domain_only/bench_test_18_mod1/instance.png ./lab/instances/instance_18_2.png

cp ./benchmarks/2-robots/M-domain_only/bench_test_18_mod1/instance.lp ./lab/instances/instance_18_2.lp

cp ./benchmarks/2-robots/M-domain_only/bench_test_18_mod1/encoding.lp ./lab/instances/encoding_18_2_M.lp

./encodings/scripts/plan_creater/plan_create_18_2_M.sh

clingo --out-atomf="%s." -V0 -c horizon=12 ./lab/instances/encoding_18_2_M.lp ./lab/instances/instance_18_2.lp | grep object > ./lab/results/result_18_2_M.lp

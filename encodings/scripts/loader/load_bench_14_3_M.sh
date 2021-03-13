#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/instance.png ./lab/instances/instance_14_3.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/instance.lp ./lab/instances/instance_14_3.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_14_mod_2/encoding.lp ./lab/instances/encoding_14_3_M.lp

./encodings/scripts/plan_creater/plan_create_14_3_M.sh

clingo --out-atomf="%s." -V0 -c horizon=8 ./lab/instances/encoding_14_3_M.lp ./lab/instances/instance_14_3.lp | grep object > ./lab/results/result_14_3_M.lp

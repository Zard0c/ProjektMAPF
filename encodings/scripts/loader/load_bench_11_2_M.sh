#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/instance.png ./lab/instances/instance_11_2.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/instance.lp ./lab/instances/instance_11_2.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_11_mod/encoding.lp ./lab/instances/encoding_11_2_M.lp

./encodings/scripts/plan_creater/plan_create_11_2_M.sh

clingo --out-atomf="%s." -V0 -c horizon=9 ./lab/instances/encoding_11_2_M.lp ./lab/instances/instance_11_2.lp | grep object > ./lab/results/result_11_2_M.lp

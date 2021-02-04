#!/bin/bash

cp ./benchmarks/2-robots/M-domain_only/bench_test_2/instance.png ./lab/instances/instance_2.png

cp ./benchmarks/2-robots/M-domain_only/bench_test_2/instance.lp ./lab/instances/instance_2.lp

cp ./benchmarks/2-robots/M-domain_only/bench_test_2/encoding.lp ./lab/instances/encoding_2_M.lp

./encodings/scripts/plan_creater/plan_create_2_M.sh

clingo --out-atomf="%s." -V0 -c horizon=7 ./lab/instances/encoding_2_M.lp ./lab/instances/instance_2.lp | grep object > ./lab/results/result_2_M.lp

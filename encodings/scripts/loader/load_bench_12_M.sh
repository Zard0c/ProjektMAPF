#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_12/instance.png ./lab/instances/instance_12.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_12/instance.lp ./lab/instances/instance_12.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_12/encoding.lp ./lab/instances/encoding_12_M.lp

./encodings/scripts/plan_creater/plan_create_12_M.sh

clingo --out-atomf="%s." -V0 -c horizon=6 ./lab/instances/encoding_12_M.lp ./lab/instances/instance_12.lp | grep object > ./lab/results/result_12_M.lp

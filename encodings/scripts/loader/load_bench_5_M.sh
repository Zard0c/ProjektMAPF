#!/bin/bash

cp ./benchmarks/2-robots/M-domain_only/bench_test_5/instance.png ./lab/instances/instance_5.png

cp ./benchmarks/2-robots/M-domain_only/bench_test_5/instance.lp ./lab/instances/instance_5.lp

cp ./benchmarks/2-robots/M-domain_only/bench_test_5/encoding.lp ./lab/instances/encoding_5_M.lp

./encodings/scripts/plan_creater/plan_create_5_M.sh

clingo --out-atomf="%s." -V0 -c horizon=5 ./lab/instances/encoding_5_M.lp ./lab/instances/instance_5.lp | grep object > ./lab/results/result_5_M.lp

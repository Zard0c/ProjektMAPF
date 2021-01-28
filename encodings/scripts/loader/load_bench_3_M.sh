#!/bin/bash

cp ./benchmarks/2-robots/M-domain_only/bench_test_3/instance.png ./lab/instances/instance_3.png

cp ./benchmarks/2-robots/M-domain_only/bench_test_3/instance.lp ./lab/instances/instance_3.lp

cp ./benchmarks/2-robots/M-domain_only/bench_test_3/encoding.lp ./lab/instances/encoding_3_M.lp

./encodings/scripts/plan_creater/plan_create_3_M.sh

clingo --out-atomf="%s." -V0 -c horizon=4 ./lab/instances/encoding_3_M.lp ./lab/instances/instance_3.lp | grep object > ./lab/results/result_3_M.lp

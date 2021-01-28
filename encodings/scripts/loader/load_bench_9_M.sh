#!/bin/bash

cp ./benchmarks/2-robots/M-domain_only/bench_test_9/instance.png ./lab/instances/instance_9.png

cp ./benchmarks/2-robots/M-domain_only/bench_test_9/instance.lp ./lab/instances/instance_9.lp

cp ./benchmarks/2-robots/M-domain_only/bench_test_9/encoding.lp ./lab/instances/encoding_9_M.lp

./encodings/scripts/plan_creater/plan_create_9_M.sh

clingo --out-atomf="%s." -V0 -c horizon=5 ./lab/instances/encoding_9_M.lp ./lab/instances/instance_9.lp | grep object > ./lab/results/result_9_M.lp

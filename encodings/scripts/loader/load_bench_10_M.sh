#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_10/instance.png ./lab/instances/instance_10.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_10/instance.lp ./lab/instances/instance_10.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_10/encoding.lp ./lab/instances/encoding_10_M.lp

./encodings/scripts/plan_creater/plan_create_10_M.sh

clingo --out-atomf="%s." -V0 -c horizon=7 ./lab/instances/encoding_10_M.lp ./lab/instances/instance_10.lp | grep object > ./lab/results/result_10_M.lp

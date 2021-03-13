#!/bin/bash

cp ./benchmarks/2-robots/M-domain_only/bench_test_8/instance.png ./lab/instances/instance_8.png

cp ./benchmarks/2-robots/M-domain_only/bench_test_8/instance.lp ./lab/instances/instance_8.lp

cp ./benchmarks/2-robots/M-domain_only/bench_test_8/encoding.lp ./lab/instances/encoding_8_M.lp

./encodings/scripts/plan_creater/plan_create_8_M.sh


clingo --out-atomf="%s." -V0 -c horizon=12 ./lab/instances/encoding_8_M.lp ./lab/instances/instance_8.lp | grep object > ./lab/results/result_8_M.lp

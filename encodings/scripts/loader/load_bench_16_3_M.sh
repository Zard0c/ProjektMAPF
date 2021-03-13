#!/bin/bash

cp ./benchmarks/2-robots/M-domain_only/bench_test_16_mod2/instance.png ./lab/instances/instance_16_3.png

cp ./benchmarks/2-robots/M-domain_only/bench_test_16_mod2/instance.lp ./lab/instances/instance_16_3.lp

cp ./benchmarks/2-robots/M-domain_only/bench_test_16_mod2/encoding.lp ./lab/instances/encoding_16_3_M.lp

./encodings/scripts/plan_creater/plan_create_16_3_M.sh

clingo --out-atomf="%s." -V0 -c horizon=13 ./lab/instances/encoding_16_3_M.lp ./lab/instances/instance_16_3.lp | grep object > ./lab/results/result_16_3_M.lp

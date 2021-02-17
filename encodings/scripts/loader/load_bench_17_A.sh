#!/bin/bash

cp ./benchmarks/2-robots/A-domain_only/bench_test_17/instance.png ./lab/instances/instance_17.png

cp ./benchmarks/2-robots/A-domain_only/bench_test_17/instance.lp ./lab/instances/instance_17.lp

cp ./benchmarks/2-robots/A-domain_only/bench_test_17/encoding_A.lp ./lab/instances/encoding_17_A.lp

./encodings/scripts/plan_creater/plan_create_17_A.sh

#clingo --out-atomf="%s." -V0 -c horizon=7 ./lab/instances/encoding_17_A.lp ./lab/instances/instance_17.lp | grep object > ./lab/results/result_17_A.lp

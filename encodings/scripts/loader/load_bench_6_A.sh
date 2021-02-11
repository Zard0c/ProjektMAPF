#!/bin/bash

cp ./benchmarks/2-robots/domain_independend/bench_test_6/instance.png ./lab/instances/instance_6.png

cp ./benchmarks/2-robots/domain_independend/bench_test_6/instance.lp ./lab/instances/instance_6.lp

cp ./benchmarks/2-robots/domain_independend/bench_test_6/encoding_A.lp ./lab/instances/encoding_6_A.lp

./encodings/scripts/plan_creater/plan_create_6_A.sh

#clingo --out-atomf="%s." -V0 -c horizon=4 ./lab/instances/encoding_6_M.lp ./lab/instances/instance_6.lp | grep object > ./lab/results/result_6_M.lp

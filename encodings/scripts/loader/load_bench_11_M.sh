#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_11/instance.png ./lab/instances/instance_11.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_11/instance.lp ./lab/instances/instance_11.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding.lp ./lab/instances/encoding_11_M.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_11/encoding-WIP.lp ./lab/instances/encoding_11-WIP.lp

./encodings/scripts/plan_creater/plan_create_11_M.sh

echo "benchmark 11 not automaticly solved, because still WIP"

#clingo --out-atomf="%s." -V0 -c horizon=4 ./lab/instances/encoding_11_M.lp ./lab/instances/instance_11.lp | grep object > ./lab/results/result_11_M.lp

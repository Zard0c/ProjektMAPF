#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_12/instance.png ./lab/instances/instance_12.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_12/instance.lp ./lab/instances/instance_12.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_12/encoding.lp ./lab/instances/encoding_12_M.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_12/encoding-WIP.lp ./lab/instances/encoding_12-WIP.lp

./encodings/scripts/plan_creater/plan_create_12_M.sh

echo "benchmark 12 not automaticly solved, because still WIP"

#clingo --out-atomf="%s." -V0 -c horizon=4 ./lab/instances/encoding_12_M.lp ./lab/instances/instance_12.lp | grep object > ./lab/results/result_12_M.lp

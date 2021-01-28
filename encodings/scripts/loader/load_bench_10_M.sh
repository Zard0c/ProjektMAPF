#!/bin/bash

cp ./benchmarks/3-robots/M-domain_only/bench_test_10/instance.png ./lab/instances/instance_10.png

cp ./benchmarks/3-robots/M-domain_only/bench_test_10/instance.lp ./lab/instances/instance_10.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_10/encoding.lp ./lab/instances/encoding_10_M.lp

cp ./benchmarks/3-robots/M-domain_only/bench_test_10/encoding-WIP.lp ./lab/instances/encoding_10-WIP.lp

./encodings/scripts/plan_creater/plan_create_10_M.sh

echo "benchmark 10 not automaticly solved, because still WIP"

#clingo --out-atomf="%s." -V0 -c horizon=4 ./lab/instances/encoding_10_M.lp ./lab/instances/instance_10.lp | grep object > ./lab/results/result_10_M.lp

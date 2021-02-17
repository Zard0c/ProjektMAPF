#!/bin/bash

PS3='Choose the number listed on the left of your choice: '

robots=("2 Robots" "3 Robots" "All" "Quit")
domain=("M-Domain" "A-Domain" "Both Domains" "Back" "Quit")
ben2M=("Benchmark 1" "Benchmark 2" "Benchmark 3" "Benchmark 4" "Benchmark 5" "Benchmark 6" "Benchmark 7" "Benchmark 8" "Benchmark 9" "Back" "Quit")
ben2O=("Benchmark 1" "Benchmark 4" "Benchmark 6" "Benchmark 7" "Back" "Quit")
ben2A=("Benchmark 1" "Benchmark 4" "Benchmark 6" "Benchmark 7" "Benchmark 17" "Back" "Quit")
ben3M=("Benchmark 10" "Benchmark 11" "Benchmark 12" "Back" "Quit")
ben3O=("Back" "Quit")
ben3A=("Back" "Quit")

echo "To load a benchmark, choose the amount of robots, the domain which should be compiled and then the benchmark"
echo "You can go back one step by choosing Back, or leave midway by choosing Quit"
echo "the A-domain is still WIP"

select rob in "${robots[@]}"; do
	case $rob in
		"2 Robots")
			echo "including all benchmarks for 2 robots"
			echo
			select dom in "${domain[@]}"; do
				case $dom in
					"M-Domain")
						echo "including all benchmarks which work in the M domain"
						echo
						select ben in "${ben2M[@]}"; do
							case $ben in							
							#M-Domain only
								"Benchmark 2")
									echo "loading benchmark 2 into lab"
									./encodings/scripts/loader/load_bench_2_M.sh
									;;
								"Benchmark 3")
									echo "loading benchmark 3 into lab"
									./encodings/scripts/loader/load_bench_3_M.sh
									;;
								"Benchmark 5")
									echo "loading benchmark 5 into lab"
									;;
								"Benchmark 8")
									echo "loading benchmark 8 into lab"
									./encodings/scripts/loader/load_bench_8_M.sh
									;;
								"Benchmark 9")
									echo "loading benchmark 9 into lab"
									./encodings/scripts/loader/load_bench_9_M.sh
									;;
							#general benchmarks
								"Benchmark 1")
									echo "loading benchmark 1 into lab"
									./encodings/scripts/loader/load_bench_1_M.sh
									;;
								"Benchmark 4")
									echo "loading benchmark 4 into lab"
									./encodings/scripts/loader/load_bench_4_M.sh
									;;
								"Benchmark 6")
									echo "loading benchmark 6 into lab"
									./encodings/scripts/loader/load_bench_6_M.sh
									;;
								"Benchmark 7")
									echo "loading benchmark 7 into lab"
									./encodings/scripts/loader/load_bench_7_M.sh
									;;
								"Back")
									break
									;;
								"Quit")
									echo "closing loader"
									exit
									;;
								*)
									echo "invalid option $REPLY"
									;;
							esac
						done
						;;
					"A-Domain")
						echo "including all benchmarks which work in the A domain"
						echo
						select ben in "${ben2A[@]}"; do
							case $ben in
							#A-Domain only
							#general benchmarks
								"Benchmark 1")
									echo "loading benchmark 1 into lab"
									./encodings/scripts/loader/load_bench_1_A.sh
									;;
								"Benchmark 4")
									echo "loading benchmark 4 into lab"
									./encodings/scripts/loader/load_bench_4_A.sh
									;;
								"Benchmark 6")
									echo "loading benchmark 6 into lab"
									./encodings/scripts/loader/load_bench_6_A.sh
									;;
								"Benchmark 7")
									echo "loading benchmark 7 into lab"
									./encodings/scripts/loader/load_bench_7_A.sh
									;;
								"Benchmark 17")
									echo "loading benchmark 17 into lab"
									./encodings/scripts/loader/load_bench_17_A.sh
									;;
								"Back")
									break
									;;
								"Quit")
									echo "closing loader"
									exit
									;;
								*)
									echo "invalid option $REPLY"
									;;
							esac
						done
						;;
					"Both Domains")
						echo "including all benchmarks which work in A and M domain"
						echo
						select ben in "${ben2O[@]}"; do
							case $ben in
								"Benchmark 1")
									echo "loading benchmark 1 into lab"
									./encodings/scripts/loader/load_bench_1_M.sh
									./encodings/scripts/loader/load_bench_1_A.sh
									;;
								"Benchmark 4")
									echo "loading benchmark 4 into lab"
									./encodings/scripts/loader/load_bench_4_M.sh
									./encodings/scripts/loader/load_bench_4_A.sh
									;;
								"Benchmark 6")
									echo "loading benchmark 6 into lab"
									./encodings/scripts/loader/load_bench_6_M.sh
									./encodings/scripts/loader/load_bench_6_A.sh
									;;
								"Benchmark 7")
									echo "loading benchmark 7 into lab"
									./encodings/scripts/loader/load_bench_7_M.sh
									./encodings/scripts/loader/load_bench_7_A.sh
									;;
								"Back")
									break
									;;
								"Quit")
									echo "closing loader"
									exit
									;;
								*)
									echo "invalid option $REPLY"
									;;
							esac
						done
						;;
					"Back")
						break
						;;
					"Quit")
						echo "closing loader"
						exit
						;;
					*)
						echo "invalid option $REPLY"
						;;
				esac
			done
			;;
		"3 Robots")
			echo "including all benchmarks for 3 robots"
			echo
			select dom in "${domain[@]}"; do
				case $dom in
					"M-Domain")
						echo "including all benchmarks which work in the M domain"
						echo
						select ben in "${ben3M[@]}"; do
							case $ben in
							#M-Domain only
								"Benchmark 10")
									echo "loading benchmark 10 into lab"
									./encodings/scripts/loader/load_bench_10_M.sh
									;;
								"Benchmark 11")
									echo "loading benchmark 11 into lab"
									./encodings/scripts/loader/load_bench_11_M.sh
									;;
								"Benchmark 12")
									echo "loading benchmark 12 into lab"
									./encodings/scripts/loader/load_bench_12_M.sh
									;;
							#general benchmarks
								"Back")
									break
									;;
								"Quit")
									echo "closing loader"
									exit
									;;
								*)
									echo "invalid option $REPLY"
									;;
							esac
						done
						;;
					"A-Domain")
						echo "including all benchmarks which work in the A domain"
						echo
						select ben in "${ben3A[@]}"; do
							case $ben in
							#A-Domain only
							#general benchmarks
								"Back")
									break
									;;
								"Quit")
									echo "closing loader"
									exit
									;;
								*)
									echo "invalid option $REPLY"
									;;
							esac
						done
						;;
					"Both Domains")
						echo "including all benchmarks which work in A and M domain"
						echo
						select ben in "${ben3O[@]}"; do
							case $ben in
								"Back")
									break
									;;
								"Quit")
									echo "closing loader"
									exit
									;;
								*)
									echo "invalid option $REPLY"
									;;
							esac
						done
						;;
					"Back")
						break
						;;
					"Quit")
						echo "closing loader"
						exit
						;;
					*)
						echo "invalid option $REPLY"
						;;
				esac
			done
			;;
		"All")
			echo "including all benchmarks"
			select dom in "${domain[@]}"; do
				case $dom in
					"M-Domain")
						echo "loading all benchmarks for the M domain into lab"
						./encodings/scripts/loader/load_bench_1_M.sh
						./encodings/scripts/loader/load_bench_2_M.sh
						./encodings/scripts/loader/load_bench_3_M.sh
						./encodings/scripts/loader/load_bench_4_M.sh
						./encodings/scripts/loader/load_bench_5_M.sh
						./encodings/scripts/loader/load_bench_6_M.sh
						./encodings/scripts/loader/load_bench_7_M.sh
						./encodings/scripts/loader/load_bench_8_M.sh
						./encodings/scripts/loader/load_bench_9_M.sh
						./encodings/scripts/loader/load_bench_10_M.sh
						./encodings/scripts/loader/load_bench_11_M.sh
						./encodings/scripts/loader/load_bench_12_M.sh
						exit
						;;
					"A-Domain")
						echo "loading all benchmarks for the A domain into lab"
						./encodings/scripts/loader/load_bench_1_A.sh
						./encodings/scripts/loader/load_bench_4_A.sh
						./encodings/scripts/loader/load_bench_6_A.sh
						./encodings/scripts/loader/load_bench_7_A.sh
						./encodings/scripts/loader/load_bench_17_A.sh
						exit
						;;
					"Both Domains")
						echo "loading all benchmarks into lab"
					#M-Domain
						./encodings/scripts/loader/load_bench_1_M.sh
						./encodings/scripts/loader/load_bench_2_M.sh
						./encodings/scripts/loader/load_bench_3_M.sh
						./encodings/scripts/loader/load_bench_4_M.sh
						./encodings/scripts/loader/load_bench_5_M.sh
						./encodings/scripts/loader/load_bench_6_M.sh
						./encodings/scripts/loader/load_bench_7_M.sh
						./encodings/scripts/loader/load_bench_8_M.sh
						./encodings/scripts/loader/load_bench_9_M.sh
						./encodings/scripts/loader/load_bench_10_M.sh
						./encodings/scripts/loader/load_bench_11_M.sh
						./encodings/scripts/loader/load_bench_12_M.sh
					#A-Domain
						./encodings/scripts/loader/load_bench_1_A.sh
						./encodings/scripts/loader/load_bench_4_A.sh
						./encodings/scripts/loader/load_bench_6_A.sh
						./encodings/scripts/loader/load_bench_7_A.sh
						./encodings/scripts/loader/load_bench_17_A.sh
						exit
						;;
					"Back")
						break
						;;
					"Quit")
						echo "closing loader"
						exit
						;;
					*)
						echo "invalid option $REPLY"
						;;
				esac
			done
			;;		
		"Quit")
			echo "closing loader"
			exit
			;;
		*)
			echo "invalid option $REPLY"
			;;
	esac
done

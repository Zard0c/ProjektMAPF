#!/bin/bash

PS3='Choose the number listed on the left of your choice: '

robots=("2 Robots" "3 Robots" "4 Robots" "All" "Quit")
all=("M-Domain" "A-Domain" "Both Domains" "All" "Back" "Quit")
domain=("M-Domain" "A-Domain" "Both Domains" "Back" "Quit")
ben2M=("Benchmark 1" "Benchmark 2" "Benchmark 3" "Benchmark 4" "Benchmark 5" "Benchmark 6" "Benchmark 7" "Benchmark 8" "Benchmark 9" "Benchmark 16.3" "Benchmark 18.1" "Benchmark 18.2" "Back" "Quit")
ben2O=("Benchmark 1" "Benchmark 4" "Benchmark 6" "Benchmark 7" "Back" "Quit")
ben2A=("Benchmark 1" "Benchmark 4" "Benchmark 6" "Benchmark 7" "Benchmark 17" "Back" "Quit")
ben3M=("Benchmark 10" "Benchmark 11.1" "Benchmark 11.2" "Benchmark 12" "Benchmark 13" "Benchmark 14.1" "Benchmark 14.2" "Benchmark 14.3" "Back" "Quit")
ben4M=("Benchmark 15.1" "Benchmark 15.2" "Benchmark 16.1" "Benchmark 16.2" "Back" "Quit")

echo "To load a benchmark, choose the amount of robots, the domain which should be compiled and then the benchmark"
echo "You can go back one step by choosing Back, or leave midway by choosing Quit"

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
									./encodings/scripts/loader/load_bench_5_M.sh
									;;
								"Benchmark 8")
									echo "loading benchmark 8 into lab"
									./encodings/scripts/loader/load_bench_8_M.sh
									;;
								"Benchmark 9")
									echo "loading benchmark 9 into lab"
									./encodings/scripts/loader/load_bench_9_M.sh
									;;
								"Benchmark 16.3")
									echo "loading benchmark 16.3 into lab"
									./encodings/scripts/loader/load_bench_16_3_M.sh
									;;
								"Benchmark 18.1")
									echo "loading benchmark 18.1 into lab"
									./encodings/scripts/loader/load_bench_18_1_M.sh
									;;
								"Benchmark 18.2")
									echo "loading benchmark 18.2 into lab"
									./encodings/scripts/loader/load_bench_18_2_M.sh
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
			select ben in "${ben3M[@]}"; do
				case $ben in
				#M-Domain only
					"Benchmark 10")
						echo "loading benchmark 10 into lab"
						./encodings/scripts/loader/load_bench_10_M.sh
						;;
					"Benchmark 11.1")
						echo "loading benchmark 11.1 into lab"
						./encodings/scripts/loader/load_bench_11_1_M.sh
						;;
					"Benchmark 11.2")
						echo "loading benchmark 11.2 into lab"
						./encodings/scripts/loader/load_bench_11_2_M.sh
						;;
					"Benchmark 12")
						echo "loading benchmark 12 into lab"
						./encodings/scripts/loader/load_bench_12_M.sh
						;;
					"Benchmark 13")
						echo "loading benchmark 13 into lab"
						./encodings/scripts/loader/load_bench_13_M.sh
						;;
					"Benchmark 14.1")
						echo "loading benchmark 14.1 into lab"
						./encodings/scripts/loader/load_bench_14_1_M.sh
						;;
					"Benchmark 14.2")
						echo "loading benchmark 14.2 into lab"
						./encodings/scripts/loader/load_bench_14_2_M.sh
						;;
					"Benchmark 14.3")
						echo "loading benchmark 14.3 into lab"
						./encodings/scripts/loader/load_bench_14_3_M.sh
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
		"4 Robots")
			echo "including all benchmarks for 4 robots"
			echo
			select ben in "${ben4M[@]}"; do
				case $ben in
				#M-Domain only
					"Benchmark 15.1")
						echo "loading benchmark 15.1 into lab"
						./encodings/scripts/loader/load_bench_15_1_M.sh
						;;
					"Benchmark 15.2")
						echo "loading benchmark 15.2 into lab"
						./encodings/scripts/loader/load_bench_15_2_M.sh
						;;
					"Benchmark 16.1")
						echo "loading benchmark 16.1 into lab"
						./encodings/scripts/loader/load_bench_16_1_M.sh
						;;
					"Benchmark 16.2")
						echo "loading benchmark 16.2 into lab"
						./encodings/scripts/loader/load_bench_16_2_M.sh
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
		"All")
			echo "including all benchmarks"
			select all in "${all[@]}"; do
				case $all in
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
						./encodings/scripts/loader/load_bench_11_1_M.sh
						./encodings/scripts/loader/load_bench_11_2_M.sh
						./encodings/scripts/loader/load_bench_12_M.sh
						./encodings/scripts/loader/load_bench_13_M.sh
						./encodings/scripts/loader/load_bench_14_1_M.sh
						./encodings/scripts/loader/load_bench_14_2_M.sh
						./encodings/scripts/loader/load_bench_14_3_M.sh
						./encodings/scripts/loader/load_bench_15_1_M.sh
						./encodings/scripts/loader/load_bench_15_2_M.sh
						./encodings/scripts/loader/load_bench_16_1_M.sh
						./encodings/scripts/loader/load_bench_16_2_M.sh
						./encodings/scripts/loader/load_bench_16_3_M.sh
						./encodings/scripts/loader/load_bench_18_1_M.sh
						./encodings/scripts/loader/load_bench_18_2_M.sh
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
						echo "loading all benchmarks, that can be compiled in both A and M domain into the lab"
						./encodings/scripts/loader/load_bench_1_M.sh
						./encodings/scripts/loader/load_bench_4_M.sh
						./encodings/scripts/loader/load_bench_6_M.sh
						./encodings/scripts/loader/load_bench_7_M.sh
						exit
						;;
					"All")
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
						./encodings/scripts/loader/load_bench_11_1_M.sh
						./encodings/scripts/loader/load_bench_11_2_M.sh
						./encodings/scripts/loader/load_bench_12_M.sh
						./encodings/scripts/loader/load_bench_13_M.sh
						./encodings/scripts/loader/load_bench_14_1_M.sh
						./encodings/scripts/loader/load_bench_14_2_M.sh
						./encodings/scripts/loader/load_bench_14_3_M.sh
						./encodings/scripts/loader/load_bench_15_1_M.sh
						./encodings/scripts/loader/load_bench_15_2_M.sh
						./encodings/scripts/loader/load_bench_16_1_M.sh
						./encodings/scripts/loader/load_bench_16_2_M.sh
						./encodings/scripts/loader/load_bench_16_3_M.sh
						./encodings/scripts/loader/load_bench_18_1_M.sh
						./encodings/scripts/loader/load_bench_18_2_M.sh
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

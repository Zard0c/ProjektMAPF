#!/bin/bash

PS3='Choose the merger you want to use:'

merger=("Adrian" "Marcus" "Niklas" "Tarik" "Tom" "Quit")


echo "Choose the Merger you want to use. Only one name per group is given!"
echo "The results will be in the coresponding result file in lab"

select merg in "${merger[@]}"; do
	case $merg in
		"Adrian")
			echo "solving all 20 benchmarks with adrians solver"
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/a_b_1.lp lab/plans/a_b_1.lp > ./lab/results/a_a_b_1.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/a_b_5.lp lab/plans/a_b_5.lp > ./lab/results/a_a_b_5.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/a_b_6.lp lab/plans/a_b_6.lp > ./lab/results/a_a_b_6.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/a_b_7.lp lab/plans/a_b_7.lp > ./lab/results/a_a_b_7.lp	
		#Marcus Benchmarks
		echo "solving all 20 benchmarks with adrians solver"
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/m_b_2.lp lab/plans/m_b_2.lp > ./lab/results/m_a_b_2.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/m_b_3.lp lab/plans/m_b_3.lp > ./lab/results/m_a_b_3.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/m_b_16_1.lp lab/plans/m_b_16_1.lp > ./lab/results/m_a_b_16_1.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/m_b_17.lp lab/plans/m_b_17.lp > ./lab/results/m_a_b_17.lp		
		#Niklas Benchmarks	
		echo "solving all 20 benchmarks with adrians solver"
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/n_b_5.lp lab/plans/n_b_5.lp > ./lab/results/n_a_b_5.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/n_b_6.lp lab/plans/n_b_6.lp > ./lab/results/n_a_b_6.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/n_b_42.lp lab/plans/n_b_42.lp > ./lab/results/n_a_b_42.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/n_b_51.lp lab/plans/n_b_51.lp > ./lab/results/n_a_b_51.lp
		#Tarik Benchmarks
		echo "solving all 20 benchmarks with adrians solver"
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/ta_b_1.lp lab/plans/ta_b_1.lp > ./lab/results/ta_a_b_1.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/ta_b_2.lp lab/plans/ta_b_2.lp > ./lab/results/ta_a_b_2.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/ta_b_3.lp lab/plans/ta_b_3.lp > ./lab/results/ta_a_b_3.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/ta_b_4.lp lab/plans/ta_b_4.lp > ./lab/results/ta_a_b_4.lp
		#Tom Benchmarks
		echo "solving all 20 benchmarks with adrians solver"
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/to_b_3.lp lab/plans/to_b_3.lp > ./lab/results/to_a_b_3.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/to_b_5.lp lab/plans/to_b_5.lp > ./lab/results/to_a_b_5.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/to_b_11.lp lab/plans/to_b_11.lp > ./lab/results/to_a_b_11.lp
			clingo --out-atomf="%s." merger/Adrian/merge.lp lab/instances/to_b_12.lp lab/plans/to_b_12.lp > ./lab/results/to_a_b_12.lp
			;;
		"Marcus")
			echo "solving all 20 benchmarks with marcus solver"
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/a_b_1.lp lab/plans/a_b_1.lp > ./lab/results/a_m_b_1.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/a_b_5.lp lab/plans/a_b_5.lp > ./lab/results/a_m_b_5.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/a_b_6.lp lab/plans/a_b_6.lp > ./lab/results/a_m_b_6.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/a_b_7.lp lab/plans/a_b_7.lp > ./lab/results/a_m_b_7.lp	
		#Marcus Benchmarks
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/m_b_2.lp lab/plans/m_b_2.lp > ./lab/results/m_m_b_2.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/m_b_3.lp lab/plans/m_b_3.lp > ./lab/results/m_m_b_3.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/m_b_16_1.lp lab/plans/m_b_16_1.lp > ./lab/results/m_m_b_16_1.lp
			clingo --out-atomf="%s." merger/Marcus/merga.lp lab/instances/m_b_17.lp lab/plans/m_b_17.lp > ./lab/results/m_m_b_17.lp		
		#Niklas Benchmarks	
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/n_b_5.lp lab/plans/n_b_5.lp > ./lab/results/n_m_b_5.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/n_b_6.lp lab/plans/n_b_6.lp > ./lab/results/n_m_b_6.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/n_b_42.lp lab/plans/n_b_42.lp > ./lab/results/n_m_b_42.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/n_b_51.lp lab/plans/n_b_51.lp > ./lab/results/n_m_b_51.lp
		#Tarik Benchmarks
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/ta_b_1.lp lab/plans/ta_b_1.lp > ./lab/results/ta_m_b_1.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/ta_b_2.lp lab/plans/ta_b_2.lp > ./lab/results/ta_m_b_2.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/ta_b_3.lp lab/plans/ta_b_3.lp > ./lab/results/ta_m_b_3.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/ta_b_4.lp lab/plans/ta_b_4.lp > ./lab/results/ta_m_b_4.lp
		#Tom Benchmarks
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/to_b_3.lp lab/plans/to_b_3.lp > ./lab/results/to_m_b_3.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/to_b_5.lp lab/plans/to_b_5.lp > ./lab/results/to_m_b_5.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/to_b_11.lp lab/plans/to_b_11.lp > ./lab/results/to_m_b_11.lp
			clingo --out-atomf="%s." merger/Marcus/merge.lp lab/instances/to_b_12.lp lab/plans/to_b_12.lp > ./lab/results/to_m_b_12.lp
			;;
		"Niklas")
			echo "solving all 20 benchmarks with niklas solver"		
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/a_b_1.lp lab/plans/a_b_1.lp > ./lab/results/a_n_b_1.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/a_b_5.lp lab/plans/a_b_5.lp > ./lab/results/a_n_b_5.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/a_b_6.lp lab/plans/a_b_6.lp > ./lab/results/a_n_b_6.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/a_b_7.lp lab/plans/a_b_7.lp > ./lab/results/a_n_b_7.lp	
		#Marcus Benchmarks
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/m_b_2.lp lab/plans/m_b_2.lp > ./lab/results/m_n_b_2.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/m_b_3.lp lab/plans/m_b_3.lp > ./lab/results/m_n_b_3.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/m_b_16_1.lp lab/plans/m_b_16_1.lp > ./lab/results/m_n_b_16_1.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/m_b_17.lp lab/plans/m_b_17.lp > ./lab/results/m_n_b_17.lp		
		#Niklas Benchmarks	
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/n_b_5.lp lab/plans/n_b_5.lp > ./lab/results/n_n_b_5.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/n_b_6.lp lab/plans/n_b_6.lp > ./lab/results/n_n_b_6.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/n_b_42.lp lab/plans/n_b_42.lp > ./lab/results/n_n_b_42.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/n_b_51.lp lab/plans/n_b_51.lp > ./lab/results/n_n_b_51.lp
		#Tarik Benchmarks
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/ta_b_1.lp lab/plans/ta_b_1.lp > ./lab/results/ta_n_b_1.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/ta_b_2.lp lab/plans/ta_b_2.lp > ./lab/results/ta_n_b_2.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/ta_b_3.lp lab/plans/ta_b_3.lp > ./lab/results/ta_n_b_3.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/ta_b_4.lp lab/plans/ta_b_4.lp > ./lab/results/ta_n_b_4.lp
		#Tom Benchmarks
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/to_b_3.lp lab/plans/to_b_3.lp > ./lab/results/to_n_b_3.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/to_b_5.lp lab/plans/to_b_5.lp > ./lab/results/to_n_b_5.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/to_b_11.lp lab/plans/to_b_11.lp > ./lab/results/to_n_b_11.lp
			clingo --out-atomf="%s." merger/Niklas/merge.lp lab/instances/to_b_12.lp lab/plans/to_b_12.lp > ./lab/results/to_n_b_12.lp
			;;
		"Tarik")
			echo "solving all 20 benchmarks with tariks solver"
		#Adian Benchmarks
			clingo --out-atomf="%s." -c rm=4 merger/Tarik/merge.lp lab/instances/a_b_1.lp lab/plans/a_b_1.lp > ./lab/results/a_ta_b_1.lp
			clingo --out-atomf="%s." -c rm=9 merger/Tarik/merge.lp lab/instances/a_b_6.lp lab/plans/a_b_6.lp > ./lab/results/a_ta_b_6.lp	
			echo "Adrian bench 5/7 not solvable"
		#Marcus Benchmarks
			clingo --out-atomf="%s." -c rm=2 merger/Tarik/merge.lp lab/instances/m_b_2.lp lab/plans/m_b_2.lp > ./lab/results/m_ta_b_2.lp
			clingo --out-atomf="%s." -c rm=3 merger/Tarik/merge.lp lab/instances/m_b_3.lp lab/plans/m_b_3.lp > ./lab/results/m_ta_b_3.lp
			clingo --out-atomf="%s." -c rm=4 merger/Tarik/merge.lp lab/instances/m_b_16_1.lp lab/plans/m_b_16_1.lp > ./lab/results/m_ta_b_16_1.lp
			echo "marcus bench 17 not solvable"	
		#Niklas Benchmarks	
			clingo --out-atomf="%s." -c rm=7 merger/Tarik/merge.lp lab/instances/n_b_5.lp lab/plans/n_b_5.lp > ./lab/results/n_ta_b_5.lp
			clingo --out-atomf="%s." -c rm=5 merger/Tarik/merge.lp lab/instances/n_b_6.lp lab/plans/n_b_6.lp > ./lab/results/n_ta_b_6.lp
			clingo --out-atomf="%s." -c rm=2 merger/Tarik/merge.lp lab/instances/n_b_42.lp lab/plans/n_b_42.lp > ./lab/results/n_ta_b_42.lp
			clingo --out-atomf="%s." -c rm=3 merger/Tarik/merge.lp lab/instances/n_b_51.lp lab/plans/n_b_51.lp > ./lab/results/n_ta_b_51.lp
		#Tarik Benchmarks
			clingo --out-atomf="%s." -c rm=4 merger/Tarik/merge.lp lab/instances/ta_b_1.lp lab/plans/ta_b_1.lp > ./lab/results/ta_ta_b_1.lp
			clingo --out-atomf="%s." -c rm=16 merger/Tarik/merge.lp lab/instances/ta_b_2.lp lab/plans/ta_b_2.lp > ./lab/results/ta_ta_b_2.lp
			clingo --out-atomf="%s." -c rm=6 merger/Tarik/merge.lp lab/instances/ta_b_3.lp lab/plans/ta_b_3.lp > ./lab/results/ta_ta_b_4.lp
			clingo --out-atomf="%s." -c rm=8 merger/Tarik/merge.lp lab/instances/ta_b_4.lp lab/plans/ta_b_4.lp > ./lab/results/ta_ta_b_3.lp
		#Tom Benchmarks
			clingo --out-atomf="%s." -c rm=4 merger/Tarik/merge.lp lab/instances/to_b_3.lp lab/plans/to_b_3.lp > ./lab/results/to_ta_b_3.lp
			clingo --out-atomf="%s." -c rm=3 merger/Tarik/merge.lp lab/instances/to_b_5.lp lab/plans/to_b_5.lp > ./lab/results/to_ta_b_5.lp
			echo "tom bench 11/12 not solvable"
			;;
		"Tom")
			echo "solving all 20 benchmarks with toms solver"
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/a_b_1.lp lab/plans/a_b_1.lp > ./lab/results/a_to_b_1.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/a_b_5.lp lab/plans/a_b_5.lp > ./lab/results/a_to_b_5.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/a_b_6.lp lab/plans/a_b_6.lp > ./lab/results/a_to_b_6.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/a_b_7.lp lab/plans/a_b_7.lp > ./lab/results/a_to_b_7.lp	
		#Marcus Benchmarks
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/m_b_2.lp lab/plans/m_b_2.lp > ./lab/results/m_to_b_2.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/m_b_3.lp lab/plans/m_b_3.lp > ./lab/results/m_to_b_3.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/m_b_16_1.lp lab/plans/m_b_16_1.lp > ./lab/results/m_to_b_16_1.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/m_b_17.lp lab/plans/m_b_17.lp > ./lab/results/m_to_b_17.lp		
		#Niklas Benchmarks	
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/n_b_5.lp lab/plans/n_b_5.lp > ./lab/results/n_to_b_5.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/n_b_6.lp lab/plans/n_b_6.lp > ./lab/results/n_to_b_6.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/n_b_42.lp lab/plans/n_b_42.lp > ./lab/results/n_to_b_42.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/n_b_51.lp lab/plans/n_b_51.lp > ./lab/results/n_to_b_51.lp
		#Tarik Benchmarks
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/ta_b_1.lp lab/plans/ta_b_1.lp > ./lab/results/ta_to_b_1.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/ta_b_2.lp lab/plans/ta_b_2.lp > ./lab/results/ta_to_b_2.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/ta_b_3.lp lab/plans/ta_b_3.lp > ./lab/results/ta_to_b_3.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/ta_b_4.lp lab/plans/ta_b_4.lp > ./lab/results/ta_to_b_4.lp
		#Tom Benchmarks
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/to_b_3.lp lab/plans/to_b_3.lp > ./lab/results/to_to_b_3.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/to_b_5.lp lab/plans/to_b_5.lp > ./lab/results/to_to_b_5.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/to_b_11.lp lab/plans/to_b_11.lp > ./lab/results/to_to_b_11.lp
			clingo --out-atomf="%s." merger/Tom/merge.lp lab/instances/to_b_12.lp lab/plans/to_b_12.lp > ./lab/results/to_to_b_12.lp
			;;
		"Quit")
			exit
			;;
		*)
			echo "invalid input. please try again"
			;;
	esac
done

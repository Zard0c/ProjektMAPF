# README
This repository contains the files of the MAPF project, short for Multiple Agent Path-Finding, part of the University of Potsdam course "Knowledge Representation and Reasoning".

It is split between our encodings, the basics of which were taken from the Asprilo seminar (also offered by the University of Potsdam) and then modified to suit our needs, the list of benchmarks we use to test our code and a bash script to quickly load and run our benchmarks. Details concerning our benchmarks can be found in the 'benchmarks' folder, those concerning our work on the encodings in the 'encodings' folder. Lastly, a developers diary is currently in development.

# Shell script
The lab directory is where the benchmarks get loaded into and makes it easier to work with them, since one doesn't need to reference files over half the repository.
To make this possible, the "load_benchmark.sh" script lets the user choose which benchmarks to load into the lab. It will then create a plan for each robot in these benchmarks, and if the benchmark can be completly solved with our merger, it will also merge those plans.
The plans, results and instances each have there own subfolder in the lab, so they are all sorted and one doesn't need to search for the files. If one wants to merge the plans oneself, then in the lab/instances directory will be the instance.lp for the benchmarks and the encoding.lp for the corresponding domains.
The "cleaner.sh" script makes sure that the lab is clean, meaning it deletes everything inside the subfolders of lab.

# Usage of the Shell script
To load a benchmark, call "./load_benchmark.sh" and then follow the prompts in the consol. You first get to choose the amount of robots, then the domain and last but not least the specific benchmarks.
To note here is, that choosing the both option for the domain will only show the benchmarks that can be compiled in both, the A and the M domain.
The all option in the robot menu loads all benchmarks for the specific domain into the lab, independend of the amount of robots.
To navigate, simply type the coresponding number in front of your choice into the consol, and if you need to go back or to quit, there are options for those as well.
Last but not least, please note that loading any domain choice in the "All" category for robots will close the script. Otherwise, you will have to manually quit the script after you have loaded all your benchmarks, thoughyou can ofcourse choose to load multiple benchmarks one after the other.
To empty the lab, simply call "./cleaner.sh".



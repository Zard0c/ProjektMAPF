# Benchmark 15
Original: A simple expansion of benchmark 13, and built purely to see if the wait condition properly translates through a convoy of robots.
Horizon: 4

mod1: Originially intended to be a modification of benchmark 11, specifically to test the interaction between a dodge return and a wait triggering at the same time, it turned out to have been unnecessary, since no issues arose between these two and the offending robot simply waited a turn longer before going on its return journey.

Horizon 9
# Benchmark 16
The final form of benchmark 14, this scenarios models a simultaneous 4-way collision and shed light on another weakness of the dodge command as it was. It used to calculate spots to dodge to, but then found all of those spots taken by robots, meaning it had no valid direction to dodge to anymore, stalling the program. This in turn forced us to create a special case dodge which makes the higher priority robot dodge instead in such a case.

Horizon: 8 (9 for mod1)

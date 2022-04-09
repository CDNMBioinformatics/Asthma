Asthma endotyping --> generates Figure 3 and Figure S6.

### Directory Structure

1. run_sim.R - Runs simulations on the input files from ```input_rules``` folder and stores the simulation output in ```Output``` folder.
2. input_rules - Immune network rules with starting Stimulants Th2, Th17, and Th1 set to 1.
3. Output - simulation output for 800 time points and 350 iterations.
4. Output_plots_Figure3 - Trajectory plots generated from simulation output in ```Output``` folder using ```plots.py``` script in Figure 3.
5. Output_plots_FigureS6 - Trajectory plots generated from simulation output in ```Output``` folder using ```plots_panel_bigfont.py``` script in FigureS6.

#plot the simulations
import matplotlib.pyplot as plt
from matplotlib import rcParams
import numpy as np
from pylab import *
import matplotlib as mpl
import seaborn as sns
import pandas as pd

runs = 350 #numseries
cycles = 800  #nummeasurements

df = pd.read_csv("../Output/mild.txt",sep ='\t')
df = df.T

print(df.shape, df.head())


df_dict = {}
for name in df.columns:
    row = np.mean(np.array(df[name]).reshape(runs,cycles), axis = 0)
    df_dict[name] = row


data = pd.DataFrame(df_dict)

data_sub = data[['Eosinophils', 'Neutrophils', 'Th2',  'Th17', 'Th1', 'IgE', 'IL9', 'IL17', 'IL2', 'IL8']]
data_sub.plot(style=['.-','.-'], lw=3, markeredgecolor='k',mew=10, markevery=50,legend=None)

legend_labels = ['Eosinophils','Neutrophils','T$_\mathrm{H}$2', 'T$_\mathrm{H}$17', 'T$_\mathrm{H}$1', 
'IgE', 'IL$-$9', 'IL$-$17', 'IL$-$2', 'IL$-$8']


plt.tight_layout()
plt.ylim([0,1])
plt.xlim([0,800])
plt.xlim(left=0)
plt.xticks(fontsize=17, fontweight = 'bold')
plt.yticks(fontsize=17, fontweight = 'bold')
plt.xlabel('Time Steps',  fontsize=20, fontweight = 'bold')
plt.ylabel('Node Activity',  fontsize=20, fontweight = 'bold')
plt.savefig('mild.pdf',bbox_inches='tight')


axes = plt.gca()
axes.spines['bottom'].set_linewidth(2)
axes.spines['top'].set_linewidth(2)
axes.spines['left'].set_linewidth(2)
axes.spines['right'].set_linewidth(2)

axes.xaxis.set_tick_params(labelsize=10,width=2)
axes.yaxis.set_tick_params(labelsize=10,width=2)


figsize = (3, 3)
fig_leg = plt.figure(figsize=figsize)
ax_leg = fig_leg.add_subplot(111)
h,l = axes.get_legend_handles_labels()
ax_leg.legend(h,legend_labels, loc='center', fontsize=12)
ax_leg.axis('off')
fig_leg.savefig('legend.pdf', bbox_inches='tight')



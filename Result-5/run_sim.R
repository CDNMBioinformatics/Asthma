library(BoolNet)
setwd("/Users/vrushali/Documents/BoolNet/data/Paper1/Final\ Results/Paper_Code/Code/RUDRA/Result5")

print("Mild")
network = loadNetwork('rules_mild.txt')
series = generateTimeSeries(network,350,800,type = "asynchronous",noiseLevel = 0)
write.table(series, "Output/mild.txt", sep="\t")

print("Medial")
network = loadNetwork('rules_medial.txt')
series = generateTimeSeries(network,350,800,type = "asynchronous",noiseLevel = 0)
write.table(series, "Output/medial.txt", sep="\t")

print("Moderate")
network = loadNetwork('rules_moderate.txt')
series = generateTimeSeries(network,350,800,type = "asynchronous",noiseLevel = 0)
write.table(series, "Output/moderate.txt", sep="\t")

print("Overlap")
network = loadNetwork('rules_severe.txt')
series = generateTimeSeries(network,350,800,type = "asynchronous",noiseLevel = 0)
write.table(series, "Output/severe.txt", sep="\t")
#! /bin/bash
watch -t -n -1 '{ echo "Logged in user: $(whoami) \n\n\nSYSTEM MONITOR \n\n";
echo "******************** Memory Utilization **********************";
free -h | xargs | awk '\''{ printf "\n\nPercentage of used Memory : %.2f%%\n", $9/$8*100;
print "Total Memory :",$8;
print "Available Memory :", $13,"\n\n" }'\'';

echo "******************** Disk Utilization **********************";

df -h | xargs | awk '\''{ print "\n\nPercentage disk used: ", $18;
print "Total disk space:",$15;
print "Available disk space:",$17,"\n\n" }'\''

echo "******************** CPU Specifications **********************";
lscpu | xargs | awk '\''{ print "\n\nCPU cores:", $20;
print "CPU Vendor:", $27;
print "CPU Model:", $30 $31 $32;
print "Max CPU frequency (MHz):" $5, "\n\n"}'\''

echo "******************** System Uptime **********************";
uptime | xargs | awk '\''{ print "\n Uptime :", $1, "\n\n"}'\''
echo "********************************** **********************";
}'


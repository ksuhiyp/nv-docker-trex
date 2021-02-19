#/bin/bash

export DISPLAY=:0

# Enable persistance
nvidia-smi -pm 1

# Activate Coolbits
nvidia-xconfig --cool-bits=8

# 3080
POWER_3080=220
CLOCK_3080=-150
MEMORY_3080=900
FANSPEED_3080=60

# 3090
POWER_3090=285
CLOCK_3090=-300
MEMORY_3090=1000
FANSPEED_3090=60



# Adjust power limits
nvidia-smi -i 0 -pl $POWER_3080
nvidia-smi -i 1 -pl $POWER_3090

# Adjust fan speeds
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=$FANSPEED_3090"
nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=$FANSPEED_3090"
nvidia-settings -a "[gpu:1]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=$FANSPEED_3080"
nvidia-settings -a "[gpu:1]/GPUFanControlState=1" -a "[fan:1]/GPUTargetFanSpeed=$FANSPEED_3080"

############## 3090 Memory & Clock Settings

#GPU 0
nvidia-settings -c :0 -a "[gpu:0]/GPUGraphicsClockOffset[3]=$CLOCK_3090"
nvidia-settings -c :0 -a "[gpu:0]/GPUMemoryTransferRateOffset[3]=$MEMORY_3090"
############## 3080 Memory & Clock Settings
#GPU 1
nvidia-settings -c :0 -a "[gpu:1]/GPUGraphicsClockOffset[3]=$CLOCK_3080"
nvidia-settings -c :0 -a "[gpu:1]/GPUMemoryTransferRateOffset[3]=$MEMORY_3080"

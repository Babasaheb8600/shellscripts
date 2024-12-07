#!/bin/bash
read -p "Estimated kilometers: " EST_KMS
read -p "Trip type (Private/shared):" TRIP_TYPE
read -p "Can Type (Hatchback/Sedan/SUV/premium):" CAB_TYPE
TRIP_AMT=0

if [ $TRIP_TYPE -eq "shared" ]; then
  TRIP_AMT=$(echo "$EST_KMS*5.25" | bc)
elif [ $TRIP_TYPE -eq "private" ]; then
  if [ $CAB_TYPE -eq "Hatchback" ]; then
    TRIP_AMT=$(echo "$EST_KMS*6.15" | bc)
  elif [ $CAB_TYPE -eq "Sedan" ]; then
    TRIP_AMT=$(echo "$EST_KMS*7.80" | bc)	
  elif [ $CAB_TYPE -eq "SUV" ]; then
    TRIP_AMT=$(echo "$EST_KMS*9.50" | bc)
  elif [ $CAB_TYPE -eq "Premium" ]; then
    TRIP_AMT=$(echo "$EST_KMS*12.25" | bc)
  else
      echo "error: invalid input"
      exit 1
  fi
else
    echo "error: invalid input"
    exit 1
fi

echo "Trip estimated amount : $TRIP_AMT":

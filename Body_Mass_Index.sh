#!/bin/bash

# A body mass index calculator

read -p "Enter your weight in kg: " weight
read -p "Enter your height in m: " height

declare -A user_information

user_information=([user_height]=$height [user_weight]=$weight)

body_mass_index=$(echo "scale=2; (${user_information[user_weight]} / ${user_information[user_height]}^2)" | bc )

echo """your body mass index is: "$body_mass_index"kg/m^2"""

user_information+=([user_body_mass_index]=$body_mass_index)

echo "${!user_information[@]} are: ${user_information[@]}"

if [[ $body_mass_index < 18.5 ]]
then
	echo "you are slim or underweight"

elif  [[ $body_mass_index > 18.5 && $body_mass_index < 24.9 ]]
then
	echo "you have the normal body type"

elif [[ $body_mass_index > 25.0 && $body_mass_index < 29.9 ]]
then
	echo "you are not the ideal weight that is considered healthy"
else
	echo "you are very overweight"

fi

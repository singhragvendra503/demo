#!/bin/bash


function Bill_Calculate()
{
json_data=$(cat MOCK_DATA.json)
# Get the number of objects in the array
array_length=$(echo "$json_data" | jq 'length')

# Iterate over each object in the array
for ((i=0; i<$array_length; i++)); do
  value=$(echo "$json_data" | jq ".[$i].unit")
 #upto 199 unit, per unit charge is @1.20
  if [ "$value" -le 199 ]; then
    bill=$(echo "$value * 1.20" | bc)
    #The minimum bill should be of Rs.100/-
    if [ $(echo "$bill < 100" | bc) -eq 1 ]; then
      updated_bill=100

    else
      updated_bill=$bill
      
    fi
    #Adds the new key-value pair 
  json_data=$(echo "$json_data" | jq --argjson i "$i" --arg updated_bill "$(printf "%.2f" "$updated_bill")" '. as $data | .[$i] |= . + {"Total Bill":$updated_bill }')
    #200 and above but less than 400 unit, per unit charge is @1.50
  elif [ "$value" -lt 400 ]; then
      bill=$(echo "$value * 1.50" | bc)
      #If bill exceeds Rs.400 then surcharge 15% will be charged
        if [ $(echo "$bill > 400" | bc) -eq 1 ]; then
             surcharge=$(echo "$bill + $bill * 0.15" | bc)
             updated_bill=$surcharge

        else
             updated_bill=$bill

         fi
  json_data=$(echo "$json_data" | jq --argjson i "$i" --arg updated_bill "$(printf "%.2f" "$updated_bill")" '. as $data | .[$i] |= . + {"Total Bill":$updated_bill }')
         #400 and above but less than 600 unit, per unit charge is @1.80
  elif [ "$value" -lt 600 ]; then
      bill=$(echo "$value * 1.80" | bc)
      #If bill exceeds Rs.400 then surcharge 15% will be charged
      if [ $(echo "$bill > 400" | bc) -eq 1 ]; then
             surcharge=$(echo "$bill + $bill * 0.15" | bc)
             updated_bill=$surcharge

        else
             updated_bill=$bill

	fi
  json_data=$(echo "$json_data" | jq --argjson i "$i" --arg updated_bill "$(printf "%.2f" "$updated_bill")" '. as $data | .[$i] |= . + {"Total Bill": $updated_bill}')
	#600 and above unit, per unit charge is @2.00
  elif [ "$value" -ge 600 ]; then
      bill=$(echo "$value * 2.00" | bc)
      #If bill exceeds Rs.400 then surcharge 15% will be charged
       if [ $(echo "$bill > 400" | bc) -eq 1 ]; then
             surcharge=$(echo "$bill + $bill * 0.15" | bc)
             updated_bill=$surcharge

        else
             updated_bill=$bill

        fi
  json_data=$(echo "$json_data" | jq --argjson i "$i" --arg updated_bill "$(printf "%.2f" "$updated_bill")" '. as $data | .[$i] |= . + {"Total Bill":$updated_bill }')
  fi
done

echo "$json_data" >MOCK.json 
}

function show_details()
{
# Store the JSON file contents in a variable
json=$(cat MOCK.json)
# Read the ID from the user
read -p "Please enter your ID: " id
if [[ $id =~ ^[0-9]+$ ]]; then
if [ $id -lt 1 ] || [ $id -gt 1000 ];then
 echo "Customer not found "
 exit
 fi
# Extract the key-value pairs of the object
pairs=$(echo "$json" | jq -r ".[$id-1] | to_entries | .[] | \"\(.key)=\(.value)\"")

# Show customer details
echo "Detail:"
echo "$pairs"

else
  # Error message if the input is not a valid number
  echo "Error: ID must be a numerical value."
fi
}
Bill_Calculate
show_details   


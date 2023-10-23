#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"
  echo -e "Welcome to My Salon, how can I help you?\n" 
MAIN_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  #echo -e "\n1. SELECT SERVICE\n2. EXIT"
  #read MAIN_MENU_SELECTION

  #case $MAIN_MENU_SELECTION in
   # 1) LISTA ;;
    #2) EXIT ;;
    #*) MAIN_MENU "Please enter a valid option." ;;
  #esac
#get Services
SERVICES_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
#dispay services
echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
  do
echo "$SERVICE_ID) $NAME"
  done
#select services
#echo -e "\nWhich one would you like to do?"
    read SERVICE_ID_SELECTED
 # if input is not a number
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
      # send to main menu
      MAIN_MENU "That is not a valid service number."
    else
      # get servicey
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

      # if not available
      if [[ -z $SERVICE_NAME ]]
      then
        # send to main menu
        MAIN_MENU "That service is not available."
      else
        # get customer info
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE

        CUSTOMER_AVAILABILITY=$($PSQL "SELECT name FROM customers WHERE phone ='$CUSTOMER_PHONE'")

        # if customer doesn't exist
        if [[ -z $CUSTOMER_AVAILABILITY ]]
        then
          # get new customer name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME

          # insert new customer
          INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
        fi
        
  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone ='$CUSTOMER_PHONE'")
  SERVICE_NAME_FORM=$(echo $SERVICE_NAME | sed 's/ //g')
  CUSTOMER_NAME_FORM=$(echo $CUSTOMER_NAME | sed 's/ //g')
  echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME_FORM?"
  read SERVICE_TIME
  # insert bike rental
  INSERT_SERVICE_RESULT=$($PSQL "INSERT INTO appointments (customer_id, time, service_id) VALUES ($CUSTOMER_ID, '$SERVICE_TIME', $SERVICE_ID_SELECTED)")

  # send to main menu
  echo -e "\nI have put you down for a $SERVICE_NAME_FORM at $SERVICE_TIME, $CUSTOMER_NAME_FORM."

      fi
    fi
}
MAIN_MENU


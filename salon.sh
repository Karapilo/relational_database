#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MY_SERVICE() {
  echo -e "Welcome to My Salon, how can I help you?\n"
  
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  if [[ -n "$AVAILABLE_SERVICES" ]]
  then
    while IFS="|" read -r SERVICE_ID SERVICE_NAME
    do
      SERVICE_ID=$(echo "$SERVICE_ID" | xargs)
      SERVICE_NAME=$(echo "$SERVICE_NAME" | xargs)
      echo "${SERVICE_ID}) ${SERVICE_NAME}"
    done <<< "$AVAILABLE_SERVICES"
  else
    echo "No services available"
    return 1
  fi

  echo -e "\nSelect a service number: "
  read SERVICE_ID_SELECTED

  if [[ ! "$SERVICE_ID_SELECTED" =~ ^[0-9]+$ ]]
  then 
    echo -e "\nThat is not a valid number. Please try again."
    MY_SERVICE
  else
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers where phone='$CUSTOMER_PHONE'")

      echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
      read SERVICE_TIME

      INSERT_APPOINTMENTS=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")

      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi
}

MY_SERVICE

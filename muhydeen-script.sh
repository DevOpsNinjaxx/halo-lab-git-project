#!/bin/bash

# Initialize account balance
account_balance=1000

# Function to display account balance
display_balance() {
  echo "Your account balance is $account_balance"
}

# Function to withdraw money
withdraw() {
  local amount=$1
  if [ $amount -le $account_balance ]; then
    account_balance=$((account_balance - amount))
    echo "You have withdrawn $amount. Your new balance is $account_balance"
  else
    echo "Insufficient funds"
  fi
}


deposit_cash(){
    read -p "How much are you depositing? " DEPOSIT_AMOUNT
    if [[ "$DEPOSIT_AMOUNT" =~ ^[0-9]+$ && "$DEPOSIT_AMOUNT" -gt 0 ]]; then
        echo "Depositing $DEPOSIT_AMOUNT cash..."
        account_balance=$((account_balance+DEPOSIT_AMOUNT))
        echo "Your new balance is $account_balance."
    else
        echo "Invalid input. Please enter a valid amount (numeric and greater than 0)."
    fi 
}

echo "Welcome to MUHYDEEN ATM dispenser "

# Main menu
while true; do
  echo "ATM Menu:"
  echo "1. Check Balance"
  echo "2. Withdraw"
  echo "3. deposit cash"
  echo "4. Exit"
  read -p "Enter your choice: " choice

  case $choice in
    1)
      display_balance
      ;;
    2)
      read -p "Enter the amount to withdraw: " amount
      withdraw $amount
      ;;
    3)
      deposit_cash
      ;;
    4)
      echo "Thank you for using this ATM. Goodbye!"
      exit
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done


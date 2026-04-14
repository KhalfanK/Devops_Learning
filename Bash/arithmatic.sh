#!/bin/bash

# Arithmetic operations in Bash


function add(){
    if [[ $1 =~ ^[0-9]+$ ]] && [[ $2 =~ ^[0-9]+$ ]]; then
        echo "$1 + $2 = $(( $1 + $2 ))"
    else
        echo "Error: Both inputs must be integers."
        return 1
    fi
}


function subtract(){
    if [[ $1 =~ ^[0-9]+$ ]] && [[ $2 =~ ^[0-9]+$ ]]; then
        echo "$1 - $2 = $(( $1 - $2 ))"
    else
        echo "Error: Both inputs must be integers."
        return 1
    fi
}

function multiply(){
    if [[ $1 =~ ^[0-9]+$ ]] && [[ $2 =~ ^[0-9]+$ ]]; then
        echo "$1 * $2 = $(( $1 * $2 ))"
    else
        echo "Error: Both inputs must be integers."
        return 1
    fi
}

function divide(){
    if [[ $1 =~ ^[0-9]+$ ]] && [[ $2 =~ ^[0-9]+$ ]]; then
        if [[ $2 -ne 0 ]]; then
            echo "$1 / $2 = $(( $1 / $2 ))"
        else
            echo "Error: Division by zero is not allowed."
            return 1
        fi
    else
        echo "Error: Both inputs must be integers."
        return 1
    fi
}

read -p "Enter first number: "  num1
read -p "Enter second number: "  num2

add "$num1" "$num2"
subtract "$num1" "$num2"
multiply "$num1" "$num2"
divide "$num1" "$num2"
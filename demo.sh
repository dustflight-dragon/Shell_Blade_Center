#! /bin/sh

function start_application() {
    displayString
}

function displayString() {
    result_string="This is Ryan Chow"
    echo "The result content is: "
    echo $result_string
}

function main() {
    start_application

}
main

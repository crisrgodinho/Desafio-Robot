***Settings***
Library     RequestsLibrary
Library     Collections
Library     OperatingSystem
#Library     JSONLibrary
Resource    ../helpers/http.robot

Suite Setup     Connect api


***Test Cases***

   
Register User
    Register user
    Check the Status Code    200
    Check The User registered
# Check the return Name User

#  Get employee
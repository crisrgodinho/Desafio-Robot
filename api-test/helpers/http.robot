*** Settings ***
Library     RequestsLibrary
Library     Collections
#Library     JSONLibrary
#Resource    Tests-api.robot

***Variable***

${URL-API}      http://dummy.restapiexample.com/api/v1

*** Keywords ***
Connect api
    Create Session    api    ${URL-API}


Register user
    ${Headers}     Create Dictionary    content-type=application/json   User-Agent=Postman
    ${Answer}      Post on Session    api    /create
    ...            data={"name":"test2","salary":"1234","age":"23"}
    ...            headers=${Headers}
    Log    ${Answer.text}
    Log    ${Answer.json()}
    Set Test Variable     ${Answer}

Check the Status Code
    [Arguments]         ${STATUS_CODE-EXPECTED}
    Should Be Equal As Strings      ${Answer.status_code}       ${STATUS_CODE-EXPECTED}

Check The User registered
    ${Headers}     Create Dictionary    content-type=application/json   User-Agent=Postman
    ${Get-Answer}       GET On Session      api     /employees
    ...                 headers=${Headers}
 #   Log                     ${Get-Answer.json}
 #   Set Test Variable       ${Get-Answer}

Check the return Name User
    List Should Contain Value       ${Get-Answer.json()['data']['name']}        test2
   # Dictionary Should Contain Item      ${Get-Answer.json()}        name    test2
   # Log    {Get-Answer.json()}
   




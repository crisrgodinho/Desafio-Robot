***Settings***
Library           SeleniumLibrary
Resource          ../variables/variables.robot  
#Library  Collection

*** Keywords ***

#Setup
Abrir Navegador
    Open Browser        http://www.saucedemo.com       Chrome
   
Close Browser
    Close Browser       

#Step by step

I'm access to browser to login page
    Title Should Be    Swag Labs

I Input Username    
     [Arguments]    ${USER}
     Input Text    id=user-name       ${USER} 

I Input Password   
    [Arguments]    ${password}
    Input Text    id=password         ${password}

Submit Credentials
    Click Button    id=login-button

Welcome Page Should Be Open
    Title Should Be    Welcome Page

I'm on Home Page
    Title Should Be     menu_button_container

I selected product
    Wait Until Element Is Visible       css=#item_0_title_link > div
#   Click button       css=#item_1_title_link > div 
#   Click Button      id=add-to-cart-sauce-labs-bolt-t-shirt
    
#    ${Elements}=     Get WebElements    xpath=//button[@class='btn btn_primary btn_small btn_inventory'] 
#    Log         ${Elements}[0]
#    FOR     ${Indice}       IN      ${Elements}
#        ${Attribute}        Get Element Attribute       ${Indice}
#        Log         ${Indice}
#    END

    ${Elements}=     Get WebElements    xpath=[@class='btn btn_primary btn_small btn_inventory'] 
    Log         ${Elements}[0]
    FOR     ${Indice}       IN      ${Elements}
        ${Attribute}        Get Element Attribute       ${Indice}
        Log         ${Indice}
    END
 
I click on Cart
   # Wait Until Element Is Visible       css=#shopping_cart_container > a 
    SeleniumLibrary.Click Link       css=#shopping_cart_container > a

 
Then All T-shirts have been added to the cart 
    FOR   ${I}   ${T-shirts}   IN ENUMERATE   @{T-shirts-List}

        Exit For Loop If    '${T-shirts}'=='null'
    END

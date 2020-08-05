*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary

*** Variables ***
${url}            https://www.flipkart.com
${browser}        firefox
${excel_path}     ..\\WebsiteAutomation\\TestData\\testData.xlsx

*** Test Cases ***
OpenExcel
    [Documentation]    *This Testcase will open excel file*
    Open Excel Document    filename=${excel_path}    doc_id=docid
    ${product_name}=    Read Excel Cell    row_num=2    col_num=1    sheet_name=Product Details
    log    ${product_name}
    Close All Excel Documents
    sleep    3s

OpenBrowser
    [Documentation]    *This Testcase will open browser with provided url*
    [Setup]
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    3s

LogIn
    [Documentation]    *This Testcase is used to login to the website*
    Open Excel Document    filename=${excel_path}    doc_id=docid
    ${username}=    Read Excel Cell    row_num=2    col_num=1    sheet_name=Login Details
    ${password}=    Read Excel Cell    row_num=2    col_num=2    sheet_name=Login Details
    Close All Excel Documents
    Wait Until Element Is Visible    xpath=//button[contains(text(), '✕')]
    Click Button    xpath=//button[contains(text(), '✕')]
    Wait Until Element Is Visible    xpath=//a[contains(text(), 'Login')]
    Click Element    xpath=//a[contains(text(), 'Login')]
    Wait Until Element Is Visible    xpath=(//input)[7]
    Input Text    xpath=(//input)[7]    ${username}
    Wait Until Element Is Visible    xpath=(//input)[8]
    Input Password    xpath=(//input)[8]    ${password}
    Wait Until Element Is Visible    xpath=//button/span
    Click Element    xpath=//button/span
    sleep    3s

SearchProduct
    [Documentation]    *This Testcase is used to search for product*
    Open Excel Document    filename=${excel_path}    doc_id=docid
    ${product_name}=    Read Excel Cell    row_num=2    col_num=1    sheet_name=Product Details
    Close All Excel Documents
    Wait Until Element Is Visible    xpath=//input[@placeholder='Search for products, brands and more']
    Input Text    xpath=//input[@placeholder='Search for products, brands and more']    ${product_name}
    Wait Until Element Is Visible    xpath=//button[@type='submit']
    Click Button    xpath=//button[@type='submit']
    sleep    3s

SelectProduct
    [Documentation]    *This Testcase is used to select product*
    Wait Until Element Is Visible    xpath=//a[contains(@title,'Dettol Original Liquid Hand Wash Refill Hand Wash Pouch')]
    Click Link    xpath=//a[contains(@title,'Dettol Original Liquid Hand Wash Refill Hand Wash Pouch')]
    sleep    3s

Select Window
    [Documentation]    *This Testcase is used to select window*
    Select Window    MAIN
    sleep    3s

LogOut
    [Documentation]    *This Testcase is used to logout from the website*
    Wait Until Element Is Visible    xpath=//div/div/div[1]/div[1]/div[2]/div[3]/div/div/div/div
    Double Click Element    xpath=//div/div/div[1]/div[1]/div[2]/div[3]/div/div/div/div
    Wait Until Element Is Visible    xpath=//div[2]/div[2]//li[10]/a
    Click Element    xpath=//div[2]/div[2]//li[10]/a
    sleep    3s

CloseBrowser
    [Documentation]    *This Testcase will close the browser*
    Close All Browsers

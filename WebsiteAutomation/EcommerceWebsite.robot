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
    ${username}=    Read Excel Cell    row_num=2    col_num=1    sheet_name=Login Details
    log    ${username}
    ${password}=    Read Excel Cell    row_num=2    col_num=2    sheet_name=Login Details
    log    ${password}
    ${product_name}=    Read Excel Cell    row_num=2    col_num=1    sheet_name=Product Selection
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
    Click Button    xpath=//button[contains(text(), '✕')]
    Click Element    xpath=//a[contains(text(), 'Login')]
    Input Text    xpath=(//input)[7]    ${username}
    Input Password    xpath=(//input)[8]    ${password}
    Click Element    xpath=//button/span
    sleep    3s

LogOut
    [Documentation]    *This Testcase is used to logout from the website*
    Double Click Element    xpath=//div/div/div[1]/div[1]/div[2]/div[3]/div/div/div/div
    sleep    3s
    Click Element    xpath=//div[2]/div[2]//li[10]/a
    sleep    3s

CloseBrowser
    [Documentation]    *This Testcase will close the browser*
    Close All Browsers

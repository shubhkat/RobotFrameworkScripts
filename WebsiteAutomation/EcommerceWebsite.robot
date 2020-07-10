*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://www.flipkart.com
${browser}        chrome

*** Test Cases ***
OpenBrowser
    [Documentation]    *This Testcase will open browser with provided url*
    [Setup]
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    sleep    5s

CloseBrowser
    [Documentation]    *This Testcase will close the browser*
    Close Browser

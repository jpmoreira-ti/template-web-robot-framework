*** Settings ***
Library    Browser

*** Variables ***
${BROWSER}    webkit
${BASE_URL}   https://www.saucedemo.com/

*** Keywords ***
Setup Browser
    New Browser   ${BROWSER}    headless=${False}
    New Page      ${BASE_URL}
    Set Viewport Size    1920    1080

TearDown Browser
    Close Browser
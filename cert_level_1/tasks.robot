*** Settings ***
Documentation   Template robot main suite.
Library    RPA.Browser.Selenium
Library    RPA.HTTP
Library    RPA.Robocloud.Secrets
Library    OperatingSystem
Task Teardown    Close All Browsers

*** Tasks ***
Insert the sales data for the week and export it as a PDF
    Open The Intranet Website
    Log In
    Download The Excel File
    Fill And Submit The Form

*** Keywords ***
Open The Intranet Website
    Open Available Browser    https://robotsparebinindustries.com/

*** Keywords ***
Log In
    ${secret}=    Get Secret    credentials
    Input Text    username    ${secret}[username]
    Input Password    password    ${secret}[password]
    Submit Form
    Wait Until Page Contains Element    id:sales-form

*** Keywords ***
Fill And Submit The Form
    Input Text    firstname    text
    Input Text    lastname    text
    Input Text    salesresult    text
    Select From List By Value    salestarget    10000
    Click Button    Submit

*** Keywords ***
Download The Excel File
    Download    https://robotsparebinindustries.com/SalesData.xlsx    overwrite=True

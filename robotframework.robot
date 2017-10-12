*** Settings ***
Library    requests
Library    Collections

*** Variables ***
${URL}    http://api.fixer.io/latest?symbols=MYR&base=SGD

*** Test Cases ***
Parse JSON
    ${resp}=    Get    ${URL}
    ${json}=    Set Variable    ${resp.json()}
    ${rates_keys}=    Get Dictionary Keys    ${json["rates"]}
    ${b}=    Set Variable    ${json["base"]}
    ${r}=    Get From List    ${rates_keys}    0
    ${v}=    Get From Dictionary    ${json["rates"]}    ${r}
    ${n}=    Convert To Number    ${v}    1
    Log To Console    ${b}1 = ${r}${n}
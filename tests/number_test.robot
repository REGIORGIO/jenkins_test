*** Settings ***
Documentation       Robot Framework tests.
Library             libraries.ArrayGeneratorLibrary

*** Test Cases ***
Search for the minimum.
    [Tags]          SimpleTest
    ${min}          Find minimum   ${5}  ${10}
    Should be equal    ${min}    ${5}

    ${min}          Find minimum    ${0}  ${-5}
    Should be equal    ${min}    ${-5}

    ${min}          Find minimum    ${5}  ${5}
    Should be equal    ${min}    ${5}

Search for the maximum.
    [Tags]          SimpleTest
    ${min}          Find maximum    ${5}  ${10}
    Should be equal    ${min}    ${10}

    ${min}          Find maximum    ${0}  ${-5}
    Should be equal    ${min}    ${0}

    ${min}          Find maximum    ${5}  ${5}
    Should be equal    ${min}    ${5}


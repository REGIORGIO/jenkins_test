*** Settings ***
Documentation       Python and Robot Framework.
Library             libraries.ArrayGeneratorLibrary

*** Variables ***
${minimum}        ${1}
${maximum}        ${10}
${size}           ${100}


*** Test Cases ***
Generatiing valid array.
    # [Documentation]   _Documentation example_
    [Tags]            SimpleTest
    ${array}          Generate integer array  ${size}    ${minimum}    ${maximum}
    ${length}         Evaluate    len($array)
    ${min}            Evaluate    min($array)
    ${max}            Evaluate    max($array)
    # Log to console    ${array}
    Should be equal   ${length}    ${size}
    Should be True    ${min} >= ${minimum}
    Should be True    ${max} <= ${maximum}

Generatiing valid array using decorator.
    [Tags]          MiddleTest
    ${array}        Generate 10 numbers, from 1 to 10
    ${length}         Evaluate    len($array)
    ${min}            Evaluate    min($array)
    ${max}            Evaluate    max($array)
    # Log to console    ${array}
    Should be equal   ${length}    ${10}
    Should be True    ${min} >= ${1}
    Should be True    ${max} <= ${10}

#Пример передачи части названия метода, в виде параметра. Цикл.
#   [Tags]          HardTest
  #  ${types}        Create list    чётные    нечётные
   # ${array}        Сгенерировать 5 чисел, от 12 до 28
    #FOR   ${type}   IN    @{types}
     #   ${numbers}      Run keyword    Найти ${type} числа в списке    ${array}

  #      log to console     ${numbers}
   # END

# Using the decorator.
#     ${negs}         Find negative numbers
#     Generate integer array  10  1  10
#     log to console  ${negs}

*** Keywords ***

Find even number in the list.
    [Arguments]     ${list}
    ${evens}        Evaluate    [i for i in $list if i % 2 == 0]
    [Return]        ${evens}

Find odd number in the list.
    [Arguments]     ${list}
    ${odds}         Evaluate    [i for i in $list if i % 2 != 0]
    [Return]        ${odds}

Generate ${n} numbers, from ${from} to ${to}
    ${result}       Generate integer array    ${n}    ${from}    ${to}
    [Return]        ${result}

Find negative numbers
    [Arguments]     ${keyword}    @{args}   &{kwargs}
    ${list}         Run keyword    ${keyword}    @{args}    &{kwargs}
    ${negs}         Evaluate    [i for i in $list if i < 0]
    [Return]        ${negs}
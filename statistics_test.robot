*** Settings ***
Documentation       Discrete distribution and Robot Framework.
Library             libraries.Distributions

*** Variables ***
${size}        ${10000}
${e}           ${0.1}
${low}         ${1}
${up}          ${100}
${p}           ${0.5}
${n}           ${20}
${mu}          ${10}


*** Test Cases ***
Generate valid uniform array
    [Documentation]   Uniform distribution test.Comparison of expectation and deviation.
    [Tags]            SimpleTest
    ${array}          Generate uniform array    ${low}    ${up}    ${size}
    ${length}         Evaluate    len($array)
    ${min}            Evaluate    min($array)
    ${max}            Evaluate    max($array)
    ${m_theory}       Evaluate    ($up + $low) / 2
    ${m_practice}     Evaluate    $array.mean()
    ${d_theory}       Evaluate    (($up - $low + 1)**2 - 1) / 12
    ${d_practice}     Find deviation    ${array}    ${m_theory}

    Should be equal   ${length}    ${size}
    Should be True    ${min} >= ${low}
    Should be True    ${max} <= ${up}
    Should be True    abs(${m_theory} - ${m_practice}) / max(${m_practice}, ${m_theory}) <= ${e}
    Should be True    abs(${d_theory} - ${d_practice}) / max(${d_practice}, ${d_theory}) <= ${e}


Generate valid binomial array
    [Documentation]   Binomial distribution test. Comparison of expectation and deviation.
    [Tags]            SimpleTest
    ${array}          Generate binomial array    ${p}    ${n}    ${size}
    ${length}         Evaluate    len($array)
    ${min}            Evaluate    min($array)
    ${max}            Evaluate    max($array)
    ${m_theory}       Evaluate    $n * $p
    ${m_practice}     Evaluate    $array.mean()
    ${d_theory}       Evaluate    ($p * $n * (1-$p))
    ${d_practice}     Find deviation    ${array}    ${m_theory}

    Should be equal   ${length}    ${size}
    Should be True    ${min} >= ${0}
    Should be True    ${max} <= ${n}
    Should be True    abs(${m_theory} - ${m_practice}) / max(${m_practice}, ${m_theory}) <= ${e}
    Should be True    abs(${d_theory} - ${d_practice}) / max(${d_practice}, ${d_theory}) <= ${e}


Generate valid geometric array
    [Documentation]   geometric distribution test. Comparison of expectation and deviation.
    [Tags]            SimpleTest
    ${array}          Generate geometric array    ${p}      ${size}
    ${length}         Evaluate    len($array)
    ${min}            Evaluate    min($array)
    ${m_theory}       Evaluate    1/$p
    ${m_practice}     Evaluate    $array.mean()
    ${d_theory}       Evaluate    (1-$p)/($p**2)
    ${d_practice}     Find deviation    ${array}    ${m_theory}

    Should be equal   ${length}    ${size}
    Should be True    ${min} >= ${0}
    Should be True    abs(${m_theory} - ${m_practice}) / max(${m_practice}, ${m_theory}) <= ${e}
    Should be True    abs(${d_theory} - ${d_practice}) / max(${d_practice}, ${d_theory}) <= ${e}


Generate valid poisson array
    [Documentation]   Poisson distribution test. Comparison of expectation and deviation.
    [Tags]            MiddleTest
    ${array}          Generate poisson array with mu ${mu} and size ${size}
    ${length}         Evaluate    len($array)
    ${min}            Evaluate    min($array)
    ${m_theory}       Evaluate    $mu
    ${m_practice}     Evaluate    $array.mean()
    ${d_theory}       Evaluate    $mu
    ${d_practice}     Find deviation    ${array}    ${m_theory}

    Should be equal   ${length}    ${size}
    Should be True    ${min} >= ${0}
    Should be True    abs(${m_theory} - ${m_practice}) / max(${m_practice}, ${m_theory}) <= ${e}
    Should be True    abs(${d_theory} - ${d_practice}) / max(${d_practice}, ${d_theory}) <= ${e}



*** Keywords ***

Find deviation
    [Arguments]     ${array}    ${m_theory}
    ${deviation}    Evaluate    sum((xi - ${m_theory})**2 for xi in $array) / len($array)
    [Return]        ${deviation}

Generate poisson array with mu ${mu} and size ${size}
    ${result}       Generate poisson array     ${mu}     ${size}
    [Return]        ${result}


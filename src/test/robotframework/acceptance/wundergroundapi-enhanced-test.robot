*** Settings ***
Library     JSpringBotGlobal
Resource    ../http-resources.robot

*** Test Cases ***
Wunderground API XML Test
    [Tags]    enhanced-test     wundergroundapi-xml-test
    Create and Invoke Request           /CA/San_Francisco.xml
    HTTP Response Should Be XML
    Response Header Content Type Should Be XML
    XML XPath Text Content Should Be Equal  //response/current_observation/display_location/city    San Francisco
    XML XPath Text Content Should Be Equal  //response/current_observation/display_location/state   CA

Wunderground API JSON Test
    [Tags]    enhanced-test     wundergroundapi-json-test
    Create and Invoke Request           /CA/San_Francisco.json
    HTTP Response Should Be Json
    Response Header Content Type Should Be Json
    Json Value Should Be Equal   current_observation.display_location.city   San Francisco
    Json Value Should Be Equal   current_observation.display_location.state  CA

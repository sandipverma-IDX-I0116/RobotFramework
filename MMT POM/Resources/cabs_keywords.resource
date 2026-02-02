*** Settings ***
Library         SeleniumLibrary
Library         String
Variables       ../environment.py
Variables       ../PageObjects/cabs_locators.py


*** Variables ***
${test_data_file}    ${EXECDIR}${/}MMT POM${/}TestData${/}cabs_test_data.xlsx

&{MONTH_MAP}    01=Jan    02=Feb    03=Mar    04=Apr    05=May    06=Jun    07=Jul    08=Aug    09=Sep    10=Oct    11=Nov    12=Dec


*** Keywords ***
Parse Date Components
    [Documentation]    Parses datetime object into year, month, and day components
    [Arguments]    ${date}
    ${date_str}=    Convert To String    ${date}
    ${date_part}=   Split String    ${date_str}
    ${date_only}=   Set Variable    ${date_part}[0]
    ${year}    ${month_num}    ${day}=    Split String    ${date_only}    -
    ${month_num}=  Set Variable    ${month_num.zfill(2)}
    ${monthName}=  Set Variable    ${MONTH_MAP['${month_num}']}
    RETURN    ${year}    ${month_num}    ${day}    ${monthName}

Format Date For UI
    [Documentation]    Converts datetime to UI display format (e.g., "10 Feb26")
    [Arguments]    ${date}
    ${year}    ${month_num}    ${day}    ${monthName}=    Parse Date Components    ${date}
    ${day}=        Set Variable    ${day.lstrip('0')}
    ${ui_date}=    Set Variable    ${day} ${monthName}${year[-2:]}
    RETURN    ${ui_date}

Format Date For Input
    [Documentation]    Converts datetime to input format (e.g., "10 Feb 2026")
    [Arguments]    ${date}
    ${year}    ${month_num}    ${day}    ${monthName}=    Parse Date Components    ${date}
    ${day}=        Set Variable    ${day.zfill(2)}
    RETURN    ${day} ${monthName} ${year}

Format Time For UI
    [Documentation]    Converts time to UI display format (e.g., "5:30 AM")
    [Arguments]    ${time}
    ${time_str}=    Convert To String    ${time}
    ${parts}=    Split String    ${time_str}    :
    ${hour}=    Set Variable    ${parts}[0]
    ${minute}=  Set Variable    ${parts}[1]
    ${hour_int}=    Convert To Integer    ${hour}
    ${meridian}=    Run Keyword If    ${hour_int} < 12    Set Variable    AM    ELSE    Set Variable    PM
    ${hour_12}=    Run Keyword If    ${hour_int} == 0    Set Variable    12    ELSE IF    ${hour_int} > 12    Set Variable    ${hour_int - 12}    ELSE    Set Variable    ${hour_int}
    ${hour_12}=    Convert To String    ${hour_12}
    ${minute}=    Set Variable    ${minute.zfill(2)}
    RETURN    ${hour_12}:${minute} ${meridian}


Open MakeMyTrip On Chrome
    [Documentation]    Opens MakeMyTrip website in Chrome browser
    Open Browser    ${make_my_trip_url}    ${default_browser}
    Maximize Browser Window

Close The Browser
    [Documentation]    Closes the browser
    Close Browser



Close The Login Popup
    [Documentation]    Closes the login popup if visible
    Wait Until Element Is Visible    ${login_popup_close}
    Click Element    ${login_popup_close}

Minimize The Bot Popup
    [Documentation]    Minimizes the bot popup if visible
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${bot_close_icon}    5s
    IF    ${status}
        Click Element    ${bot_close_icon}
    END



Click on Cab Menu From Header Icons
    [Documentation]    Clicks on Cabs menu from header navigation
    Wait Until Element Is Visible    ${menu_cabs}
    Click Element    ${menu_cabs}


Select From City From ListBox
    [Documentation]    Selects the departure city from dropdown
    [Arguments]    ${test_data}
    &{my_dict}   Create Dictionary  &{test_data}
    ${from_city}=    Set Variable    ${my_dict}[from]
    Wait Until Element Is Visible    ${from_city_search}
    Click Element    ${from_city_search}
    ${from_city_option}=    Replace String    ${from_city_option_locator}    CITY    ${from_city}
    Wait Until Element Is Visible    ${from_city_option}
    Click Element    ${from_city_option}

Select To City From ListBox
    [Documentation]    Selects the destination city from dropdown
    [Arguments]    ${test_data}
    &{my_dict}   Create Dictionary  &{test_data}
    ${to_city}=    Set Variable    ${my_dict}[to]
    Wait Until Element Is Visible    ${to_city_search}
    Click Element    ${to_city_search}
    ${to_city_option}=    Replace String    ${to_city_option_locator}    CITY    ${to_city}
    Wait Until Element Is Visible    ${to_city_option}
    Click Element    ${to_city_option}


Select Departure Date From Calendar
    [Documentation]    Selects departure date from calendar with month navigation
    [Arguments]    ${departureDate}
    ${input_date}=    Format Date For Input    ${departureDate}
    ${day}    ${monthName}    ${year}=    Split String    ${input_date}
    
    # Open the calendar
    Wait Until Element Is Visible    ${departure_date_input}
    Click Element    ${departure_date_input}
    
    # Scroll
    Execute Javascript    window.scrollBy(0, 100);


    # Navigate to the correct month if needed
    ${target_month_year}=    Set Variable    ${monthName} ${year}
    FOR    ${i}    IN RANGE    6
        ${date_option}=    Replace String    ${departure_date_option_locator}    DAY    ${day}
        ${date_option}=    Replace String    ${date_option}    MONTH    ${monthName}
        ${date_option}=    Replace String    ${date_option}    YEAR    ${year}
        
        ${date_exists}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${date_option}    2s
        IF    ${date_exists}
            Click Element    ${date_option}
            BREAK
        ELSE
            Wait Until Element Is Visible    ${next_month_button}
            Click Element    ${next_month_button}
            Sleep    0.05s
        END
    END

Select Pickup Time From Dropdown
    [Documentation]    Selects pickup time from dropdown
    [Arguments]    ${pickupTime}
    # Parse the time string (e.g., "5:30 AM" -> ["5:30", "AM"])
    ${time_parts}=    Split String    ${pickupTime}    ${SPACE}
    ${time_part}=    Set Variable    ${time_parts}[0]
    ${meridian}=    Set Variable    ${time_parts}[1]
    # Split time part to get hour and minute (e.g., "5:30" -> ["5", "30"])
    ${hour_minute}=    Split String    ${time_part}    :
    ${hour_12}=    Set Variable    ${hour_minute}[0]
    ${minute}=    Set Variable    ${hour_minute}[1]
    # Select time from dropdown
    Wait Until Element Is Visible    ${pickup_time_input}
    Click Element    ${pickup_time_input}
    ${hour_option}=    Replace String    ${pickup_hour_option_locator}    HOUR    ${hour_12}
    ${minute_option}=    Replace String    ${pickup_minute_option_locator}    MINUTE    ${minute}
    ${meridian_option}=    Replace String    ${pickup_meridian_option_locator}    MERIDIAN    ${meridian}
    Click Element    ${hour_option}
    Click Element    ${minute_option}
    Click Element    ${meridian_option}
    Click Element    ${pickup_apply_btn_locator}


Click On Search Cabs Button
    [Documentation]    Clicks on Search Cabs button
    Wait Until Element Is Visible    ${search_cabs_button}
    Click Element    ${search_cabs_button}

Get Details Of First Cab In The List
    [Documentation]    Gets details of the first cab in search results
    [Tags]    cab-details
    ${cab_title}=    Get Text    ${cab_title_locator}
    ${cab_price}=    Get Text    ${cab_price_locator}
    ${cab_seats}=    Get Text    ${cab_seats_locator}
    ${cab_type}=    Get Text    ${cab_type_locator}
    ${cab_other_charges}=    Get Text    ${cab_other_charges_locator}
    Log To Console    \nFirst Cab Details:
    Log To Console    Title: ${cab_title}
    Log To Console    Price: ${cab_price}
    Log To Console    Seats: ${cab_seats}
    Log To Console    Type: ${cab_type}
    Log To Console    Other Charges: ${cab_other_charges}
    Run Keyword If    '${cab_title}' == '' or '${cab_title}' == '${NONE}'    Fail    Cab title not found! Locator may be incorrect or no cabs are listed.
    RETURN    ${cab_title}    ${cab_price}    ${cab_seats}    ${cab_type}    ${cab_other_charges}

Click On First Cab Select Button In The List
    [Documentation]    Clicks Select button on the first cab
    Wait Until Element Is Visible    ${cab_select_btn_locator}
    Click Element    ${cab_select_btn_locator}


Verify That The Page Is Navigated To Cab Menu
    [Documentation]    Verifies navigation to Cabs landing page
    Location Should Be    ${cabs_page_url}
    Wait Until Element Is Visible    ${cabs_search_widget}
    Element Should Be Visible    ${cabs_search_widget}
    Wait Until Element Is Visible    ${cabs_landing_container}
    Element Should Be Visible    ${cabs_landing_container}

Verify That Outstation One Way Is By Default Selected
    [Documentation]    Verifies Outstation One Way tab is selected by default
    Element Should Be Visible    ${active_outstation_oneway}

Verify That The Page Is Navigated To Cab Page
    [Documentation]    Verifies navigation to Cab listing page
    Location Should Contain    ${cabs_listing_page_url_fragment}
    Wait Until Element Is Visible    ${search_header_locator}
    Element Should Be Visible    ${search_header_locator}
    Wait Until Element Is Visible    ${cab_list_container_locator}
    Element Should Be Visible    ${cab_list_container_locator}

Verify That page Navigated To Review Booking Page
    [Documentation]    Verifies navigation to Review Booking page
    Wait Until Location Contains    ${review_booking_page_url_fragment}    20s
    Location Should Contain    ${review_booking_page_url_fragment}
    Wait Until Element Is Visible    ${review_booking_header_locator}
    Element Should Be Visible    ${review_booking_header_locator}
    Wait Until Element Is Visible    ${review_booking_layout_locator}
    Element Should Be Visible    ${review_booking_layout_locator}


Verify From City Is Entered
    [Documentation]    Verifies the From city is correctly entered
    [Arguments]    ${expected}
    ${my_dict}   Create Dictionary  &{expected}
    ${from_city}=    Set Variable    ${my_dict}[from]
    ${actual}=    Get Value    ${from_city_input_locator}
    Should Contain    ${actual}    ${from_city}

Verify To City Is Entered
    [Documentation]    Verifies the To city is correctly entered
    [Arguments]    ${expected}
    ${my_dict}   Create Dictionary  &{expected}
    ${to_city}=    Set Variable    ${my_dict}[to]
    ${actual}=    Get Value    ${to_city_input_locator}
    Should Contain    ${actual}    ${to_city}

Verify Departure Date Is Entered
    [Documentation]    Verifies the departure date is correctly entered
    [Arguments]    ${expected}
    ${actual}=    Get Text    ${departure_date_input}
    ${expected_ui}=    Format Date For UI    ${expected}
    Should Contain    ${actual}    ${expected_ui}

Verify Pickup Time Is Entered
    [Documentation]    Verifies the pickup time is correctly entered
    [Arguments]    ${expected}
    ${actual}=    Get Text    ${pickup_time_input}
    Should Contain    ${actual}    ${expected}


Verify That The Search Header Displays Correct Details
    [Documentation]    Verifies search header displays correct trip details
    [Arguments]    ${trip_type}    ${test_data}    ${departureDate}    ${pickupTime}
    ${my_dict}   Create Dictionary  &{test_data}
    ${fromCity}=    Set Variable    ${my_dict}[from]
    ${toCity}=    Set Variable    ${my_dict}[to]
    
     # Verify Trip Type
    ${actual_trip_type}=    Get Value    ${trip_type_input_locator}
    Should Contain    ${actual_trip_type}    ${trip_type}
    
    ${actual_from}=    Get Value    ${from_location_input_locator}
    Should Contain    ${actual_from}    ${fromCity}
    
    ${actual_to}=    Get Value    ${to_location_input_locator}
    Should Contain    ${actual_to}    ${toCity}

    ${actual_pickup_date}=    Get Value    ${pickup_date_input_locator}
    ${expected_pickup_date}=    Format Date For Input    ${departureDate}
    Should Contain    ${actual_pickup_date}    ${expected_pickup_date}

    ${actual_pickupTime}=    Get Value    ${pickup_time_input_locator}
    Should Contain    ${actual_pickupTime}    ${pickupTime}


Verify That The Selected Cab Details Are Correct In Review Booking Page
    [Documentation]    Verifies cab details on Review Booking page
    [Arguments]    ${trip_type}    ${test_data}    ${departureDate}    ${pickupTime}    ${cab_title}    ${cab_seats}    ${cab_type}
    
    ${my_dict}   Create Dictionary  &{test_data}
    ${fromCity}=    Set Variable    ${my_dict}[from]
    ${toCity}=    Set Variable    ${my_dict}[to]

    # Verify Trip Type
    ${actual_trip_type}=    Get Text    ${journey_details_trip_type_locator}
    Log To Console    Actual Trip Type: ${actual_trip_type} | Expected: ${trip_type}
    Should Contain    ${actual_trip_type}    ${trip_type}

    # Verify From/To Cities
    ${actual_from}=    Get Text    ${journey_details_from_locator}
    Should Contain    ${actual_from}    ${fromCity}

    ${actual_to}=    Get Text    ${journey_details_to_locator}
    Should Contain    ${actual_to}    ${toCity}

    # Verify Pickup Date
    ${actual_pickup_date}=    Get Text    ${journey_details_pickup_date_locator}
    ${expected_pickup_date_full}=    Format Date For Input    ${departureDate}
    ${expected_pickup_date_parts}=    Split String    ${expected_pickup_date_full}
    ${expected_pickup_date}=    Set Variable    ${expected_pickup_date_parts}[0] ${expected_pickup_date_parts}[1]
    Should Contain    ${actual_pickup_date}    ${expected_pickup_date}

    # Verify Pickup Time
    ${actual_pickupTime}=    Get Text    ${journey_details_pickup_time_locator}
    Should Contain    ${actual_pickupTime}    ${pickupTime}

    # Verify Cab Details
    ${review_cab_title}=    Get Text    ${review_cab_title_locator}
    Should Contain    ${review_cab_title}    ${cab_title}

    ${review_cab_seats}=    Get Text    ${review_cab_seats_locator}
    Should Contain    ${review_cab_seats}    ${cab_seats}

    ${review_cab_type}=    Get Text    ${review_cab_type_locator}
    Should Contain    ${review_cab_type}    ${cab_type}

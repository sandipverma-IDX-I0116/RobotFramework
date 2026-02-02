*** Settings ***
Library             SeleniumLibrary
Library             ../Resources/CustomKeywords/utils.py
Resource            ../Resources/cabs_keywords.resource



*** Variables ***
${TRIP_TYPE_OUTSTATION}         Outstation One-Way
${TRIP_TYPE_REVIEW}             Outstation One Way Trip
${SELENIUM_SPEED}               0.05s


*** Test Cases ***
TC_001: Verify Outstation One Way Cab Booking Flow
    # Setup
    Open MakeMyTrip On Chrome
    Set Selenium Speed    ${SELENIUM_SPEED}
    Close The Login Popup
    Minimize The Bot Popup

    # Navigate to Cabs Section
    Click on Cab Menu From Header Icons
    Verify That The Page Is Navigated To Cab Menu
    Verify That Outstation One Way Is By Default Selected

    # Load Test Data
    &{test_data}=    Fetch Testdata By Id    ${test_data_file}    TC_1
    Log    Test Data: ${test_data}    console=yes
    
    # Generate Random Departure Date
    ${random_departure_date}=    Generate Random Departure Date
    Log    Random Departure Date: ${random_departure_date}    console=yes
    
    # Generate Random Pickup Time
    ${random_pickup_time}=    Generate Random Pickup Time
    Log    Random Pickup Time: ${random_pickup_time}    console=yes

    # Fill Booking Form - From City
    Select From City From ListBox    ${test_data}
    Verify From City Is Entered    ${test_data}

    # # Fill Booking Form - To City
    Select To City From ListBox    ${test_data}
    Verify To City Is Entered    ${test_data}

    # Fill Booking Form - Departure Date
    Select Departure Date From Calendar    ${random_departure_date}
    Verify Departure Date Is Entered    ${random_departure_date}

    # Fill Booking Form - Pickup Time
    Select Pickup Time From Dropdown    ${random_pickup_time}
    Verify Pickup Time Is Entered    ${random_pickup_time}

    # Search Cabs
    Click On Search Cabs Button
    Verify That The Page Is Navigated To Cab Page
    Verify That The Search Header Displays Correct Details    ${TRIP_TYPE_OUTSTATION}    ${test_data}   ${random_departure_date}    ${random_pickup_time}
    

    # Select Cab and Verify Booking
    ${cab_title}    ${cab_price}    ${cab_seats}    ${cab_type}    ${cab_other_charges}=    Get Details Of First Cab In The List
    Click On First Cab Select Button In The List
    Verify That page Navigated To Review Booking Page
    Verify That The Selected Cab Details Are Correct In Review Booking Page    ${TRIP_TYPE_REVIEW}    ${test_data}    ${random_departure_date}    ${random_pickup_time}    ${cab_title}    ${cab_seats}    ${cab_type}

    # Cleanup
    Sleep    2s
    Close The Browser

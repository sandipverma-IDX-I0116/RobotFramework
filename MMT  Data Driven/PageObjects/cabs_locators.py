login_popup_close = "//span[@data-cy='closeModal']"
bot_close_icon = "//img[contains(@src,'close-icon.png')]//parent::div"

menu_cabs = "//li[@data-cy='menu_Cabs']"

cabs_search_widget = "//div[@data-cy='cabsSW']"
cabs_landing_container = "//main[@class='landingContainer']"
active_outstation_oneway = "//li[@data-cy='outstationOneWay' and contains(@class,'b2c_selected ')]"

from_city_search = "//label[@for='fromCity']//parent::div[contains(@data-cy,'OutstationOneWayWidget')]"
from_city_option_locator = "//span[text()='CITY']//ancestor::div[contains(@class,'makeFlex')]"
from_city_input_locator = "//input[@id='fromCity']"

to_city_search = "//label[@for='toCity']//parent::div[contains(@data-cy,'OutstationOneWayWidget')]"
to_city_option_locator = "//span[text()='CITY']//ancestor::div[contains(@class,'makeFlex')]"
to_city_input_locator = "//input[@id='toCity']"

departure_date_input = "//label[@for='departure']//parent::div[contains(@data-cy,'OutstationOneWayWidget')]"
next_month_button = "//span[@aria-label='Next Month']"
departure_date_option_locator = "//div[contains(@aria-label,'MONTH DAY YEAR')]"

pickup_time_input = "//label[@for='pickupTime']//parent::div[contains(@data-cy,'OutstationOneWayWidget')]"
pickup_hour_option_locator = "//ul[@class='newTimeSlotHrUl']/li/span[contains(text(),'HOUR')]"
pickup_minute_option_locator = "//ul[@class='newTimeSlotMinUl']/li/span[contains(text(),'MINUTE')]"
pickup_meridian_option_locator = "//ul[@class='newTimeSlotMerUl']/li/span[text()='MERIDIAN']"
pickup_apply_btn_locator = "//div[@class='applyBtn']"

search_cabs_button = "//a[contains(@data-cy,'OutstationOneWayWidget') and text()='Search']"

trip_type_input_locator = "//input[@id='trip_type']"
from_location_input_locator = "//input[@id='from_location']"
to_location_input_locator = "//input[@id='to_location']"
pickup_date_input_locator = "//input[@id='pickup_date']"
pickup_time_input_locator = "//input[@id='pickup_time']"

search_header_locator = "//div[contains(@class,'searchHeader')]"
cab_list_container_locator = "//div[contains(@class,'cabList_container')]"

cab_title_locator = "(//div[contains(@data-testid,'CAB_CARD')]/descendant::span[@data-testid='CAB_TITLE'])[1]"
cab_price_locator = "(//div[contains(@data-testid,'CAB_CARD')]//span[contains(@class,'cabDetailsCard_price')])[1]"
cab_seats_locator = "(//div[contains(@data-testid,'CAB_CARD')]//span[contains(@class,'utilityTitle')])[1]"
cab_type_locator = "(//div[contains(@data-testid,'CAB_CARD')]//span[contains(@class,'utilityTitle')])[2]"
cab_other_charges_locator = "(//div[contains(@data-testid,'CAB_CARD')]//span[contains(@class,'otherCharges')])[1]"
cab_select_btn_locator = "(//div[contains(@data-testid,'CAB_CARD')]//button)[1]"

review_booking_header_locator = "//div[contains(@class,'page-content')]/h1[text()='Review Booking']"
review_booking_layout_locator = "//div[contains(@class,'page-content')]/div[contains(@class,'layout')]"

journey_details_trip_type_locator = "//div[contains(@class,'journeyDetailsView')]/span"
journey_details_from_locator = "(//div[contains(@class,'routeDetails')]/span)[1]"
journey_details_to_locator = "(//div[contains(@class,'routeDetails')]/span)[3]"
journey_details_pickup_date_locator = "//div[contains(@class,'journeyduration')]/span"
journey_details_pickup_time_locator = "//div[contains(@class,'journeyduration')]/span"

review_cab_title_locator = "//div[contains(@class,'cabDetailsView')]//h3"
review_cab_seats_locator = "(//div[contains(@class,'cabDetailsView')]//span[contains(@class,'utilityTitle')])[1]"
review_cab_type_locator = "(//div[contains(@class,'cabDetailsView')]//span[contains(@class,'utilityTitle')])[2]"

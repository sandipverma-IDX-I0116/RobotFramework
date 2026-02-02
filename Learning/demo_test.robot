*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${char_1}   Set Variable    41


*** Keywords ***
Hello World
    Log To Console  Hello World

Open Google Chrome
    Open Browser    https://www.makemytrip.com/     Chrome


*** Test Cases ***
#Test
#    Hello World
#    Open Browser    https://www.google.com  Chrome

Test Xpath
    Open Google Chrome
    Wait Until Element is Visible   xpath://a[@data-cy="mmtLogo"]/img[@src="https://promos.makemytrip.com/Growth/Images/1x/mmt_dt_top_icon.png"]
    Wait Until Element is Visible   xpath://*[text()="List Your Property"]
    Wait Until Element is Visible   xpath://p[@class="styles__SubtitleText-sc-3oig6s-2 fgLmOh" and text()="Grow your business!"]
    Wait Until Element is Visible   xpath://*[text()="Flights"]
    Wait Until Element is Visible   xpath://div[@class="makeFlex hrtlCenter"]/ul[@class="fswTabs latoRegular darkGreyText "]
    Wait Until Element is Visible   xpath://div[@class="makeFlex hrtlCenter"]/*/li[@data-cy="oneWayTrip"]
    Wait Until Element is Visible   xpath://div[@class="makeFlex hrtlCenter"]/*/li[@data-cy="roundTrip"]
    Wait Until Element is Visible   xpath://div[@class="makeFlex hrtlCenter"]/*/li[@data-cy="mulitiCityTrip"]
    Wait Until Element is Visible   xpath://label[@for="fromCity"]/span[text()="From"]
    Wait Until Element is Visible   xpath://span[@class="fltSwipCircle" and text()="⇌"]
    Wait Until Element is Visible   xpath://label[@for="toCity"]/span[text()="To"]
    Wait Until Element is Visible   xpath://label[@for="departure"]/span[text()="Departure"]
    Wait Until Element is Visible   xpath://span[@class="lbl_input appendBottom10" and text()="Return"]
    Wait Until Element is Visible   xpath://label[@for="travellers"]/span[text()="Travellers & Class"]
    Wait Until Element is Visible   xpath://p[@data-cy="submit"]/a[text()="Search"]
    Wait Until Element is Visible   xpath://span[@data-cy="tertiaryRowHeaderIconLeft"]/span[@class="xplrArw"]
    Wait Until Element is Visible   xpath://span[@data-cy="tertiaryRowHeaderText" and text()="Explore More"]


Test Absolute xpath
    #Open Google Chrome
    Wait Until Element is Visible   xpath:/html/body/div[1]/div/div[1]/div[1]/div[2]/div/div/nav/ul/li[1]/span/a/span[1]/span
    Wait Until Element is Visible   xpath:/html/body/div[1]/div/div[1]/div[1]/div[2]/div/div/nav/ul/li[2]/span/a/span[1]/span
    Wait Until Element is Visible   xpath:/html/body/div[1]/div/div[2]/div/div/div/div/div/div[1]/ul/li[1]
    Wait Until Element is Visible   xpath:/html/body/div[1]/div/div[2]/div/div/div/div/div/div[2]/div[1]/span
    Wait Until Element is Visible   xpath:/html/body/div[1]/div/div[2]/div/div/div/div/div/div[2]/p/a


Test Relative xpath
    #Open Google Chrome
    Wait Until Element is Visible   xpath://a[@href="/flights/"]/span[@class="headerIconTextAlignment chNavText darkGreyText" and text()="Flights"]
    Wait Until Element is Visible   xpath://span[@class="headerIconTextAlignment chNavText darkGreyText" and text()="Hotels"]
    Wait Until Element is Visible   xpath://div[@class="makeFlex hrtlCenter"]/*/li[@data-cy="oneWayTrip"]
    Wait Until Element is Visible   xpath://span[@class="fltSwipCircle" and text()="⇌"]
    Wait Until Element is Visible   xpath://p[@data-cy="submit"]/a[text()="Search"]


Test Starts With
    #Open Google Chrome
    Wait Until Element is Visible   xpath://a[starts-with(@data-cy,"mmt")]
    Wait Until Element is Visible   xpath://p[starts-with(@class,"hpClcn")]
    Wait Until Element is Visible   xpath://h3[starts-with(@class,"appDnld")]
    Wait Until Element is Visible   xpath://p[starts-with(@data-test,"topDestination")]
    Wait Until Element is Visible   xpath://a[starts-with(@data-cy,"anchor-delhi")]


Test Contains
    #Open Google Chrome
    Wait Until Element is Visible   xpath://a[contains(@data-cy,"mmt") and contains(@class,"Logo")]
    Wait Until Element is Visible   xpath://p[contains(@data-test,"Wrapper") and contains(@class,"heading") and contains(text(),"Collections")]
    Wait Until Element is Visible   xpath://h3[contains(@data-test,"DownloadWrapper")]
    Wait Until Element is Visible   xpath://p[contains(@data-test,"topDestination")]
    Wait Until Element is Visible   xpath://a[contains(@data-cy,"chennai") and contains(text(),"Delhi")]


Test Text
    #Open Google Chrome
    Wait Until Element is Visible   xpath://p[text()="List Your Property"]
    Wait Until Element is Visible   xpath://span[text()="Tours & Attractions" and contains(@class,"chNavText")]
    Wait Until Element is Visible   xpath://font[text()="View Details"]
    Wait Until Element is Visible   xpath://a[text()="Search"]
    Wait Until Element is Visible   xpath://button[text()="GET APP LINK"]


Test Or
    #Open Google Chrome
    Wait Until Element is Visible   xpath://button[@data-cy="submitBtnWrapper" or data-test="submitBtnWrapper"]
    Wait Until Element is Visible   xpath://li[@class="active" and text()="Personal Account" or data-acctype="personal"]
    Wait Until Element is Visible   xpath://span[@class="latoBold blackText font14" or contains(text(),"ICICI")]
    Wait Until Element is Visible   xpath://span[data-cy="tertiaryRowHeaderText" or text()="Explore More"]
    Wait Until Element is Visible   xpath://p[contains(@class,"promotionalText") or text()="WELCOMEMMT"]


Test Following
    #Open Google Chrome
    Wait Until Element is Visible   xpath://span[@class="lbl_input appendBottom10"]//following::input[@id="fromCity"]
    Wait Until Element is Visible   xpath://p[@class="code makeRelative"]//following::span[@class="fltSwipCircle"]
    Wait Until Element is Visible   xpath://div[text()="Regular"]//following::div[text()="Regular fares"]
    Wait Until Element is Visible   xpath://span[text()="Explore More"]//following::span[text()="Where2Go"]
    Wait Until Element is Visible   xpath://p[@data-cy="superOfferPtl0"]//following::a[@data-cy="superOfferCtaText0"]

Test Following-sibling
    #Open Google Chrome
    Wait Until Element is Visible   xpath://label[@for="fromCity"]//following-sibling::input    #[@data-cy="fromCity"]
    Wait Until Element is Visible   xpath://div[@class="makeFlex column itemCard"]//following-sibling::div[@class="itemDesc"]//following-sibling::p[@data-cy="superOfferPtl1"]
    Wait Until Element is Visible   xpath://div/h2[starts-with(text(),"Experience Flying")]//following::div//following-sibling::div/img[contains(@data-cy,"item-1")]
    Wait Until Element is Visible   xpath://div/p[starts-with(@class,"indexstyles__FlgStores")]//following::div//following-sibling::div/div/div[text()="Hyatt Hotels"]
    Wait Until Element is Visible   xpath://div[@class="makeFlex spaceBetween"]//following-sibling::span[contains(@data-test,"apple_img")]

Test Parent
    #Open Google Chrome
    Wait Until Element is Visible   xpath://span[text()="From"]//parent::label[@for="fromCity"]
    Wait Until Element is Visible   xpath://ul[@class="footNav__list"]//parent::div/p[text()="MakeMyTrip"]
    Wait Until Element is Visible   xpath://div[@itemprop="text"]//parent::div//parent::div/h2[@itemprop="name" and text()="Why MakeMyTrip?"]
    Wait Until Element is Visible   xpath://a//parent::p//parent::div[@class="slideDesc"]//parent::div/div/img[@data-cy="dealCarouselImg3"]
    Wait Until Element is Visible   xpath://p[@data-cy="superOfferPtx1"]//parent::div/div/p[text()="DOM HOTELS"]

Test Child
    #Open Google Chrome
    Wait Until Element is Visible   xpath://div[@class="makeFlex hrtlCenter"]//child::ul/li[@data-cy="roundTrip"]
    Wait Until Element is Visible   xpath://ul[contains(@class,"makeFlex")]//child::li[@data-cy="menu_Holidays"]
    Wait Until Element is Visible   xpath://div//child::div[text()="Student"]
    Wait Until Element is Visible   xpath://div//child::span/div/font[text()="View Details"]
    Wait Until Element is Visible   xpath://ul//child::li/a/span[text()="Forex"]

Test Self
    #Open Google Chrome
    Wait Until Element is Visible   xpath://p[@class="widgetTitle flexOne"]//self::a[text()="Domestic Flights"]
    Wait Until Element is Visible   xpath://span//self::span[text()="INR"]
    Wait Until Element is Visible   xpath://div//self::p[@data-cy="LoginHeaderText"]
    Wait Until Element is Visible   xpath://div//self::img[contains(@class,"search-icon")]
    Wait Until Element is Visible   xpath://div//self::img[contains(@class,"icQRCode")]

Test Descendant
    #Open Google Chrome
    Wait Until Element is Visible   xpath://div//descendant::p[contains(text(),"favourites")]
    Wait Until Element is Visible   xpath://html//descendant::span[contains(@data-cy,"Gift Cards")]
    Wait Until Element is Visible   xpath://div[contains(@class,"FlagshipStoreContainer")]//descendant::div[text()="Majestic Hotels"]
    Wait Until Element is Visible   xpath://div[@class="slick-list"]//descendant::p[text()="Hill Stations"]
    Wait Until Element is Visible   xpath://ul[@class="footNav__list"]//descendant::a[contains(@data-cy,"villas-in-goa")]
    Wait Until Element is Visible   xpath://div//descendant-or-self::p[text()="About the Site"]     #Descendant or self
    Wait Until Element is Visible   xpath://p//descendant-or-self::b[text()="FLAT 12%"]     #Descendant or self

Test Ancestor
    #Open Google Chrome
    Wait Until Element is Visible   xpath://div[text()="Wyndham Hotels & Resorts"]//ancestor::div//p[contains(text(),"Flagship Hotel")]
    Wait Until Element is Visible   xpath://span[contains(@class,"lbl_input")]//ancestor::div//li[@data-cy="oneWayTrip"]
    Wait Until Element is Visible   xpath://div[text()="Senior Citizen"]//ancestor::div//div[text()="SPECIAL FARES"]
    Wait Until Element is Visible   xpath://button[@data-test="submitBtnWrapper"]//ancestor-or-self::div//span[contains(@class,"placeholderNumber")]    #Ancestor or self
    Wait Until Element is Visible   xpath://span[@data-cy="More"]/ancestor-or-self::div//font[text()="Offers"]  #Ancestor or self

Test Preceding
    #Open Google Chrome
    Wait Until Element is Visible   xpath://li[@data-cy="BANK_OFFERS"]/preceding::li/a[@id="superOffersTab_ALL"]
    Wait Until Element is Visible   xpath://li[@data-cy="taj-lake-palace-udaipur-613"]/preceding::li[@data-cy="taj-rishikesh-67"]
    Wait Until Element is Visible   xpath://li[@data-cy="mulitiCityTrip"]/preceding::li[text()="Round Trip"]
    Wait Until Element is Visible   xpath://li[@data-cy="BANK_OFFERS"]/preceding-sibling::li[@data-cy="ALL"]    #Preceding sibling
    Wait Until Element is Visible   xpath://li[@data-cy="taj-lake-palace-udaipur-613"]/preceding-sibling::li/a[text()="Fairmont Jaipur"]    #Preceding sibling


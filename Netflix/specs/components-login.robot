***Settings***
Library  Selenium2Library

Resource        ../../netflix/stepdefinitions/components-login-sd.robot         
         

***Test Cases***
Check elements on Login page
    Given that the netflix login page is open
    Then the content load correctly 

*** Keywords ***
that the netflix login page is open
    Given I am in login page
    
the content load correctly 
    Then the content load correctly in the page
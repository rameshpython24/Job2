*** Settings ***
Library		SeleniumLibrary
Library		XML
Library 	OperatingSystem
Library 	collections


*** Variables ***
${xml}	demo2.xml  
${Br}	Chrome
${url}	http://automationpractice.com/index.php?controller=authentication&back=my-account

*** Test Cases ***
Registraction
	open browser	${url}	${br}
        maximize browser window
        Myaccount
        close browser	 

*** Keywords ***
Myaccount
  	${obj}=			parse xml	${xml}
	&{email}= Get Element Attributes ${obj} .//email[0]
        &{Radio}= Get Element Attributes ${obj} .//Radio/mrs
        &{firstname}= Get Element Attributes ${obj} .//name/firstName
        &{lastname}= Get Element Attributes ${obj} .//name/lastName
	
	input text	name:email_create	${email}
	click button    xpath://*[@id="SubmitCreate"]
	sleep	2
       	select radio button	id_gender	${Radio}
        input text	xpath://*[@id="customer_firstname"]	${firstname}
	input text	xpath://*[@id="customer_lastname"]	${lastname}
     	input password	name:passwd	ramesh
        select from list by value	days	15
	sleep	2
        select from list by Index	months	8
	sleep	2
	select from list by value	years	1992
        sleep	5
	select checkbox	newsletter
        sleep	2	
        
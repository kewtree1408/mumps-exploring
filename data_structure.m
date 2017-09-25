; person -> name -> first
;                -> last
;  	     -> email -> login
;                 -> domain
;    	 -> phone
;	     -> account  -> currency_type
;                    -> closed
;                    -> amount_of_money

set ^person("name","first")="John"
set ^person("name","last")="Smith"
set ^person("email","login")="john"
set ^person("email","domain")="smith.com"
set ^person("phone")="+79256783490"
set ^person("account","currency_type","EUR")=""
set ^person("account","closed",0)=""
set ^person("account","amount_of_money",63456.89)=""


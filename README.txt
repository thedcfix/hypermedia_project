

Cattaneo Davide      808 307
Cerizzi Francesco     807 933



Hypermedia project – technology part


As required, the developed web site represent a technological implementation of the mockup we previously did.
In order to make a good looking web site we chose to use a framework Bootstrap, wich is a known collection of CSSs and scripts but we chose to partiallty modify those CSSs to better suit our needs.
In general we opted for a clean, modern and flat style. Everything else was made from scratch.

In our web site every service, device and  assistance service is dynamically queried from the web hosted DB. To do that we used JQuery calls on loading pages and PHP calls to fetch data from the DB. Every data gotten from the data base in then put into pre-defined HTML template pages and linked to every other needed content using the GET method to pass data between these pages.
We also decided to implement a dynamic selection method for showing highlighted assistance services. In practise, we select the most viewed assistance services by fetching those services which got the higher number of views and then we show a top 5. To do that we added a new field to our DB, called views, which is by default set to 0. Every time a user clicks on an assistance service we lauch a query to update that value adding 1. This way we are effectively able to show those services that might be interesting for the user.

Regarding the static content, insted, the “Home”, ”Group” and “Who we are” pages are the only kind of static content we chose to implement. In particular, with regards to the group page, called “TIM”, we opted for the static implementation of the “news” section because of the lack of information about where that data is gotten. Given that we were not in possess of a DB to query that results we preferred not to implement a single unconnected meaningless table inside our projet to simply represent that particular case.


Regards,
Davide Cattaneo, Francesco Cerizzi

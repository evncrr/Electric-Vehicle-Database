## Introduction
Electric vehicles have emerged as a transformative force in the automotive industry,
signaling a shift toward more sustainable transportation. They rely on electricity as their primary
power source and are classified into two main types: Battery Electric Vehicles, which run solely
on electric power, and Plug-In Hybrid Electric Vehicles, which combine a traditional internal
combustion engine with electric power. This shift towards electrification is driven by the
growing need to reduce carbon emissions and dependency on fossil fuels. As of 2021, the US
electric vehicle population stands at approximately 2 million, a number set to expand with the
continuous release of innovative EV models and the expansion of charging infrastructure.
Government incentives, including subsidies and tax credits, have further bolstered the adoption
of electric vehicles, making them a strong option for customers seeking to lower their
environmental footprint.
The data in question offers a detailed snapshot of the current state of electric vehicle
adoption in Washington state. Compiled by the Washington State Department of Licensing, it
provides comprehensive data on both BEVs and PHEVs registered within the state. The dataset
includes valuable information such as vehicle makes and models, geographic distribution of
registrations, and details on vehicles that qualify for the state’s Clean Alternative Fuel Vehicle
program, which offers tax exemptions to promote greener transportation options. Such data
serves as a valuable resource for understanding market dynamics, gauging the effectiveness of
government incentives, and identifying trends in consumer preferences. This information is vital
not only for policy makers and industry stakeholders, but also for environmental organizations
and research aiming to understand and speed up the transition to cleaner vehicles.
## Target Audience
The primary purpose of our dataset is to offer comprehensive insights into the current
economy and landscape of EV adoption, specifically within the state of Washington. By
providing detailed information on the types, makes, models, and geographic distribution of
BEVs and PHEVs registered in the state, the database helps track market trends, gauge the
effectiveness of government incentives, and understand patterns in consumer behavior. The
target audience includes EV manufacturers, environmental and pollution control organizations,
policymakers, and researchers. These people can all use the dataset to analyze market
penetration, guide strategic decisions, and formulate policies aimed at fostering the growth of
sustainable transportation alternatives.
## Sample Data
The first step to narrow down the data was to determine what state to gather data from.
This is because some states may not have a comprehensive database of their electric vehicles. A
factor in this was what legislation may exist in the state to encourage electric vehicle usage, as
this would result in a larger probability of more electric vehicles being in that state as well as
more detailed data. In this case, my group decided on Washington because of their Clean
Alternative Fuel Vehicle program which gave tax exemptions for greener transportation options.
A larger population of vehicles would create a better picture and impact of electric vehicles on an
area. Having data on vehicles in a similar geographic location would also make data aggregation
easier and can showcase the impact of electric vehicles in Washington compared to other states
in the US.
## Logical Design
One important factor our group took into account while designing the database was to
reduce redundancy. An example is how registration for each vehicle has a district. To enforce
proper database design, a district_id acted as a foreign key in the registration table. Two tables
were created to reduce data redundancy as multiple vehicles can be in the same district, and
reduce the risk that two tables would contain different information relating to the same district.
This also followed the dependency principles in normalization. The same data redundancy
relationship also applied to the utility and vehicle utility data tables. Another factor our group
took into account was the normalization process. Our group identified that the database has four
entities: Vehicles, Registration, Location and Utilities. This helped create the basis of the 1NF of
the normalization process The first normalization process (1NF) meant that each table we would
have to create would need a primary key to show that each record in the table is unique which
prevented inserted duplicate data as well, which also helped data redundancy as well. The second
form of normalization (2NF) increased functional dependencies by making all columns of the
table strictly depend on its primary key, which improved the data structure and made the data
more consistent, as well as further reducing data redundancy. The final form of normalization
which was the eventual database design implemented was the third form (3NF). This guaranteed
there would be no data duplication as it eliminated non-transitive dependencies for non-primary
key columns in the tables. From the normalization process, we were also able to identify what
relationships existed between tables in terms of primary and foreign keys.
## Views
### View 1
The ElectricVehiclesByMakeModel view provides valuable insights into the distribution
of electric vehicles in Washington state. It offers a detailed overview of registered electric
vehicles based on their make, model, and type (BEV or PHEV). The view joins data from the
vehicle and registration tables to display the number of registered vehicles for each make and
model, further distinguishing them by vehicle type. This structure allows stakeholders to assess
the popularity of specific makes and models and how they compare between BEVs and PHEVs.
The view answers questions such as which electric vehicle makes and models are most popular
in the state and how the popularity of BEVs compare to PHEVs for specific makes and models.
By presenting this data, the view enables market analysis and helps identify which vehicles are
most favored by consumers, providing useful insights for manufacturers and policymakers alike.
### View 2
The VehicleRangeSummary view focuses on summarizing the range capabilities of
electric vehicles, categorized by their manufacturer and type. By grouping data from the vehicle
table, the view calculates the average, maximum and minimum range values for each
manufacturer and vehicle type, distinguishing between BEVs and PHEVs. This summary helps
to highlight the range of different vehicle models, providing a comprehensive overview of their
range capabilities. The view addresses questions such as the average, maximum and minimum
ranges of electric vehicles produced by different manufacturers and how the range capabilities of
BEVs compare to PHEVs from the same manufacturer. This information is essential for
understanding the technological advancements of different manufacturers and how these
advancements translate into practical driving ranges for consumers.
### View 3
The LatestModelsByMake view gathers data from the Vehicle table to determine the
newest model year for each type of vehicle, based on its make and model. It includes columns
that show the make and model of the vehicle, along with the most recent year that model was
available. This view helps easily identify the latest version of each vehicle make and model in
the database.
### View 4
The DetailedEvSpecifications view gathers specific details about electric vehicles that
have a positive base MSRP and driving range. This view includes information such as the VIN,
make, model, year of the model, type of electric vehicle, driving range, and base MSRP. It helps
to identify electric vehicles that meet certain price and range requirements, which is important
for comparing, analyzing, or selling these vehicles.
### View 5
The TopSellingEVsByLocation view is able to offer insights of the popularity and
distribution of EVs across different cities. It integrates the vehicle, registration, vehicle_location,
and location tables which allows for the aggregation of total registrations for each make and
model of electric vehicles within each city. This detailed breakdown reveals which electric
vehicles are most common in specific areas, showing regional preferences and the market
conditions in different geographic locations. This view would be helpful for stakeholders such as
automotive manufacturers, city planners, and environmental policy makers.
### View 6
The EVChargingUtilitySupport is able to show the involvement of different utility
companies in the electric vehicle sector by showing how many EVs are supported by each utility
provider. This is done by counting the number of electric vehicles associated with each company
using data from the utility and vehicle_utility tables. This view is crucial for understanding
which utility companies are actively facilitating the adoption of EVs and the extent of their
involvement in developing EV infrastructure.
## Changes Since Project Proposal
Our project has undergone some changes since our project proposal. Originally, we
planned for the database to capture the spread and adoption of EVs across a larger scope. We
initially planned for our database to be a valuable resource for anyone interested in the data of
EVs. We shifted our focus to just the dataset of Washington state, offering a narrower, but more
detailed snapshot of the current state of EVs. Our initial plan included a dataset that was too
large for our database. We changed the way in which we found the data for our sample data from
our initial plan. Instead of filtering and aggregating data based on certain traits, we decided to
narrow down our data by finding the right state in which to collect our sample data from. We
originally planned on including environmental data showing the environmental impact of EVs in
our database but couldn’t get the necessary datasets to include it.
## Database Ethics Consideration
There was only one database ethic that we had to consider while creating our database.
We had to consider the database ethic of fair use while creating our database. Our dataset
includes a lot of data that some manufacturers may say does not fall under fair use. We made
sure to utilize data from the Washington State Department of Licensing to ensure no ethics were
being violated. Besides fair use, database ethics was not much of a concern while making our EV
database. We felt that equity, inclusion, and privacy would not be violated from the data that we
were working with. Along with this, our sample data and target audience were not affected by
the database ethics. We did however have to be cognizant of the fair use of our data. Fair use
ethics impacted our database design as we had to make sure we were using licensed data so that
we weren’t breaching fair use.
## Potential Future Work
In the future, we may add additional data sources and look to improve upon the insights
given by our database. We may look to add real-time data for data like the EV charging
infrastructure and vehicle sales to make the database more dynamic and holistic. By adding more
data sources we could begin to widen our scope of data, expanding our database beyond
Washington state. We may expand the data of our database by adding more tables to make our
database more advanced. We may add more tables like vehicle specifications, owner
demographics, and usage patterns to make our database more rich. We may also add data relating
to the environmental impact of the EVs to the database to show which EVs may fall short and to
see how they really are impacting the environment. Lastly, we may look to improve the data
visualization tools and user interfaces of our database to make it more readable.
## EER Diagram
<img width="996" height="796" alt="image" src="https://github.com/user-attachments/assets/7b6c8166-daab-49fb-81f7-47788d13b71a" />


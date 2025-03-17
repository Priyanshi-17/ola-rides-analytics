Create Database Ola;
Use Ola;

Create View Whole_Table As 
Select * From bookings;


#-----------------------------------------------------------------------------------------------

# 1.  Retrieve all successful bookings
Create View Successfull_Booking As
Select * From bookings 
where `Booking Status` = 'Success';

#-----------------------------------------------------------------------------------------------

# 2.  Find the average ride distance for each vehicle type
Create View Average_Ride As
Select `Vehicle Type` , Avg(`Ride Distance`) As Average_Ride_Distance 
From bookings 
Group by `Vehicle Type`;

#-----------------------------------------------------------------------------------------------

# 3. Get the total number of cancelled rides by customers

#DROP VIEW IF EXISTS Cancell_Ride_By_Customer;
Create View Cancell_Ride_By_Customer As
Select Count(`Cancelled Rides by Customer`) As 
Cancell_Ride_By_Customer from bookings
WHERE `Cancelled Rides by Customer` <> 'NaN';

#-----------------------------------------------------------------------------------------------

# 4.  List the top 5 customers who booked the highest number of rides
Create View Top_5_Customer AS
Select `Customer ID` , COUNT(`Booking ID`) As Total_rides 
From bookings
Group by `Customer ID`
Order by Total_rides DESC LIMIT 5;   

#-----------------------------------------------------------------------------------------------

#5. Get the number of rides cancelled by drivers due to personal and car-related issues

Create View Rides_cancelled_by_Drivers_P_C_Issues AS
Select * from bookings 
where `Cancelled Rides by Driver` = 'Personal & Car related issues';

#-----------------------------------------------------------------------------------------------

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings

Create View Max_Min_Rating_PrimeSedan As
Select Max(`Customer Rating`) As Maximum_Rating , MIN(`Customer Rating`) As Minimum_Rating
From bookings
Where `Vehicle Type`= 'Prime Sedan'
AND `Customer Rating` <> 'NAN';
 

#-----------------------------------------------------------------------------------------------

# 7. Retrieve all rides where payment was made using UPI

Create View Payment_UPI As
Select * From bookings where
`Payment Method` = 'UPI';

#-----------------------------------------------------------------------------------------------

#8. Find the average customer rating per vehicle type

Create View Avg_Cust_Rating As
Select `Vehicle Type`, Avg(`Customer Rating`) As AVERAGE_CUSTOMER_RATING
From bookings
Group By `Vehicle Type`;

#-----------------------------------------------------------------------------------------------

#9. Calculate the total booking value of rides completed successfully

Create View Total_Book_SuccessFull As
Select SUM(`Booking Value`) as Total_SucessFul_Booking
From bookings 
where `Booking Status` = 'Success';

#-----------------------------------------------------------------------------------------------

#10. List all incomplete rides along with the reason

Create View Incomplete_Rides As
Select `Booking ID`, `Incomplete Rides Reason`From bookings
Where `Incomplete Rides` = 'Yes';



#-----------------------------------------------------------------------------------------------


Select * From Whole_Table;
Select * From Successfull_Booking;
Select * From Average_Ride;
Select * from Cancell_Ride_By_Customer;
Select * from Top_5_Customer;
Select * From Rides_cancelled_by_Drivers_P_C_Issues;
Select * From Max_Min_Rating_PrimeSedan;
Select * From Payment_UPI; 
Select * From Avg_Cust_Rating;
Select * from Total_Book_SuccessFull;
Select * From Incomplete_Rides;
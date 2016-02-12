LOAD DATA INFILE 'sample\\bus3.csv'
INTO TABLE bus
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(StopID , 
RouteNo ,
StopName, 
Ride0, Alight0,
Ride1, Alight1,
Ride2, Alight2,
Ride3, Alight3,
Ride4, Alight4,
Ride5, Alight5,
Ride6, Alight6,
Ride7, Alight7,
Ride8, Alight8,
Ride9, Alight9,
Ride10, Alight10,
Ride11, Alight11,
Ride12, Alight12,
Ride13, Alight13,
Ride14, Alight14,
Ride15, Alight15,
Ride16, Alight16,
Ride17, Alight17,
Ride18, Alight18,
Ride19, Alight19,
Ride20, Alight20,
Ride21, Alight21,
Ride22, Alight22,
Ride23, Alight23,
UseMon)
libname libsas excel "C:\Wallpaper\LungCapData.xls";
DATA TOAD;
	INFILE 'C:\Course\MIS 6334 - ABI\SAS workdirectory\toadjump.dat';
	INPUT Name $ height1 height2 height3 height4 ;
run;
DATA uspresidents;
   INFILE 'c:\Course\MIS 6334 - ABI\SAS workdirectory\USPresidents.dat';
   INPUT President $ Party $ Number 1.1;
RUN;
PROC PRINT Data=Toad;
	Title 'Toadsie';
Run;
proc print data=uspresidents;
	title 'uspresidents';
run;
data contest;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Pumpkin.dat';
	input Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10. (Score1 Score2 Score3 Score4 Score5) (4.1);
run;
proc print data=contest;
	title 'Pumpkin contest';
run;
Data NationalParks;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\natpark.dat';
	input ParkName $ 1-22 State $ Year @40 Acreage COMMA9.;
run;
proc print data = NationalParks;
	title 'Selected National Parks';
run;
Data Resultscanoe;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Canoes.dat';
	input @'School:' SchoolName $ @'Time:' Racetime :STIMER8.;
run;
proc print data=Resultscanoe;
run;
data hilotemp;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Temperature.dat';
	input City $ State $ #2 Normalhi Normallo #3 Recordhi Recordlo;
run;
proc print data=hilotemp;
run;
data precipitation1;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Precipitation.dat';
	input City $ State $ NormalRain MeanRain @@;
proc print data=precipitation1;
title 'Precipitation Measures';
run;


data freeway;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Traffic.dat';
	input Type $ @;
	if Type = 'surface' then delete;
	input Name $ 9-32 AMTraffice PMTraffic;
proc print data=freeway;
	title 'Traffic for Freeways';
run;
data icecream;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\IceCreamSales.dat' FIRSTOBS=3 OBS=5;
	input Flavour $ 1-9 Location BoxesSold;
proc print data=icecream;
run;
data class1;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Allscores.dat' MISSOVER;
	input Name $ Test1 Test2 Test3 Test4 Test5;
proc print data=class1;
 Title 'ClassScores';
run;
data address1;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Address.dat' TRUNCOVER;
	input Name $ 1-15 Number Street $22-40;
proc print data=address1;
	title 'Home Address';
run;
data reading;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Books.dat' DLM=',';
	input Name $ Week1 Week2 Week3 Week4 Week5;
run;
proc print data=reading;
	title 'reading';
run;
data music;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Bands.csv' dlm=',' DSD MISSOVER;
	input BandName :$30. Gigdate :MMDDYY10. EightPM NinePM TenPM ElevenPM;
proc print data=music;
	title 'Band & Coffee Sales';
run; 
proc import datafile='C:\Course\MIS 6334 - ABI\SAS workdirectory\Bands2.csv' out=music 
REPLACE DBMS=CSV;
run;
proc print data=music;
	title 'Band & Coffee Sales thru proc import';
run;
proc import datafile='C:\Wallpaper\LungCapData.xls' DBMS=XLS out=LungCap;
proc print data=LungCap;
run;
libname bikes excel 'C:\Wallpaper\LungCapData.xls';
data bikes.PartialLungCap;
proc print data=bikes.PartialLungCap;
	where age>6;
	title 'Partiallungs above age 6';
run;
libname lungcap 'C:\Wallpaper\LungCapData.xls';
data funnies (Label='Comic Character Data');
	input id name $ Height Weight DoB MMDDYY8. @@;
	label id = 'identification no.'
		height = 'Height in inches'
		Weight = 'Weight in pounds'
		DoB ='Date of Birth';
	INFORMAT DoB MMDDYY8.;
	FORMAT DoB WORDDATE18.;
	datalines;
	53 Susie 42 41 07-11-81 54 Charlie 46 55 10-26-54
55 Calvin 40 35 01-10-81 56 Lucy 46 52 01-13-55;
proc contents data = funnies;
run;
proc contents data=bikes.PartialLungCap;
run;
data homegarden;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Garden.dat';
	input Name $ :7. tomato zuchini peas grapes ;
	zone=14;
	Type='home';
	zuchini=zuchini*10;
	total=tomato + zuchini + peas + grapes ;
	pertom=tomato/total;
proc print data=homegarden;
	title 'home garden survey';
run;
data contest;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Pumpkin.dat';
	input Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10. 
    (Scr1 Scr2 Scr3 Scr4 Scr5) (4.1);
	Average=Mean(Scr1, Scr2, Scr3, Scr4, Scr5);
	Dayentered=Day(Date);
	Type=Upcase(Type);
proc print data=Contest;
	title 'Pumpkin Contest';
run;
data oldcars;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Auction.dat';
	input Make :$13. Model $ 15-29 Yearmade Seats MillionsPaid;
	if Yearmade<1890 Then Veteran='Yes';
	if Model='F-88' Then do;
		Make='Oldsmobile';
		Seats=2;
	end;
proc print data=oldcars;
	title 'Auction Cars';
run;
data homegroup;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Home.dat';
	input Owner :$7. Description $ 9-33 Cost 5.2;
	if cost=. then Costgroup='Missing';
		else if cost<2000 then Costgroup='Low';
	    else if Cost<10000 then Costgroup='Med';
		else Costgroup='Hi';
proc print data=homegroup;
	title 'Homegroup Division';
run;
data comedy;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Shakespeare.dat';
	input Name :$26. Year Type $;
	if Type = 'comedy';
	run;
proc print data=comedy;
	title 'Shakespeare Comedy';
run;
data librarycards;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Library.dat' Truncover;
	input Name $11. +1 Birthdate MMDDYY10. +1 IssueDate ANYDTDTE10. DueDate Date11.;
	DaysOverDue=Today()-DueDate;
	CurrentAge=INT(YRDIF(BirthDate, TODAY(), 'AGE'));
	IF DaysOverDue > 0 then NewCard='Yes';
	run;
proc print data=librarycards;
	Format IssueDate MMDDYY8. DueDate WEEKDATE17.;
	title 'Library Details';
run;
data gamestats;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Games.dat';
	input Month 1 Day 3-4 Team $ 6-25 Hits 27-28 Runs 30-31;
	Retain Maxruns;
	Maxruns=Max(Maxruns, Runs);
	Runstodate+Runs;
proc print data=gamestats;
	title "Season's Records";
run;
data songs;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\KBRK.dat';
	input City :$15. Age wj kt tr filp ttr;
	Array new(5) Song1 - Song5;
	Array old(5) wj -- ttr;
	Do i=1 to 5;
	 	if old(i) = 9 then new(i) = .;
			else new(i) = old(i);
	end;
	AvgScore = Mean(Of Song1-Song5);
run;
proc print data=songs;
	title 'Song survey';
run;
data artists;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Artists.dat';
	input Name $ 1-21 Genre $ 23-40 Origin $;
proc print data=artists;
	where Genre='Impressionism';
	Title 'Impressionist Artists';
	Footnote 'F = France N = Netherlands U = US';
run;
Footnote;
data marines;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Lengths.dat';
	input Name $ Family $ Length @@;
proc sort data=marines out=seabiggies NODUPKEY;
	by family Length Descending;
proc print data=seabiggies;
	title 'Whales & Sharks';
run;
title;
data addresses;
	infile 'C:\Course\MIS 6334 - ABI\SAS workdirectory\Mails.dat' MISSOVER;
	input Name $6. Street $18. City $9. State $6.;
run;
proc sort data=addresses out=sortone
	sortseq=linguistic(numeric_collation = on);
	by street;
proc print data=sortone;
	title 'Sort data by street';
run;

proc sort data=addresses out=sorttwo
	sortseq=linguistic(strength=primary);
	by state;
proc print data=sorttwo;
	title 'Sort data by state';
run;
title;

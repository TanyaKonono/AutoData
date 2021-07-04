Use AutoRehab
Go

Select * from MasterTable

With 
	CountOfServices ([Service])  As
	(
		Select Count(WorkDone) as Service
		From MasterTable
		where WorkDone Like '%Service%' and Date > '2020-12-31' --'2021-05-31' --'2021-06-27'
	),
	CountOfBrakes(Brakes) AS
	( 
		Select Count(WorkDone) as Brakes
		From MasterTable
		Where (WorkDone Like '%Pads%' 
		or WorkDone Like '%Discs%' 
		or WorkDone Like '%Drums%' 
		or WorkDone Like '%Linnings%' 
		or WorkDone Like '%Brakes%' ) and Date > '2020-12-31' --'2021-05-31' --'2021-06-27'
	),
	CountOfDiagnostics(Diagnostics) AS
	( 
		Select Count(WorkDone) as Diagnostics
		From MasterTable
		Where WorkDone Like '%Diagnostics%' and Date > '2020-12-31' --'2021-05-31' --'2021-06-27'
	),
	CountOfCoolingSystem(CoolingSystem) AS
	(
		Select Count(WorkDone) as CoolingSystem
		From MasterTable
		Where (WorkDone Like '%Radiator Flash%' 
		or WorkDone Like '%Coolant%' 
		or WorkDone Like '%Water Bottle%' 
		or WorkDone Like '%Radiator%'
		or WorkDone Like '%Thermostat%' 
		or WorkDone Like '%Water Pump%') and Date > '2020-12-31' --'2021-05-31' --'2021-06-27'
	),
	CountOfSuspension(Suspension) As
	(
		Select Count(WorkDone) as Suspension
		From MasterTable
		Where (WorkDone Like '%Shocks%' 
		or WorkDone Like '%Tie Rod Ends%' 
		or WorkDone Like '%Ball Joints%' 
		or WorkDone Like '%Rack Ends%'
		or WorkDone Like '%Control Arms%'
		or WorkDone Like '%Stabilizer Links%'
		or WorkDone Like '%Link Rods%' 
		or WorkDone Like '%Water Pump%') and Date > '2020-12-31' --'2021-05-31' --'2021-06-27'
	),
	CountOfCVJoints(Joints) as
	(
		Select Count(WorkDone) as Joints
		From MasterTable
		Where (WorkDone Like '%Outter Cv%' 
		or WorkDone Like '%Inner CV%' 
		or WorkDone Like '%CV%') and Date > '2020-12-31' --'2021-05-31' --'2021-06-27'
	),
	CountOfAirConditioning(AirConditioning) as
	(
		Select Count(WorkDone) as AirConditioning
		From MasterTable
		Where (WorkDone Like '%Aircon Condensor%'  
		or WorkDone Like '%Regas Aircon%') and Date > '2020-12-31' --'2021-05-31' --'2021-06-27'
	)

Select * from CountOfServices, CountOfBrakes, CountOfDiagnostics, CountOfCoolingSystem, CountOfSuspension, CountOfAirconditioning


Select Convert(Date, Date) as ConvertedDate, Name, Vehicle, WorkDone, Completed, InvoiceAmount, AmountPaid, DatePaid, Costs
from MasterTable
where date > '2021-05-31'
Order by ConvertedDate 

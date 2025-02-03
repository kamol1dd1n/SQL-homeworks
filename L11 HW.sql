--Hometask
--type1
	use tasks
--	create table StrTest(PaymentDetails varchar(max))
--insert into StrTest values ('Full Name = Abdullayev Shoxruh Account = 20201123456789790001 CorrAccount = 105USD777132005'),
  --            ('Full Name = Alimboev Hamid Account = 20001123459872543510 CorrAccount = 110USD000177007')


select trim(SUBSTRING(paymentdetails, CHARINDEX('full name = ', PaymentDetails)+datalength('Full name = '), 
				CHARINDEX('account', PaymentDetails)-DATALENGTH('full name = ')-1 ))  [Full Name],
		trim(substring(paymentdetails, charindex('account', paymentdetails)+datalength('account = '), 
				charindex('corraccount', paymentdetails)-(charindex('account = ', paymentdetails)+DATALENGTH('Account = ')))) [Account],
		SUBSTRING(PaymentDetails, CHARINDEX('corraccount', paymentdetails)+datalength('coraccount = '), 
				DATALENGTH(paymentdetails)-(charindex('coraccount', paymentdetails)+datalength('corraccount = '))) [CorAccount]

 


from StrTest


--type2
select * from StrTest


select trim(SUBSTRING(paymentdetails, CHARINDEX('full name = ', PaymentDetails)+datalength('Full name = '), 
				CHARINDEX('account', PaymentDetails)-DATALENGTH('full name = ')-1 ))  [Full Name],

				left(trim(substring(paymentdetails, charindex('account', paymentdetails)+datalength('account = '), 
				charindex('corraccount', paymentdetails)-(charindex('account = ', paymentdetails)+DATALENGTH('Account = ')))), 8) [Date],

		trim(substring(paymentdetails, charindex('account', paymentdetails)+datalength('account = ')+8, 
				charindex('corraccount', paymentdetails)-(charindex('account = ', paymentdetails)+DATALENGTH('Account = ')+8))) [Account],

				
		SUBSTRING(PaymentDetails, CHARINDEX('corraccount', paymentdetails)+datalength('coraccount = '), 
				charindex('usd', paymentdetails)+4-(charindex('corraccount', paymentdetails)+datalength('corraccount = '))) [Balance],

		SUBSTRING(PaymentDetails, CHARINDEX('corraccount', paymentdetails)+datalength('coraccount = ')+DATALENGTH(
		
		SUBSTRING(PaymentDetails, CHARINDEX('corraccount', paymentdetails)+datalength('coraccount = '), 
				charindex('usd', paymentdetails)+4-(charindex('corraccount', paymentdetails)+datalength('corraccount = ')))
		
		), 
				DATALENGTH(paymentdetails)+1-(charindex('usd', paymentdetails)+datalength('usd'))) [CorAccount]


from StrTest

--type3 extracting name and surname from fullname (chala)

select  substring(paymentdetails, charindex('full name', paymentdetails)+datalength('full name = '), charindex('%ev', paymentdetails)+datalength('%ev')),


			trim(SUBSTRING(paymentdetails, CHARINDEX('full name = ', PaymentDetails)+datalength('Full name = '), 
				CHARINDEX('account', PaymentDetails)-DATALENGTH('full name = ')-1 ))  [Full Name],

				left(trim(substring(paymentdetails, charindex('account', paymentdetails)+datalength('account = '), 
				charindex('corraccount', paymentdetails)-(charindex('account = ', paymentdetails)+DATALENGTH('Account = ')))), 8) [Date],

		trim(substring(paymentdetails, charindex('account', paymentdetails)+datalength('account = ')+8, 
				charindex('corraccount', paymentdetails)-(charindex('account = ', paymentdetails)+DATALENGTH('Account = ')+8))) [Account],

				
		SUBSTRING(PaymentDetails, CHARINDEX('corraccount', paymentdetails)+datalength('coraccount = '), 
				charindex('usd', paymentdetails)+4-(charindex('corraccount', paymentdetails)+datalength('corraccount = '))) [Balance],

		SUBSTRING(PaymentDetails, CHARINDEX('corraccount', paymentdetails)+datalength('coraccount = ')+DATALENGTH(
		
		SUBSTRING(PaymentDetails, CHARINDEX('corraccount', paymentdetails)+datalength('coraccount = '), 
				charindex('usd', paymentdetails)+4-(charindex('corraccount', paymentdetails)+datalength('corraccount = ')))
		
		), 
				DATALENGTH(paymentdetails)+1-(charindex('usd', paymentdetails)+datalength('usd'))) [CorAccount]


from StrTest
--Basic joins
use Music_01
select * from Show
select artist, Tour_name, show_date, venue, Leg, (case when Tickets_sold is null then 0 else Tickets_sold end) tickets_sold from Show s
join Venue v on s.Venue_ID=v.Venue_ID
join city c on c.City_ID=v.City_ID and city like '%Manchester%'
join Tour t on t.Tour_ID=s.Tour_ID
join Artist a on a.Artist_ID=t.Artist_ID
order by Show_date
go
use DoctorWho
go
select AuthorName, title, doctorname, enemyname, len(AuthorName) + len(title) + len(doctorname) + len(enemyname) [total lenght] from tblAuthor a
join tblEpisode e on a.AuthorId=e.AuthorId
join tblDoctor d on d.DoctorId=e.DoctorId
join tblEpisodeEnemy epen on epen.EpisodeId=e.EpisodeId
join tblEnemy en on en.EnemyId=epen.EnemyId
group by AuthorName, Title, DoctorName, EnemyName
having len(AuthorName) + len(title) + len(doctorname) + len(enemyname) < 40
go

select * from 
use Music_01

--more exotic joins
select * from album
select * from Artist
select * from Tour

select title, release_date, artist, tour_name from Album a
right join tour t on t.Album_ID=a.Album_ID
join Artist ar on ar.Artist_ID=a.Artist_ID


select title, release_date, artist, case when Tour_name is null then 'No tour for ' + Title end tour_name from Album a
left join tour t on t.Album_ID=a.Album_ID and Tour_name is null
join Artist ar on ar.Artist_ID=a.Artist_ID


select title, release_date, artist, case when Tour_name is null then 'No tour for ' + Title end tour_name from Album a
left join tour t on t.Album_ID=a.Album_ID and Tour_name is null 
join Artist ar on ar.Artist_ID=a.Artist_ID and Title  like '%road%' 
where title not like '%broad%'


select title, release_date, concat(a.Album_mins, 'm', a.Album_secs, 's') as album_length, artist, case when Tour_name is null then 'No tour for ' + Title end tour_name from Album a
left join tour t on t.Album_ID=a.Album_ID and Tour_name is null 
join Artist ar on ar.Artist_ID=a.Artist_ID and Title  like '%road%' 
where title not like '%broad%'

go

use tasks
CREATE TABLE tblFamily(
	FamilyID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FamilyName nvarchar(255) NULL,
	ParentFamilyId int NULL)

GO

SET IDENTITY_INSERT tblFamily ON 
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (1, N'Politics', 21)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (2, N'Alien life', 22)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (3, N'Exploration', 23)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (4, N'Natural world', 23)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (5, N'Death and disaster', 21)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (6, N'War and conflict', 21)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (7, N'Sports', 22)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (8, N'Economy', 21)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (9, N'Entertainment and culture', 22)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (10, N'Health and medicine', 21)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (11, N'Love and relationships', 22)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (12, N'Science and technology', 23)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (13, N'Old', 24)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (14, N'Transport', 23)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (15, N'Energy', 23)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (16, N'Royalty and monarchy', 22)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (17, N'Crime and legal', 21)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (18, N'Religion', 22)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (19, N'Education', 22)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (20, N'General', 24)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (21, N'Socio/political', 25)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (22, N'Cultural', 25)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (23, N'Scientific/technical', 25)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (24, N'Odd', 25)
GO
INSERT tblFamily (FamilyID, FamilyName, ParentFamilyId) VALUES (25, N'All categories', NULL)
GO
SET IDENTITY_INSERT tblFamily OFF
GO

--interesting but not solved
select * from tblFamily
order by FamilyName
select f1.FamilyName, f2.ParentFamilyId, f2.FamilyName from tblFamily f1
join tblFamily f2 on f1.FamilyID=f2.ParentFamilyId
order by f1.FamilyName

--solved
use Music_01
select artist, isnull(Tour_name, 'No tours found for '+Artist) from Artist a
left join tour t on a.Artist_ID=t.Artist_ID
where tour_name is null
order by Artist, Tour_name

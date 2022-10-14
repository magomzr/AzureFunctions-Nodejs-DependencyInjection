USE [db.Company]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas]
(
    [AreaId] [UNIQUEIDENTIFIER] NOT NULL,
    [Description] [NVARCHAR](200) NOT NULL,
    PRIMARY KEY CLUSTERED 
(
	[AreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentTypes]
(
    [DocumentTypeId] [UNIQUEIDENTIFIER] NOT NULL,
    [Description] [NVARCHAR](200) NOT NULL,
    PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees]
(
    [EmployeeId] [UNIQUEIDENTIFIER] NOT NULL,
    [DocumentTypeId] [UNIQUEIDENTIFIER] NOT NULL,
    [Document] [NVARCHAR](50) NOT NULL,
    [FirstName] [NVARCHAR](200) NOT NULL,
    [LastName] [NVARCHAR](200) NOT NULL,
    [Age] [INT] NOT NULL,
    [SubAreaId] [UNIQUEIDENTIFIER] NOT NULL,
    PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubAreas]
(
    [SubAreaId] [UNIQUEIDENTIFIER] NOT NULL,
    [Description] [NVARCHAR](200) NOT NULL,
    [AreaId] [UNIQUEIDENTIFIER] NOT NULL,
    PRIMARY KEY CLUSTERED 
(
	[SubAreaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users]
(
    [UserId] [UNIQUEIDENTIFIER] NOT NULL,
    [Name] [NVARCHAR](200) NOT NULL,
    [UserName] [NVARCHAR](200) NOT NULL,
    [Password] [NVARCHAR](25) NOT NULL,
    PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT [dbo].[Areas]
    ([AreaId], [Description])
VALUES
    (N'e51c7f03-6fad-4e54-9a72-15b2dbd18a90', N'Administrativos')
INSERT [dbo].[Areas]
    ([AreaId], [Description])
VALUES
    (N'e6d1037f-c88a-4a9f-ab2a-69d352514543', N'Aplicaciones')
GO
INSERT [dbo].[DocumentTypes]
    ([DocumentTypeId], [Description])
VALUES
    (N'40dd6b8b-834e-4658-99c6-c1a8fe8426d3', N'Cédula')
INSERT [dbo].[DocumentTypes]
    ([DocumentTypeId], [Description])
VALUES
    (N'59eee721-5c89-496a-946e-d5796f2213ad', N'Tarjeta de Identidad')
INSERT [dbo].[DocumentTypes]
    ([DocumentTypeId], [Description])
VALUES
    (N'9e543c7d-1bd6-49ca-a661-e7271fe04e1c', N'Registro civil')
GO
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('57f972d1-dc03-4da3-ad64-7225e11b0927', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1588561916, 'Jennifer', 'Magill', 36, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('98891a59-4db6-461c-9260-76b298a4653c', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1455582802, 'Sibeal', 'Bingle', 41, 'a927467d-c307-4421-b95e-289550594dd4');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('296150b2-080d-4d31-89e7-24bda9f69117', '59eee721-5c89-496a-946e-d5796f2213ad', 1412018534, 'Leandra', 'Elgram', 35, 'a927467d-c307-4421-b95e-289550594dd4');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('2175e35a-def8-4f1b-9643-7a20d86c0cf7', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1278056880, 'Marius', 'Tothe', 23, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('53f26bf6-1281-4f9a-bd6a-7cdf421c8097', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1442031487, 'Ogden', 'Scriver', 28, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('2403d89a-a3fd-4be0-87d7-1a9d742656dc', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1747559656, 'Tera', 'McTrustie', 44, '3ead564a-d32d-47cb-b021-42b24c66912e');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('b31dfd77-ae90-40b1-aa09-0c329f9ddbd4', '59eee721-5c89-496a-946e-d5796f2213ad', 1872439503, 'Nerta', 'Heak', 29, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('c990deb3-bebf-4537-963a-acbb55285507', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1423888989, 'Pauletta', 'Hilbourne', 41, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('44ba0791-4924-43e2-8312-b6c0be5a5fae', '59eee721-5c89-496a-946e-d5796f2213ad', 1295468717, 'Bobbe', 'Ridsdole', 45, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('f9a2dfcb-97a8-461b-b331-1d0cbfa21b61', '59eee721-5c89-496a-946e-d5796f2213ad', 1865308731, 'Annalise', 'Heckney', 26, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('a16a3e97-71bb-4573-a9c0-086371f54278', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1585684140, 'Derby', 'Pavyer', 27, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('d324e00a-14e3-4013-8746-ac3b60ba56cb', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1587656566, 'Tracey', 'Kidner', 31, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('aef928e5-b2cb-40a1-8e86-b61ceebc2037', '59eee721-5c89-496a-946e-d5796f2213ad', 1997864863, 'Blithe', 'Billingsley', 33, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('df541be8-f72a-4637-8a83-5452e84628ef', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1592366337, 'Jilly', 'Pattenden', 21, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('c8e7fe80-58a7-49c4-8081-4c3ffc41f853', '59eee721-5c89-496a-946e-d5796f2213ad', 1213588956, 'Cordelia', 'Qualtrough', 25, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('c362a569-ff6a-4fa1-850a-c960620bb5a3', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1296193365, 'Alissa', 'Burniston', 36, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('970618b3-2761-40d6-a1dc-083e9d5dfe8b', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1570412912, 'Ericha', 'Anyon', 24, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('555dc54b-1b35-41a5-ac32-c15178ff5408', '59eee721-5c89-496a-946e-d5796f2213ad', 1423147504, 'Kinnie', 'Alderton', 19, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('10e9ad4b-25ec-44e3-a5ce-53d48a200924', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1199594137, 'Elysee', 'Mielnik', 17, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('39dca88d-94c3-44d0-9dee-7a8eea2deebf', '59eee721-5c89-496a-946e-d5796f2213ad', 1761724414, 'Stacy', 'Spottiswood', 34, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('3bb81eb1-c3b4-4933-bfc5-51b80752915c', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1801193324, 'Wolfgang', 'Yakov', 38, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('a1229903-474a-49a1-bdcf-e11109846531', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1331124660, 'Tony', 'Willmer', 25, 'a927467d-c307-4421-b95e-289550594dd4');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('d78412bd-ff8c-4f6c-be1f-b5b10d791581', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1203430972, 'Cordy', 'Jeandon', 35, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('4fa9387a-53c6-4ba9-8972-ea6f9741440a', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1374852861, 'Chaddie', 'Melling', 26, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('b9f2aea0-63ca-4785-8105-96dc6c2dc915', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1317082759, 'Mateo', 'Richings', 17, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('779974c9-cbe0-4166-a540-54fb5967501d', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1219600362, 'Vera', 'Fairtlough', 19, 'a927467d-c307-4421-b95e-289550594dd4');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('a90e2e25-dacc-4a16-9e69-5ffd2eead8df', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1419358389, 'Alford', 'Girkin', 16, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('3616060f-1fd5-4f25-b44b-53f0355bfd05', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1371623683, 'Norma', 'Tollerfield', 17, 'a927467d-c307-4421-b95e-289550594dd4');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('ef89fda5-c267-450d-b9e9-cd4e50ff9688', '59eee721-5c89-496a-946e-d5796f2213ad', 1841288776, 'Codi', 'Attfield', 39, '3ead564a-d32d-47cb-b021-42b24c66912e');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('39b9c93d-6a7f-43f0-a3aa-8098004dcfc4', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1965591147, 'Bill', 'Streatfield', 17, '35467f4b-6560-48f9-8f02-4bbaeec8faba');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('d8a7c0f0-7c55-45ae-955d-115a06020a01', '59eee721-5c89-496a-946e-d5796f2213ad', 1494687423, 'Pate', 'Benford', 45, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('d6ebb2cc-da06-4160-aa53-d8b257c8b5a7', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1630118195, 'Gabriela', 'Derrington', 26, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('52609bb0-bca4-49a3-9b56-f8270a77a199', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1226044312, 'Perla', 'Rockell', 39, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('96d0aeb1-137f-4d31-a56e-cfad3521fa4f', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1246343013, 'Cecilio', 'Goulden', 21, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('7b959e93-1dbb-4eb5-887c-c59316e3c0c3', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1256197303, 'Morissa', 'Aylett', 18, 'a927467d-c307-4421-b95e-289550594dd4');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('483eb58e-a8b2-48e2-b28b-0a66c07b7a22', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1489849943, 'Stefano', 'Churching', 44, '3ead564a-d32d-47cb-b021-42b24c66912e');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('65c97f10-61df-4ffa-90ef-3c0931aafabd', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1319331280, 'Yank', 'Lindner', 34, '3ead564a-d32d-47cb-b021-42b24c66912e');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('659d945b-a3af-4392-b324-33f9cd454a04', '59eee721-5c89-496a-946e-d5796f2213ad', 1301477651, 'Keith', 'Libero', 33, '3ead564a-d32d-47cb-b021-42b24c66912e');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('fd293897-046f-4aca-805f-ebee9d0a7cc7', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1609886492, 'Haroun', 'Lorraway', 34, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('7fd132ba-1c74-44fe-adbb-7aa814016bc5', '59eee721-5c89-496a-946e-d5796f2213ad', 1344932288, 'Donnie', 'Scoffham', 23, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('14a7842c-71fe-4abb-83e3-90b02df4177e', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1604170550, 'Onfre', 'Hunnisett', 25, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('dcece7be-6b25-4191-8675-ec602676a6fa', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1507786448, 'Jesse', 'Turl', 36, '3ead564a-d32d-47cb-b021-42b24c66912e');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('de2b773a-bb76-4fcd-977c-433a60a0a74d', '59eee721-5c89-496a-946e-d5796f2213ad', 1673767199, 'Alasteir', 'Hilldrup', 21, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('850634e6-cdd4-4909-987e-3bbb1e765919', '59eee721-5c89-496a-946e-d5796f2213ad', 1815253869, 'Erminia', 'Huckleby', 27, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('e9c9d309-ba30-4846-b0dc-8888883366c0', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1755808779, 'Wenda', 'Gaitung', 31, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('c584f8b0-a6a1-4eaf-ab71-02360840f964', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1929363036, 'Teressa', 'Symmons', 34, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('377b0abf-983d-40f9-985c-1f6f4c9a2978', '59eee721-5c89-496a-946e-d5796f2213ad', 1436271617, 'Dimitry', 'Shinefield', 42, '2ae73825-8cca-4d59-a001-55dc5dac7837');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('5aaaede4-7a75-49aa-a301-8c4b532499b8', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1962933073, 'Estel', 'Jaqueme', 41, '3ead564a-d32d-47cb-b021-42b24c66912e');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('ef3991cd-0ee5-4632-863a-e78f0f47aac0', '40dd6b8b-834e-4658-99c6-c1a8fe8426d3', 1849682306, 'Carlita', 'Farrar', 34, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');
INSERT INTO [dbo].[Employees]
    (EmployeeId, DocumentTypeId, Document, FirstName, LastName, Age, SubAreaId)
VALUES
    ('49a566d0-ea88-4715-a4d8-346881121c19', '9e543c7d-1bd6-49ca-a661-e7271fe04e1c', 1956635835, 'Inna', 'Jaime', 42, 'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee');

INSERT [dbo].[SubAreas]
    ([SubAreaId], [Description], [AreaId])
VALUES
    (N'a927467d-c307-4421-b95e-289550594dd4', N'Contabilidad', N'e51c7f03-6fad-4e54-9a72-15b2dbd18a90')
INSERT [dbo].[SubAreas]
    ([SubAreaId], [Description], [AreaId])
VALUES
    (N'3ead564a-d32d-47cb-b021-42b24c66912e', N'Testing', N'e6d1037f-c88a-4a9f-ab2a-69d352514543')
INSERT [dbo].[SubAreas]
    ([SubAreaId], [Description], [AreaId])
VALUES
    (N'35467f4b-6560-48f9-8f02-4bbaeec8faba', N'Recursos humanos', N'e51c7f03-6fad-4e54-9a72-15b2dbd18a90')
INSERT [dbo].[SubAreas]
    ([SubAreaId], [Description], [AreaId])
VALUES
    (N'2ae73825-8cca-4d59-a001-55dc5dac7837', N'Desarrollo', N'e6d1037f-c88a-4a9f-ab2a-69d352514543')
INSERT [dbo].[SubAreas]
    ([SubAreaId], [Description], [AreaId])
VALUES
    (N'ce6a69ff-d05e-470e-9c74-6feb9ce5f9ee', N'Marketing', N'e6d1037f-c88a-4a9f-ab2a-69d352514543')
GO





INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('6bf0fb42-344f-48b1-95a0-f284c8da59b2', 'Lou', 'llind0', 'QZ8lM63');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('839862a3-f3d4-4ab2-ba1f-7c4ca11555bc', 'Stace', 'scartmill1', 'cw75uM1ja');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('dcb4b417-0670-400b-bb35-3f39e592afed', 'Vilma', 'vjorgesen2', '2k8gtL9DBU');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('4d86b785-e7dc-462f-aae3-097a7686129b', 'Estella', 'erainsdon3', 'ZXK6us');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('c9edfe4e-ac9c-44b2-9e2d-b97f7e5017ff', 'Konstantine', 'kmckleod4', 'pyXA9lwa45A');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('680a6c08-e78d-4584-8496-a64a8c458fcd', 'Margaux', 'miowarch5', 'CkVUEd8s2rz');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('8dd27387-bdf1-44ec-b073-02786411d46d', 'Vince', 'vpoulglais6', 'N9ZkQLa');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('9ee293a3-693b-41b0-b24f-09250dbe3ce6', 'Grethel', 'gpiens7', 'RMXhtvw2u');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('6a8bf8d3-134a-48d7-95b0-c7536137c3f7', 'Alden', 'amaidment8', '32Rqax7hDDg');
INSERT INTO [dbo].[Users]
    (UserId, Name, UserName, Password)
VALUES
    ('0c10aed6-e9ab-4164-8ec1-bd22a9d94bbc', 'Elijah', 'elightman9', 'Q3yUpx8RPCyH');


GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Document] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([DocumentTypeId])
REFERENCES [dbo].[DocumentTypes] ([DocumentTypeId])
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD FOREIGN KEY([SubAreaId])
REFERENCES [dbo].[SubAreas] ([SubAreaId])
GO
ALTER TABLE [dbo].[SubAreas]  WITH CHECK ADD FOREIGN KEY([AreaId])
REFERENCES [dbo].[Areas] ([AreaId])
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetEmployeeByDocument]
    @json VARCHAR(MAX) = ''
AS

SET @json = UPPER(@json)
DECLARE @Document VARCHAR(100) = JSON_VALUE(@json, '$.DOCUMENT')

SELECT a.[EmployeeId],
    a.[FirstName],
    a.[LastName],
    b.[Description] AS DocumentType,
    a.[Document],
    a.[DocumentTypeId],
    a.[Age],
    d.[Description] AS Area,
    c.[Description] AS SubArea,
    a.[SubAreaId]
FROM Employees AS a
    INNER JOIN DocumentTypes AS b ON b.DocumentTypeId = a.DocumentTypeId
    INNER JOIN SubAreas AS c ON c.SubAreaId = a.SubAreaId
    INNER JOIN Areas AS d ON d.AreaId = c.AreaId
WHERE Document = @Document
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GetUserAuth]
    @UserName VARCHAR(200),
    @Password VARCHAR(25)
AS
SELECT *
FROM Users
WHERE UserName = @UserName AND [Password] = @Password
 
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_InsertByEmployee]
    @json VARCHAR(MAX) = ''
AS

SET @json = UPPER(@json)

INSERT INTO Employees
VALUES(
        JSON_VALUE(@json, '$.EMPLOYEEID'),
        JSON_VALUE(@json, '$.DOCUMENTTYPEID'),
        JSON_VALUE(@json, '$.DOCUMENT'),
        JSON_VALUE(@json, '$.FIRSTNAME'),
        JSON_VALUE(@json, '$.LASTNAME'),
        JSON_VALUE(@json, '$.AGE'),
        JSON_VALUE(@json, '$.SUBAREAID')
)
GO

SELECT ib.[Id] as "Bid Id"
	, i.Name
      ,[Bid]
      ,[ItemId]
      --,[UserId]
      , a.UserName
  FROM [CHSAuctionDb].[dbo].[ItemBids] as ib
  join AspNetUsers as a
  on ib.UserId like a.Id
    join Items as i
    on ib.ItemId = i.Id
    order by ItemId, Bid desc


GO

WITH cte AS
(
	SELECT ib.[Id] as "Bid Id"
		, i.Name
		  ,[Bid]
		  ,[ItemId]
		  ,[UserId]
		  , a.UserName,
		  ROW_NUMBER() OVER (PARTITION BY [ItemId] ORDER BY [Bid] desc) AS rn
	  FROM [CHSAuctionDb].[dbo].[ItemBids] as ib
	  join AspNetUsers as a
	  on ib.UserId like a.Id
		join Items as i
		on ib.ItemId = i.Id
		--order by ItemId, Bid desc
)  
SELECT Name as "Item Name", Bid, UserName 
FROM cte
WHERE rn = 1  


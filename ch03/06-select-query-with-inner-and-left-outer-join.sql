SELECT c.CustomerNumber, c.Name, c.BillingCity, ih.InvoiceNumber, ih.TotalAmount, ld.Discount
FROM dbo.Customer c
	INNER JOIN dbo.InvoiceHeader ih
		ON c.CustomerNumber = ih.CustomerNumber 
	LEFT OUTER JOIN dbo.LoyaltyDiscount ld
		ON c.CustomerNumber = ld.CustomerNumber ;
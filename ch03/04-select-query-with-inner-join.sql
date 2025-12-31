SELECT c.CustomerNumber, c.Name, c.BillingCity, ih.InvoiceNumber, ih.TotalAmount
FROM dbo.Customer c
	INNER JOIN dbo.InvoiceHeader ih
		ON c.CustomerNumber = ih.CustomerNumber ;
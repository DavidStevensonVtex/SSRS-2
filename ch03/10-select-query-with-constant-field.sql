SELECT c.CustomerNumber, c.Name, c.BillingCity, ih.InvoiceNumber
	, ih.TotalAmount, ld.Discount, 'AXEL' as ProcessingCode
FROM dbo.Customer c
	INNER JOIN dbo.InvoiceHeader ih
		ON c.CustomerNumber = ih.CustomerNumber 
	LEFT OUTER JOIN dbo.LoyaltyDiscount ld
		ON c.CustomerNumber = ld.CustomerNumber 
WHERE c.BillingCity = 'Axelburg' AND c.Name > 'C' 
ORDER BY c.Name DESC, ih.InvoiceNumber ;
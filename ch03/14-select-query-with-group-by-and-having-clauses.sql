SELECT c.CustomerNumber, c.Name, c.BillingCity, COUNT(ih.InvoiceNumber) AS NumberOfInvoices
	, SUM(ih.TotalAmount) AS TotalAmount, ld.Discount
	, SUM(ih.TotalAmount - (ih.TotalAmount * ISNULL(ld.Discount, 0.00))) AS DiscountedTotalAmount
FROM dbo.Customer c
	INNER JOIN dbo.InvoiceHeader ih
		ON c.CustomerNumber = ih.CustomerNumber 
	LEFT OUTER JOIN dbo.LoyaltyDiscount ld
		ON c.CustomerNumber = ld.CustomerNumber 
WHERE c.BillingCity = 'Axelburg' AND c.Name > 'C' 
GROUP BY c.CustomerNumber, c.Name, c.BillingCity, ld.Discount
HAVING COUNT(ih.InvoiceNumber) >= 2
ORDER BY c.Name DESC ;
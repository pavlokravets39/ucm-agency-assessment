# UCM Test Assignment

This is an API only Rails application that covers the following requirements:

### Contract info:
	-	User ID
	-	Contract number
	-	Average weekly hours (e.g. 30,5h)
	-	Hourly wage (e.g. 17,20€)
### Create:
	-	Implement the following validations:
	-	Make sure to validate the validity period fields.
	-	Business rule: Contracts of the same user should not overlay each other. In other words, there should be no overlapping validity periods for contracts of the same user.
	-	Generate the contract number automatically following the format: N. For example, if the contract ID is 123, the contract number should be "N00123".
### Read:
	-	Implement optional functionality to view contract details.
### Update:
	-	Implement functionality to update only the dates when the contract is signed by the user and the company:
	-	Save the date of the company's signature.
	-	Keep track of the date when the user signs the contract too.
	-	These dates will be captured after the contract is created, as both the user and the company may sign the contract at a later time.
### Delete:
	-	Implement optional functionality to delete contracts.
### Archive:
	-	Implement an endpoint or route that receives a CSV file with headers: contract_number and archive_number.
	-	Assign the archive_number from the CSV file to the found contract.
	-	Make sure that archive_number is a distinct number regarding all contracts.
	-	In case of any failure, generate a CSV file with headers (row, contract_number, archive_number, and failure_reason), and send it back in the response as an attachment to be downloaded by the client.
	-	Handle possible failure scenarios, including but not limited to:
	-	Contract not found.
	-	Contract already archived.
	-	Archive number already exists.
	-	Any other errors you see necessary to inform the client.


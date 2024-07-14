-- Create the stored procedure for CRUD
CREATE PROCEDURE [dbo].[Product_CRUD]
	@action varchar(10),

	@Id CHAR (36) = null,
	@name VARCHAR (100) = null,
	@quantity INT = null,
	@price MONEY = null,
	@overview TEXT = null,
	@gender CHAR (1) = null,
	@category_id INT = null,
	@link VARCHAR (225) = null,
	@today date = null

AS
BEGIN
	SET NOCOUNT ON;

	-- SELECT
	IF @action = 'SELECT'
	BEGIN
		SELECT * FROM Clothes
	END

	-- INSERT
	IF @action = 'INSERT'
	BEGIN
		INSERT INTO Clothes (Id, name, quantity, price, overview, gender, category_id, link, dateAdded) VALUES (@Id, @name, @quantity, @price, @overview, @gender, @category_id, @link, @today)
	END

	-- UPDATE
	IF @action = 'UPDATE'
	BEGIN
		UPDATE Clothes SET name=@name, quantity=@quantity, price=@price, overview=@overview, gender=@gender, category_id=@category_id, link=@link WHERE Id=@Id
	END

	-- DELETE
	IF @action = 'DELETE'
	BEGIN
		DELETE Clothes WHERE Id=@Id
	END

END

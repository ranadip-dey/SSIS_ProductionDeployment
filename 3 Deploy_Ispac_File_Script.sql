USE SSISDB
GO

/*This t-sql script will deploy the ispac file */

DECLARE @ProjectBinary VARBINARY(MAX);

SET @ProjectBinary = (SELECT * FROM OPENROWSET(BULK '\\bridgetree.com\Academy - Documents\Customer Database\Production\Releases\20181102\R4 Product File extract.ispac', SINGLE_BLOB) AS BinaryData);

EXEC catalog.deploy_project @folder_name = 'R4 Product File Extract', -- Give the folder name which was created in the previous step
							@project_name = 'R4 Product File Extract', -- Give Project Name
							@Project_Stream = @ProjectBinary
GO
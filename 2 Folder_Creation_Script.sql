/* Create Folder in SSISDB for the project if that folder do not exists */

Declare @folder_id bigint

EXEC [SSISDB].[catalog].[create_folder] @folder_name=N'R4 Product File Extract' -- Give the Folder Name
GO

EXEC [SSISDB].[catalog].[set_folder_description] @folder_name=N'R4 Product File Extract', @folder_description=N'' -- Give Folder description if required
GO
Declare @reference_id bigint

EXEC [SSISDB].[catalog].[create_environment_reference] 
						@environment_name=N'R4 Product',				-- Give Environment Variable Name
						@reference_id=@reference_id OUTPUT, 
						@project_name=N'R4 Product File extract',	-- Give Project Name
						@folder_name=N'R4_Data Delivery Process',		-- Give Folder Name
						@reference_type=R
Select @reference_id -- this referance_id will be required, keep a note of it.
DECLARE 
    @folder_id bigint,
    @value sql_variant,
    @folder_name nvarchar(200)      = 'R4_Data Delivery Process',
    @environment_name nvarchar(200) = 'R4 Product'
 
--> Need folder_id for 'R4_Data Delivery Process' 
    SET @folder_id = (SELECT folder_id FROM [SSISDB].[catalog].[folders] WHERE name = @folder_name)
 
--> Create R4 Product environment in 'R4_Data Delivery Process'-folder if it does not exist
    IF NOT EXISTS (SELECT 1 FROM [SSISDB].[catalog].[environments] WHERE folder_id = @folder_id AND name = @environment_name)
        BEGIN
            EXEC [SSISDB].[catalog].[create_environment] @environment_name = @environment_name, @folder_name = @folder_name
            PRINT 'CREATED: Environment R4 Product in folder R4_Data Delivery Process'
        END
    ELSE
        PRINT 'EXISTS: Environment R4 Product exists'
 
--> Creating variable 'AuditDatabaseName' if it doesn't exist
 SET @value = N'ASO_STG'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'AuditDatabaseName')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'AuditDatabaseName', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable AuditDatabaseName'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable AuditDatabaseName'
 
--> Creating variable 'AuditServerName' if it doesn't exist
 SET @value = N'BT-STAGE-SQL105'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'AuditServerName')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'AuditServerName', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable AuditServerName'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable AuditServerName'
 
--> Creating variable 'ErrorRowLimit' if it doesn't exist
 SET @value = 10000

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'ErrorRowLimit')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'ErrorRowLimit', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'Int32'
                    PRINT 'CREATED: Environment-variable ErrorRowLimit'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable ErrorRowLimit'
 
--> Creating variable 'ErrorThreshold' if it doesn't exist
 SET @value = 0.05

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'ErrorThreshold')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'ErrorThreshold', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'Decimal'
                    PRINT 'CREATED: Environment-variable ErrorThreshold'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable ErrorThreshold'
 
--> Creating variable 'SMTPConnectionString' if it doesn't exist
 SET @value = N'BT-PROD-HMAIL'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SMTPConnectionString')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SMTPConnectionString', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SMTPConnectionString'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SMTPConnectionString'
 
--> Creating variable 'SMTPEmailFooter' if it doesn't exist
 SET @value = N'For an immediate response. please DO NOT respond this message'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SMTPEmailFooter')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SMTPEmailFooter', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SMTPEmailFooter'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SMTPEmailFooter'
 
--> Creating variable 'SMTPEmailSubjectErrorPrefix' if it doesn't exist
 SET @value = N'ASO R4 Product Extract (FAILURE)'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SMTPEmailSubjectErrorPrefix')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SMTPEmailSubjectErrorPrefix', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SMTPEmailSubjectErrorPrefix'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SMTPEmailSubjectErrorPrefix'
 
--> Creating variable 'SMTPEmailSubjectPrefix' if it doesn't exist
 SET @value = N'ASO R4 Product Extract'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SMTPEmailSubjectPrefix')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SMTPEmailSubjectPrefix', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SMTPEmailSubjectPrefix'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SMTPEmailSubjectPrefix'
 
--> Creating variable 'SMTPFromAddress' if it doesn't exist
 SET @value = N'do-not-reply@bridgetree.com'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SMTPFromAddress')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SMTPFromAddress', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SMTPFromAddress'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SMTPFromAddress'
 
--> Creating variable 'SMTPToAddress' if it doesn't exist
 SET @value = N'ASOAlerts@bridgetree.com'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SMTPToAddress')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SMTPToAddress', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SMTPToAddress'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SMTPToAddress'
 
--> Creating variable 'SourceDatabaseName' if it doesn't exist
 SET @value = N'RETAILCUSTOMER'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SourceDatabaseName')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SourceDatabaseName', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SourceDatabaseName'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SourceDatabaseName'
 
--> Creating variable 'SourceFilePath' if it doesn't exist
 SET @value = N' '

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SourceFilePath')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SourceFilePath', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SourceFilePath'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SourceFilePath'
 
--> Creating variable 'SourceFilePathArchive' if it doesn't exist
 SET @value = N' '

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SourceFilePathArchive')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SourceFilePathArchive', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SourceFilePathArchive'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SourceFilePathArchive'
 
--> Creating variable 'SourceServerName' if it doesn't exist
 SET @value = N'BT-STAGE-SQL105'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'SourceServerName')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'SourceServerName', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable SourceServerName'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable SourceServerName'
 
--> Creating variable 'StagingDatabaseName' if it doesn't exist
 SET @value = N'ASO_STG'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'StagingDatabaseName')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'StagingDatabaseName', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable StagingDatabaseName'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable StagingDatabaseName'
 
--> Creating variable 'StagingServerName' if it doesn't exist
 SET @value = N'BT-STAGE-SQL105'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'StagingServerName')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'StagingServerName', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable StagingServerName'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable StagingServerName'
 
--> Creating variable 'StatusFailure' if it doesn't exist
 SET @value = 9

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'StatusFailure')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'StatusFailure', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'Int32'
                    PRINT 'CREATED: Environment-variable StatusFailure'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable StatusFailure'
 
--> Creating variable 'StatusPending' if it doesn't exist
 SET @value = 1

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'StatusPending')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'StatusPending', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'Int32'
                    PRINT 'CREATED: Environment-variable StatusPending'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable StatusPending'
 
--> Creating variable 'StatusProcessing' if it doesn't exist
 SET @value = 2

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'StatusProcessing')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'StatusProcessing', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'Int32'
                    PRINT 'CREATED: Environment-variable StatusProcessing'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable StatusProcessing'
 
--> Creating variable 'StatusSuccess' if it doesn't exist
 SET @value = 3

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'StatusSuccess')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'StatusSuccess', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'Int32'
                    PRINT 'CREATED: Environment-variable StatusSuccess'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable StatusSuccess'
 
--> Creating variable 'TargetDatabaseName' if it doesn't exist
 SET @value = N'RETAILCUSTOMER'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'TargetDatabaseName')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'TargetDatabaseName', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable TargetDatabaseName'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable TargetDatabaseName'
 
--> Creating variable 'TargetServerName' if it doesn't exist
 SET @value = N'BT-STAGE-SQL105'

            IF NOT EXISTS (SELECT 1 
                            FROM [SSISDB].[catalog].[environments] b 
                                INNER JOIN [SSISDB].[catalog].[environment_variables] c
                                    ON b.environment_id = c.environment_id
                            WHERE b.folder_id = @folder_id 
                                AND b.name = @environment_name
                                AND c.name = 'TargetServerName')
                BEGIN
                    EXEC [SSISDB].[catalog].[create_environment_variable] 
                        @variable_name = 'TargetServerName', 
                        @sensitive = 0, 
                        @description = '', 
                        @environment_name = @environment_name, 
                        @folder_name = @folder_name, 
                        @value = @value, 
                        @data_type = 'String'
                    PRINT 'CREATED: Environment-variable TargetServerName'
                END
            ELSE
                PRINT 'EXISTS: Environment-variable TargetServerName'
 

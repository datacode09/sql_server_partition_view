SELECT 
    t.name AS TableName,
    i.name AS IndexName,
    COUNT(p.partition_number) AS NumberOfPartitions
FROM 
    sys.tables t
INNER JOIN 
    sys.indexes i ON t.object_id = i.object_id
INNER JOIN 
    sys.partitions p ON i.object_id = p.object_id AND i.index_id = p.index_id
WHERE 
    t.name = 'YourTableName' -- Replace YourTableName with the name of your table
GROUP BY 
    t.name,
    i.name
HAVING 
    COUNT(p.partition_number) > 1;

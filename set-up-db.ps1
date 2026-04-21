$server = "(localdb)\MSSQLLocalDB"
$database = "AssetTrackerDB"

# Ensure LocalDB is running
sqllocaldb start MSSQLLocalDB

Write-Host "Creating database..."
sqlcmd -S $server -E -d master -i "SQL/create-db.sql"

if ($LASTEXITCODE -ne 0) {
    Write-Host "Failed to create database"
    exit 1
}

$files = @(
    "SQL/sp_crud.sql",
    "SQL/sp_display.sql",
    "SQL/sp_filter_n_search.sql",
    "SQL/sp_business_logic.sql",
    "SQL/sp_stats.sql",
    "SQL/seed-data.sql"
)

foreach ($file in $files) {
    Write-Host "Running $file..."

    sqlcmd -S $server -E -d $database -i $file

    if ($LASTEXITCODE -ne 0) {
        Write-Host "Error running $file"
        exit 1
    }
}

Write-Host "All scripts executed successfully!"
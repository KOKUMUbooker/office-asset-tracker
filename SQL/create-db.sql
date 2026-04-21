/* Create DB */
IF DB_ID('AssetTrackerDB') IS NULL
BEGIN
    CREATE DATABASE AssetTrackerDB;
END
GO
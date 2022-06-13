Create Database NYC_Arrest_Project

/*

 * ER/Studio Data Architect SQL Code Generation

 * Project :      nyc arrest.DM1

 *

 * Date Created : Thursday, April 21, 2022 22:07:33

 * Target DBMS : Microsoft SQL Server 2019

 */



/* 

 * TABLE: Arrests_Historical 

 */



CREATE TABLE Arrests_Historical(

    ARREST_KEY           int             NOT NULL,

    ARREST_DATE          date            NULL,

    PD_CD                int             NULL,

    PD_DESC              varchar(100)    NULL,

    KY_CD                int             NULL,

    OFNS_DESC            varchar(100)    NULL,

    LAW_CODE             varchar(100)    NULL,

    LAW_CAT_CD           varchar(100)    NULL,

    ARREST_BORO          varchar(100)    NULL,

    ARREST_PRECINCT      int             NULL,

    JURISDICTION_CODE    int             NULL,

    AGE_GROUP            varchar(100)    NULL,

    PERP_SEX             varchar(100)    NULL,

    PERP_RACE            varchar(100)    NULL,

    X_COORD_CD           float           NULL,

    Y_COORD_CD           float           NULL,

    Latitude             float           NULL,

    Longitude            float           NULL,

    DI_PID               varchar(100)    NULL,

    DI_Create_DT         date            NULL

)



go





IF OBJECT_ID('Arrests_Historical') IS NOT NULL

    PRINT '<<< CREATED TABLE Arrests_Historical >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Arrests_Historical >>>'

go



/* 

 * TABLE: Dim_Age_Group 

 */



CREATE TABLE Dim_Age_Group(

    AGE_SK          int            NOT NULL ,

    AGE_GROUP       varchar(20)    NULL,

    DI_PID          varchar(30)    NULL,

    DI_Create_DT    date           NULL

)



go





IF OBJECT_ID('Dim_Age_Group') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Age_Group >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Age_Group >>>'

go



/* 

 * TABLE: Dim_Arrest_Borough 

 */



CREATE TABLE Dim_Arrest_Borough(

    BORO_SK          int             NOT NULL,

    ARREST_BORO      varchar(100)    NULL,

    Borough          varchar(100)    NULL,

    DI_PID           varchar(10)     NULL,

    DI_Created_DT    date            NULL

)



go





IF OBJECT_ID('Dim_Arrest_Borough') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_Arrest_Borough >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_Arrest_Borough >>>'

go



/* 

 * TABLE: Dim_KY_Code 

 */



CREATE TABLE Dim_KY_Code(

    KY_SK           int             NOT NULL identity(1,1),

    KY_CD           int             NULL,

    OFNS_DESC       varchar(200)    NULL,

    DI_PID          varchar(10)     NULL,

    DI_Create_DT    date            NULL

)



go





IF OBJECT_ID('Dim_KY_Code') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_KY_Code >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_KY_Code >>>'

go



/* 

 * TABLE: Dim_PD_Code 

 */



CREATE TABLE Dim_PD_Code(

    PD_SK           int            not NULL identity(2,1),

    PD_CD           int             NULL,

    PD_DESC         varchar(100)    NULL,

    DI_PID          varchar(100)    NULL,

    DI_Create_DT    date           NULL

)



go





IF OBJECT_ID('Dim_PD_Code') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_PD_Code >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_PD_Code >>>'

go



/* 

 * TABLE: Dim_PERP_RACE 

 */



CREATE TABLE Dim_PERP_RACE(

    PERP_RACE_SK    int             NOT NULL identity(1,1),

    PERP_RACE       varchar(100)     NULL,

    DI_PID          varchar(100)    NULL,

    DI_Create_DT    date            NULL

)



go





IF OBJECT_ID('Dim_PERP_RACE') IS NOT NULL

    PRINT '<<< CREATED TABLE Dim_PERP_RACE >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Dim_PERP_RACE >>>'

go



/* 

 * TABLE: Fact_Arrests_Historical 

 */



CREATE TABLE Fact_Arrests_Historical(

    ARREST_KEY           int             NULL,

    ARREST_DATE          date            NULL,

    PD_SK                int             NULL,

    KY_SK                int             NULL,

    LAW_CODE             varchar(100)    NULL,

    LAW_CAT_CD           varchar(100)    NULL,

    BORO_SK              int             NULL,

    ARREST_PRECINCT      int             NULL,

    JURISDICTION_CODE    int             NULL,

    AGE_SK               int             NULL,

    PERP_SEX             varchar(100)    NULL,

    PERP_RACE_SK         int             NULL,

    X_COORD_CD           float           NULL,

    Y_COORD_CD           float           NULL,

    Latitude             float           NULL,

    Longitude            float           NULL,

    DI_PID               varchar(100)    NULL,

    DI_Create_DT         date            NULL

)



go





IF OBJECT_ID('Fact_Arrests_Historical') IS NOT NULL

    PRINT '<<< CREATED TABLE Fact_Arrests_Historical >>>'

ELSE

    PRINT '<<< FAILED CREATING TABLE Fact_Arrests_Historical >>>'

go
CREATE TABLE Dim_PD_Code_Duplicates(


    PD_CD           int             NULL,

    PD_DESC         varchar(100)    NULL,

    DI_PID          varchar(100)    NULL,

    DI_Create_DT    date           NULL

)

Create view Fact_Arrest_YTD_vw as
Select ARREST_KEY,ARREST_DATE,PD_SK,KY_SK,LAW_CODE,LAW_CAT_CD,BORO_SK,ARREST_PRECINCT,JURISDICTION_CODE,AGE_SK,PERP_SEX,PERP_RACE_SK,X_COORD_CD,Y_COORD_CD,Latitude,Longitude,DI_PID,DI_Create_DT
from Fact_Arrests_Historical WHERE year(ARREST_DATE) = 2021


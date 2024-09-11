Drop Table If Exists Accounts;

Create Table Accounts (
    ID int generated by default as identity,
    Name varchar(100) not null,
    Balance dec(15,2) not null,
    Primary_Key(ID)
);

Insert Into Accounts(Name,Balance)
values('Bob',10000), ('Alice',10000), ('Sam',50000), ('Chris',80000);

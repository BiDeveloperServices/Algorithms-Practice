create or replace procedure Transfer(
   Sender int,
   Receiver int, 
   Amount dec
)
language plpgsql    
as $$
begin
    -- subtracting the amount from the sender's Account 
    update Accounts 
    set Balance = Balance - amount 
    where ID = sender;

    -- adding the amount to the receiver's account
    update Accounts 
    set Balance = Balance + amount 
    where ID = Receiver;

    commit;
end;$$;

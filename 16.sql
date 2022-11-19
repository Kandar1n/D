start transaction;
update Account 
	set avail_balance = avail_balance - 50
	where account_id = 123 and avail_balance > 50;
rollback;
update Account
	set avail_balance = avail_balance + 50
	where account_id = 789;
rollback;
commit;
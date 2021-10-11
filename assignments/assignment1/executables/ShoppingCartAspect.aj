public aspect ShoppingCartAspect{
	pointcut safeWithdraw(int price): 
		call(* Wallet.safeWithdraw(int)) && args(price);

	before(int price): call(* Wallet.safeWithdraw(int)) && args(price){
	try {
		Wallet wallet = new Wallet();
		if(wallet.getBalance() < price) {
			System.out.println("You don't have enough money!");
		}

		System.out.println("This is before Wallet.safeWithdraw() is invoked.");
		java.util.Date date=new java.util.Date();  
        System.out.println("Policy will be enforced by Dena Schaeffer. The current time is: " + date);    

	} catch(Exception e) {
			System.out.println(e);
		}
	}

	after(int price) returning (int withdrawnAmount): safeWithdraw(price) {  
		try{
			Wallet wallet = new Wallet();

			if(price > withdrawnAmount){
				wallet.safeDeposit(withdrawnAmount);
				System.out.println("" + wallet.getBalance());
		        System.out.println("The amount is deposited back into your account.");  
			} else {
				//System.exit(0);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
	}
}


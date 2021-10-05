public aspect ShoppingCartAspect{
	pointcut safeWithdraw(int price): 
		call(* Wallet.safeWithdraw(int)) && args(price);

	before(int price): call(* Wallet.safeWithdraw(int)) && args(price){
	try {
		balance = Wallet.getBalance();
		if(balance < price) {
			System.out.println("You don't have enough money!");
		}

		System.out.println("This is before Wallet.safeWithdraw() is invoked.");
		java.util.Date date=new java.util.Date();  
        System.out.print("Policy will be enforced by Dena Schaeffer. The current time is: " + date);    

	} catch(Exception e) {
			System.out.println(e);
		}
	}

	after(int price): call(* Wallet.safeWithdraw(int)) && args(price){
		try{
			balanceFinal = Wallet.getBalance();
			System.out.println("The balance is now: " + balanceFinal);
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}


public aspect ShoppingCartAspect{
	pointcut balance(): call(* Wallet.safeWithdraw()));
	before(int balance): call(* Wallet.safeWithdraw(int)) && args(balance){
		System.out.println("This is before Wallet.safeWithdraw() is invoked.");
		java.util.Date date=new java.util.Date();  
        System.out.print("Policy will be enforced by Dena Schaeffer. The current time is: " + date);    
    	}
	after(int balance): call(* Wallet.safeWithdraw(int)) && args(balance){
		System.out.println("The balance is now: " + balance);
	}
}

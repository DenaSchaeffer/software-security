public aspect ShoppingCartAspect{
	pointcut balance(): call(* Wallet.setBalance());
	before(int balance): call(* Wallet.setBalance(int)) && args(balance){
		System.out.println("This is before Wallet.setBalance() is invoked.");
		java.util.Date date=new java.util.Date();  
        System.out.print("Policy will be enforced by Dena Schaeffer. The current time is: " + date);    
    	}
	after(int balance): call(* Wallet.setBalance(int)) && args(balance){
		System.out.println("The balance is now: " + balance);
	}
}


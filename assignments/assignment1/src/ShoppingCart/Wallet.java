import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class Wallet {
   /**
    * The RandomAccessFile of the wallet file
    */  
   private RandomAccessFile file;

   /**
    * Creates a Wallet object
    *
    * A Wallet object interfaces with the wallet RandomAccessFile
    */
    public Wallet () throws Exception {
	this.file = new RandomAccessFile(new File("wallet.txt"), "rw");
    }

   /**
    * Gets the wallet balance. 
    *
    * @return                   The content of the wallet file as an integer
    */
    public int getBalance() throws IOException {
	this.file.seek(0);
	return Integer.parseInt(this.file.readLine());
    }

   /**
    * Sets a new balance in the wallet
    *
    * @param  newBalance          new balance to write in the wallet
    */
    public void setBalance(int newBalance) throws Exception {
	this.file.setLength(0);
	String str = new Integer(newBalance).toString()+'\n'; 
	this.file.writeBytes(str); 
    }

   /**
    * Closes the RandomAccessFile in this.file
    */
    public void close() throws Exception {
	this.file.close();
    }

    ///////////////////////////////////////ASSIGNMENT 1///////////////////////////////////////

    /**
    * Checks if there is enough balance in the wallet, then withdraws the requested value
    */
    public int safeWithdraw(int valueToWithdraw) throws Exception {
        //INSERT CODE TO AVOID DATA RACES (LOCKS)
        //check if there is enough balance in wallet

        //compare withdraw amount to balance
            //true: withdraw
            //false: withdraw balance of wallet
        //return valueToWithdraw
    }

    /**
    * checks if there is enough balance in the wallet, then withdraws the requested value
    */
    public int safeDeposit(int valueToDeposit) throws Exception {
        //INSERT CODE TO AVOID DATA RACES (LOCKS)
        
        //acquire lock
        //add the input value to the current balance
        //release lock

        //return wallet balance

}

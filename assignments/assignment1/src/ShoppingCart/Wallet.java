import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

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
        // use locks to avoid data races
        Lock lock = new ReentrantLock();
        lock.lock(); // begin critical section  

        //check if there is enough balance in wallet
        int balance = this.getBalance();

        if (balance>=valueToWithdraw) {
            balance -= valueToWithdraw;
            this.file.setLength(0);
            String str = new Integer(balance).toString()+'\n'; 
            this.file.writeBytes(str);             
            lock.unlock(); // exit critical section  
            return this.getBalance();
        } else {
            balance = 0;
            this.file.setLength(0);
            String str = new Integer(balance).toString()+'\n'; 
            this.file.writeBytes(str);  
            lock.unlock(); // exit critical section  
            throw new Exception("Invalid withdrawal. Please choose a smaller amount to withdraw.");
        }
    }

    /**
    * adds deposit to wallet
    */
    public int safeDeposit(int valueToDeposit) throws Exception {
        Lock lock = new ReentrantLock();
        lock.lock(); // begin critical section     

        try{
            int balance = this.getBalance();
            balance += valueToDeposit;

            this.file.setLength(0);
            String str = new Integer(balance).toString()+'\n'; 
            this.file.writeBytes(str); 
            lock.unlock(); // exit critical section
            return this.getBalance();
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
        } return this.getBalance();
    }
}


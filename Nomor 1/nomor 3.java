/* package codechef; // don't place package name! */

import java.util.*;
import java.lang.*;
import java.io.*;

/* Name of the class has to be "Main" only if the class is public. */
class Codechef
{
	public static void main (String[] args) throws java.lang.Exception
	{
		int[] arrayInt = {6,8,1,4,7,2};
		 
		int nilaiTerbesar = arrayInt[0];
		for (int num : arrayInt){
		    if(num > nilaiTerbesar){
		        nilaiTerbesar = num;
		    }
		}
		
		System.out.println("Nilai terbesar : " + nilaiTerbesar);
	}
}

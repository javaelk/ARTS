package uw.star.rts.analysis;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.DigestInputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import uw.star.rts.util.Constant;
import uw.star.rts.util.PropertyUtil;

import org.apache.commons.codec.binary.Hex;
import org.apache.commons.codec.digest.DigestUtils;

import com.google.common.hash.*;
import com.google.common.io.ByteStreams;
/**
 * compare different MD5 Digest implementations
 * @author wliu
 *
 */
public class MD5DigestCompare {
	static String EXPERIMENT_ROOT = PropertyUtil.getPropertyByName("config"+File.separator+"ARTSConfiguration.property",Constant.EXPERIMENTROOT);

	public static void main(String[] args){
		Path path1 = Paths.get(EXPERIMENT_ROOT+"/jacoco_core/versions.alt/orig/v0/jacoco_core/build/classes/org/jacoco/core/analysis/Analyzer.class");
		Path path2 = Paths.get(EXPERIMENT_ROOT+"/jacoco_core/versions.alt/orig/v1/jacoco_core/build/classes/org/jacoco/core/analysis/Analyzer.class");
		Path path3 = Paths.get(EXPERIMENT_ROOT+"/jacoco_core/versions.alt/orig/v3/jacoco_core/build/classes/org/jacoco/core/analysis/Analyzer.class");
		
		
		try{
            //guava
			InputStream in1 = Files.newInputStream(path1);
			InputStream in2 = Files.newInputStream(path2);
			InputStream in3 = Files.newInputStream(path3);
				HashFunction hf = Hashing.md5(); //this can be reused
				HashCode hc1 = hf.newHasher().putBytes(ByteStreams.toByteArray(in1)).hash();
				HashCode hc2 = hf.newHasher().putBytes(ByteStreams.toByteArray(in2)).hash();
				HashCode hc3 = hf.newHasher().putBytes(ByteStreams.toByteArray(in3)).hash();
			    System.out.println("Google Guava in1 and in2 " + hc1.equals(hc2));
			    System.out.println("Google Guava in1 and in3 " + hc1.equals(hc3));
            in1.close();
            in2.close();
            in3.close();
			    
				//apache commons
				InputStream ain1 = Files.newInputStream(path1);
				InputStream ain2 = Files.newInputStream(path2);
			System.out.println("apache commons - MD5 : " + DigestUtils.md5Hex(ain1).equals(DigestUtils.md5Hex(ain2)));
			ain1.close();
			ain2.close();
			
			InputStream ain3 = Files.newInputStream(path1);
			InputStream ain4 = Files.newInputStream(path2);
			System.out.println("apache commons - SHA1 : " + DigestUtils.sha1Hex(ain3).equals(DigestUtils.sha1(ain4)));
			ain3.close();
			ain4.close();
						
			//java
			InputStream jin3 = Files.newInputStream(path1);
			InputStream jin4 = Files.newInputStream(path2);
			
				MessageDigest md1 = MessageDigest.getInstance("MD5");
				String s1 = Hex.encodeHexString(md1.digest(ByteStreams.toByteArray(jin3)));
				MessageDigest md2 = MessageDigest.getInstance("MD5");
				String s2 = Hex.encodeHexString(md2.digest(ByteStreams.toByteArray(jin4)));
				System.out.println("Java message diget impl. " + s1.equals(s2));
				jin3.close();
				jin4.close();
				
		    //java alternative impl
				InputStream jin1 = Files.newInputStream(path1);
				InputStream jin2 = Files.newInputStream(path2);
				
				MessageDigest md3 = MessageDigest.getInstance("MD5");
				DigestInputStream dis1 = new DigestInputStream(jin1,md3);
				while (dis1.read()!=-1);
				MessageDigest md4 = MessageDigest.getInstance("MD5");
				DigestInputStream dis2 = new DigestInputStream(jin2,md4);
				while (dis2.read()!=-1);
				System.out.println("Java message diget impl2. " +  Hex.encodeHexString(md3.digest()).equals(Hex.encodeHexString(md4.digest())));
				jin1.close();
				jin2.close();
				

			    
				
				
				
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
	}


}

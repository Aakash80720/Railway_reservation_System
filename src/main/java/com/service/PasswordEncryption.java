package com.service;

public class PasswordEncryption {
    String k = "AAKASH";
    char[] key = k.toCharArray();
    int i,j;
    public String encryption(String plainText) {
        char[] msg = plainText.toCharArray();
        int msgLen = msg.length;
        char[] newKey = new char[msgLen];
        char[] encryptedMsg = new char[msgLen];
        for(i = 0,j = 0;i<msgLen;++i,++j){
            if (j == msgLen) j =0;
            newKey[i] = key[j];
        }
        for (i= 0;i<msgLen;++i){
            encryptedMsg[i] = (char) (((msg[i]+newKey[i])%26)+'A');
        }
        return String.valueOf(encryptedMsg);
    }
    public String decryption(String encryptedText){
        char[] msg = encryptedText.toCharArray();
        int msgLen = msg.length;
        char[] newKey = new char[msgLen];
        char[] decryptedMsg = new char[msgLen];
        for(i = 0,j = 0;i<msgLen;++i,++j){
            if (j == msgLen) j =0;
            newKey[i] = key[j];
        }
        for (i= 0;i<msgLen;++i){
            decryptedMsg[i] = (char) (((msg[i]+newKey[i])%26)+'A');
        }
        return String.valueOf(decryptedMsg);
    }
}

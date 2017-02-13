
Usage example :

# cp pgpack.sh /usr/local/bin/pgpack
# chmod 4755 /usr/local/bin/pgpack
# cd target_directory
# pgpack -c x_file1 x_file2 ...
or
# pgpack -c "*"


root@what:/home/who/tmp-# ll
total 5160
-rw-r--r--. 1 who who   49152 Nov  1 13:05 12183338011.sqlite
-rw-r--r--. 1 who who  196608 Nov 24 11:12 Cookies
-rw-------. 1 who who   18432 Nov 16 12:18 'Login data'
-rw-r--r--. 1 who who 3621581 Nov 18 11:42 background.png
-rw-r--r--. 1 who who  524288 Nov 24 11:23 cookies.sqlite
-rw-r--r--. 1 who who  196608 Nov  2 12:35 formhistory.sqlite
-rw-r--r--. 1 who who  547269 Nov 18 11:42 nuit_monde.jpg
-rw-r--r--. 1 who who   98304 Nov  2 12:50 permissions.sqlite
root@what:/home/who/tmp-# pgpack -c "*sql*"
Creation of an encrypted archive
Name of this archive : arc
Enter passphrase
Repeat passphrase
/home/who/tmp/arc.gpg
arc.gpg: GPG symmetrically encrypted data (AES256 cipher)
root@what:/home/who/tmp-# ll
total 4324
-rw-r--r--. 1 who who  196608 Nov 24 11:12 Cookies
-rw-------. 1 who who   18432 Nov 16 12:18 'Login data'
-rw-r--r--. 1 root root    8464 Feb 13 19:03 arc.gpg
-rw-r--r--. 1 who who 3621581 Nov 18 11:42 background.png
-rw-r--r--. 1 who who  547269 Nov 18 11:42 nuit_monde.jpg
root@what:/home/who/tmp-# pgpack -d        
Archive to decrypt : arc.gpg
gpg: AES256 encrypted data
Enter passphrase
gpg: encrypted with 1 passphrase
arc.gpg decrypted
root@what:/home/who/tmp-# ll
total 5160
-rw-r--r--. 1 who who   49152 Nov  1 13:05 12183338011.sqlite
-rw-r--r--. 1 who who  196608 Nov 24 11:12 Cookies
-rw-------. 1 who who   18432 Nov 16 12:18 'Login data'
-rw-r--r--. 1 who who 3621581 Nov 18 11:42 background.png
-rw-r--r--. 1 who who  524288 Nov 24 11:23 cookies.sqlite
-rw-r--r--. 1 who who  196608 Nov  2 12:35 formhistory.sqlite
-rw-r--r--. 1 who who  547269 Nov 18 11:42 nuit_monde.jpg
-rw-r--r--. 1 who who   98304 Nov  2 12:50 permissions.sqlite
root@what:/home/who/tmp-# 



----------------------------- IMPORTANT ----------------------------------

*** PLEASE ENSURE THE NAME OF THE ARCHIVE DOES NOT ALREADY EXIST
    IN THE CURRENT DIRECTORY ***

--------------------------------------------------------------------------

shred -zun2 may take a while for large files

You can sed 's/shred -zun2/cat \/dev\/null >/' -i pgpack.sh 


If you find your "own private safe" useful and if you can afford it,
you can make a donation, here :

BTC
1ASRoowye748LAjcD63s723tWZdGisG1ue

or/and :)

XMR
42XzhFyTXBC4UPLWgbrmgwTiXKCHYuaDS56gdmhHgFm3Fwjh6PE9cPtUwXTtYtpzMWFDtqStYdZ9HNQcxoCgwYLX4oDJEkW


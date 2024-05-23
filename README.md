# Web solution with wordpress

![images](https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/0d96ae0e-ec6b-4160-96dd-8db89f6c59ed)

WordPress is a content management system (CMS) that allows you to host and build websites. 
WordPress contains plugin architecture and a template system, so you can customize any website to fit your business, blog, 
portfolio, or online store. The focus of this tutorial is not on how to build websites with wordpress.

In this tutorial we would prepare storage infrastructure on two Linux servers and implement a basic web solution using WordPress. 
WordPress is a free and open-source content management system written in PHP and paired with MySQL or MariaDB as its backend 
Relational Database Management System (RDBMS).

This project consists of two parts:

- Configure storage subsystem for Web and Database servers based on Linux OS. 
The focus of this part is to give you practical experience of working with disks, partitions and volumes in Linux.

- Install WordPress and connect it to a remote MySQL database server. 
This part of the project will solidify your skills of deploying Web and DB tiers of Web solution.

As a DevOps engineer, a deep understanding of core components of web solutions and the ability to troubleshoot 
them will play essential role in your further progress and development.

## Three-tier Architecture
Generally, web, or mobile solutions are implemented based on what is called the Three-tier Architecture.

Three-tier Architecture is a client-server software architecture pattern that comprise of 3 separate layers. They are:

- Presentation Layer (PL): This is the user interface such as the client server or browser on your laptop.
- Business Layer (BL): This is the backend program that implements business logic. Application or Webserver
- Data Access or Management Layer (DAL): This is the layer for computer data storage and data access.
- Database Server or File System Server such as FTP server, or NFS Server.

With this project, you will have the hands-on experience that showcases Three-tier Architecture while also ensuring that the disks used to store files on the Linux servers are adequately partitioned and managed through programs such as gdisk and LVM respectively.

## Prerequisites

Your 3-Tier Setup:
- A Laptop or PC to serve as a client
- An EC2 Linux Server as a web server (This is where you will install WordPress)
- An EC2 Linux server as a database (DB) server
Note: We are using RedHat OS for this project, you should be able to spin up an EC2 instance on your own.
Also when connecting to RedHat you will need to use ec2-user user. Connection string will look like ec2-user@public-ip-address.

### How to create ec2 linux server
1. Create an Amazon EC2 Instance

To use AWS, you need to sign up or log in to your account.
Tip: You can try out AWS services for free up to certain limits with the AWS Free Tier. 
The Free Tier has three types of offers: a 12-month Free Tier, an Always Free offer, and short term trials

2. Choose An AWS Region

Before you create your Amazon EC2 instance, you need to pick a region from the top-right menu. 
Different regions have different Amazon EC2 dashboards.
AWS has many regions around the world, such as N. Virginia, Cape Town, Hongkong, Mumbai, Seoul, Tokyo, etc. 
You should pick a region that is near you or your customers. 
This way, your users will have less delay when they access your web applications.

<img width="329" alt="Screenshot 2024-05-22 at 14 50 32" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/b0461545-7fed-44cb-8557-e7df388d67f8">

3. Launch Instance

Search for “EC2” in the search bar at the top of your screen. Go to your Amazon EC2 dashboard and click the “Instance” menu on the left sidebar.
Then click the “Launch Instance” button to start setting up your server.

<img width="357" alt="Screenshot 2024-05-22 at 14 53 07" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/7d4e260a-bc9b-4678-9d8f-f2bdc8b0a966">

4. Provide a name for your server. This name will be displayed in AWS dashboard. Here we would name our server, web-server.

<img width="821" alt="Screenshot 2024-05-22 at 14 54 34" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/3a36efd7-ec2a-4969-9705-a203417ab255">

5. Choose AMI (Amazon machine image)

This step we would choose (AMI) for our instance. We are using RedHat OS for this project, the freetier 

<img width="797" alt="Screenshot 2024-05-22 at 14 57 20" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/15992f2f-3bce-4261-85a8-d8526b459d90">

6. Choose Amazon EC2 Instance Type

Under the “Instance Type” option, select one of the predefined instance types for your instance. 
Each type has a certain number of vCPUs (virtual Central Processing Unit) and memory.
For example, you can choose the t2.microinstance with 1 vCPU and 1GB Memory that is free for AWS Free Tier users. 

<img width="812" alt="Screenshot 2024-05-22 at 14 58 42" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/f460f38e-2ccb-4c86-b331-79a669134e97">

7. Create and Download a SSH Key

Next, you will need to specify the SSH key that you want to use to log into this server. 
If you already have an existing key-pair, you can either use that, 
or use the built-in utility to create a new key pair and save it to your local computer. 

<img width="796" alt="Screenshot 2024-05-22 at 15 00 30" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/943d2a58-f229-483a-9781-07267b6d28ee">

8. Configure Security Group (Open Required Ports)

Next, you need to open the required ports on your EC2 instance. 
This step is very important to make your Amazon EC2 instance reachable on the internet.
But for now we leave it at the default 

<img width="794" alt="Screenshot 2024-05-22 at 15 01 59" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/59d5a1aa-2c15-44f7-86c4-54cfa28d9108">

9. Add Storage

Within the Storage option you can configure the storage of your server. 
There are 3 volume types: General Purpose SSD, Provisioned IOPS SSD, and Magnetic storage. 
Pick the storage type and size that you want, but keep in mind that you will be billed for storage separately.
Moreover, you will continue to get billed even if you don’t use the storage. 
For example, if you allocate 200 GB of storage and your server only uses 5 GB then you will be billed for the whole 200 GB every month.

<img width="803" alt="Screenshot 2024-05-22 at 15 03 29" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/7fc06afe-6f09-4e14-bc29-6615ba527c05">

After adding the storage, you can click on the “Launch Instance” button on the right.
This will create a new server with the required settings.

<img width="385" alt="Screenshot 2024-05-22 at 15 04 48" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/32c53724-cc79-47ef-bca1-db2ce9390dee">

Our server is now up and running.

<img width="825" alt="Screenshot 2024-05-22 at 15 06 13" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/1a50f4a9-45ac-46bc-ae90-851d413d5c92">

### Creating and mounting Volumes
1. Create 3 volumes in the same Availability Zone as your Web Server EC2, each of 10 GiB.

<img width="782" alt="Screenshot 2024-05-22 at 15 12 54" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/40c27904-b068-4ef8-b571-caac2ba9aadc">

2. Attach all three volumes one by one to your Web Server EC2 instance

<img width="376" alt="Screenshot 2024-05-22 at 15 16 28" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/60c03c9f-2cf0-4e34-9a93-519c9ee08863">

<img width="850" alt="Screenshot 2024-05-22 at 15 17 05" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/e105cae6-e893-4cf8-8ffe-ad32a396431b">

3. Open up the Linux terminal and check if the volume is attached

```
ssh -i ~/Downloads/demo-pair.pem ec2-user@52.23.161.60
```
<img width="724" alt="Screenshot 2024-05-22 at 15 21 19" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/6b0ef507-57e0-4728-becb-5b0468bfce1b">

4. Confirm if the volume we created is attached using this command:

```
lsblk
```
Result:

<img width="408" alt="Screenshot 2024-05-22 at 15 22 49" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/9564f6d6-6365-4317-aa06-2ef1ffc80a96">

5. Use df -h command to see all mounts and free space on your server

```
sudo df -h
```
Result:

<img width="490" alt="Screenshot 2024-05-22 at 15 25 14" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/1d78df54-6af3-4e6b-9e49-bc2c9abf1bb5">

6. Use gdisk utility to create a single partition on each of the 3 disks

```
sudo gdisk /dev/xvdf
```

A prompt pops up, type n to create new partition, enter no of partition(1), 
First sector type the default number,
Last sector also type the default number
hex code is 8300, p to view partition and w to save newly created partition.

Result:

<img width="669" alt="Screenshot 2024-05-22 at 16 07 50" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/1098e245-3eb8-40b8-ab73-eac0ee529e30">

7. Also repeat the same for the other two disks

```
sudo gdisk /dev/xvdg
sudo gdisk /dev/xvdh
```

8. Use lsblk utility to view the newly configured partition on each of the 3 disks.

```
sudo lsblk
```

Result:

<img width="558" alt="Screenshot 2024-05-22 at 16 09 30" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/7e0f6d23-2f35-43cc-8bd7-23d77feac735">


9. Install lvm2 package using sudo yum install lvm2.

```
sudo yum install lvm2
```

Result:

<img width="1680" alt="Screenshot 2024-05-22 at 15 36 41" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/785a3fb6-cd3a-4721-a0f3-e0b590d04110">


11. Run sudo lvmdiskscan command to check for available partitions.

```
sudo lvmdiskscan
```

Result:

<img width="577" alt="Screenshot 2024-05-23 at 11 34 43" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/6eda7edf-af28-44df-b553-45c3dc6e87fb">

Note: Unlike ubuntu that uses apt, for redhat the package manager is yum.

12. Use pvcreate utility to mark each of 3 disks as physical volumes (PVs) to be used by LVM

```
sudo pvcreate /dev/xvdf1
sudo pvcreate /dev/xvdg1
sudo pvcreate /dev/xvdh1
```

Result:

<img width="522" alt="Screenshot 2024-05-22 at 16 12 01" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/8b7d29b3-c02f-42d9-b3ef-fc7d8137d701">

13. Verify that your Physical volume has been created successfully by running sudo pvs

```
sudo pvs
```

Result:
<img width="410" alt="Screenshot 2024-05-22 at 16 13 09" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/68e63bda-776a-4eb1-9037-81597bc6e20e">

14. Use vgcreate utility to add all 3 PVs to a volume group (VG). Name the VG webdata-vg

```
sudo vgcreate webdata-vg /dev/xvdf1 /dev/xvdg1 /dev/xvdh1
```

Result:

<img width="737" alt="Screenshot 2024-05-22 at 16 14 59" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/8c784e97-9651-4d34-a464-090478f8f8c8">

Verify that your VG has been created successfully

```
sudo vgs
```

Result:

<img width="476" alt="Screenshot 2024-05-22 at 16 16 37" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/7f8571be-50ba-4224-a881-60a4aad7b0e2">

15. Use lvcreate utility to create 2 logical volumes. apps-lv (Use half of the PV size), and logs-lv Use the remaining space of the PV size.
NOTE: apps-lv will be used to store data for the Website while, logs-lv will be used to store data for logs.

```
sudo lvcreate -n apps-lv -L 14G webdata-vg
sudo lvcreate -n logs-lv -L 14G webdata-vg
```

Result:

<img width="724" alt="Screenshot 2024-05-22 at 16 18 40" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/fedd1d09-d205-499f-939e-3e3ad988fcd2">

16. Verify that your Logical Volume has been created successfully by running sudo lvs

```
sudo lvs
```

Result:

<img width="690" alt="Screenshot 2024-05-22 at 16 19 38" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/40d7aae5-d16e-4efa-b187-3e027deaf335">

17. Verify the entire setup

```
sudo vgdisplay -v #view complete setup - VG, PV, and LV
```

Result:

<img width="1005" alt="Screenshot 2024-05-22 at 16 21 03" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/ebb0619e-8151-4e24-aa4b-94c8f3f2baa0">

```
sudo lsblk
```

Result:

<img width="608" alt="Screenshot 2024-05-22 at 16 22 10" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/e666c592-5424-43ad-ab59-f6684699d9aa">

18. Use mkfs.ext4 to format the logical volumes with ext4 filesystem

```
sudo mkfs.ext4 /dev/webdata-vg/apps-lv
sudo mkfs.ext4 /dev/webdata-vg/logs-lv
```

Result:

<img width="783" alt="Screenshot 2024-05-22 at 16 23 57" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/f3ab99d2-f183-4f0b-ba50-f7974d67a4dd">

### Creating a directory structure.

1. Create /var/www/html directory to store website files

```
sudo mkdir -p /var/www/html
```

Result:

<img width="512" alt="Screenshot 2024-05-22 at 16 25 43" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/6f67761a-c759-4b05-98de-32057e4d4f19">

2. Create /home/recovery/logs to store backup of log data

```
sudo mkdir -p /home/recovery/logs
```

3. Mount /var/www/html on apps-lv logical volume

```
sudo mount /dev/webdata-vg/apps-lv /var/www/html/
```

4. Use rsync utility to backup all the files in the log directory /var/log into /home/recovery/logs
(This is required before mounting the file system)

```
sudo rsync -av /var/log/. /home/recovery/logs/
```

Result:

<img width="830" alt="Screenshot 2024-05-22 at 16 31 07" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/c9ede394-3dcd-4740-9f18-5574f530a2c3">

5. Mount /var/log on logs-lv logical volume. (Note that all the existing data on /var/log will be deleted.
That is why step of creating /var/www/html directory to store website files)

```
sudo mount /dev/webdata-vg/logs-lv /var/log
```

6. Restore log files back into /var/log directory

```
sudo rsync -av /home/recovery/logs/. /var/log
```

Result: 

<img width="728" alt="Screenshot 2024-05-22 at 16 33 18" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/2a653df5-5cf0-4be6-bfa9-9e433235cc72">

### Updating the /etc/fstab file

1. Update /etc/fstab file so that the mount configuration will persist after restart of the server.
The UUID of the device will be used to update the /etc/fstab file;

```
sudo blkid
```

Result:

<img width="1138" alt="Screenshot 2024-05-22 at 16 35 22" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/2cc2e23c-d5a3-4994-b8a9-1c3732d20575">

2. Update /etc/fstab in this format using your own UUID and rememeber to remove the leading and ending quotes.

```
sudo vi /etc/fstab
```

and add this

```
UUID=<uuid of your webdata-vg-apps> /var/www/html ext4 defaults 0 0
UUID=<uuid of your webdata-vg-logs> /var/log ext4 defaults 0 0
```

Result:

<img width="1032" alt="Screenshot 2024-05-22 at 16 47 57" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/6ee44322-fe84-445c-8707-914c0d1db884">

3. Test the configuration and reload the daemon

```
sudo mount -a
sudo systemctl daemon-reload
```

Results:

<img width="599" alt="Screenshot 2024-05-22 at 16 51 21" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/ef3d4612-73dc-427c-90b6-fc28702fc4ce">

4. Verify your setup by running df -h, output must look like this:

```
sudo df -h
```

Result:

<img width="659" alt="Screenshot 2024-05-22 at 16 52 13" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/bea7949e-b123-4738-bdcd-c45accee4047">

### Preparing the Database Server

Launch a second RedHat EC2 instance that will have a role – ‘DB Server’

Result:

<img width="1398" alt="Screenshot 2024-05-22 at 17 09 30" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/57b92f25-af65-426e-9c2c-25fb1fffd9f0">


Repeat the same steps as for the Web Server, but instead of apps-lv create db-lv and mount it to /db directory instead of /var/www/html/.

1. ssh into the instance you just created

```
ssh -i ~/Downloads/demo-pair.pem ec2-user@34.229.1.61
```

2. Create and attach 3 Logical Volumes to the database server instance.

<img width="882" alt="Screenshot 2024-05-22 at 17 15 56" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/3df0b7d9-c2e5-4733-b0ad-09d4e2707ae8">

3. Connect to your linux server and check if the volume is attached using this command:

```
sudo lsblk
```

Result:

<img width="418" alt="Screenshot 2024-05-22 at 17 18 31" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/4e61954f-55c4-4487-9b99-a515fe9b7019">

4. Using gdisk utility create a single partition on each of the 3 disks

```
sudo gdisk /dev/xvdf
```

A prompt pops up, type n to create new partition, enter no of partition(1), 
First sector type the default number,
Last sector also type the default number
hex code is 8300, p to view partition and w to save newly created partition.

Also repeat the same for the other two disks

```
sudo gdisk /dev/xvdg
sudo gdisk /dev/xvdh
```

Results:

<img width="628" alt="Screenshot 2024-05-22 at 17 22 05" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/d6a3eb90-df7b-4c00-b7dc-6db750947f1c">

5. Use lsblk utility to view the newly configured partition on each of the 3 disks.

```
sudo lsblk
```

Result:

<img width="476" alt="Screenshot 2024-05-22 at 17 25 08" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/72769e85-9238-4fdb-9d03-3eb8ede675d1">

6. Install lvm2 package using sudo yum install lvm2. Run sudo lvmdiskscan command to check for available partitions.

```
sudo yum install lvm2
sudo lvmdiskscan
```

Result:

<img width="837" alt="Screenshot 2024-05-22 at 17 26 45" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/9894e3ab-3ba3-4749-8c97-564b7882f05b">

<img width="537" alt="Screenshot 2024-05-22 at 17 27 27" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/0b252701-49fd-410b-8b1c-c38a47d9cf7d">

Note: Unlike ubuntu that uses apt, for redhat the package manager is yum.

7. Use pvcreate utility to mark each of 3 disks as physical volumes (PVs) to be used by LVM

```
sudo pvcreate /dev/xvdf1 /dev/xvdg1 /dev/xvdh1
```

Result:

<img width="633" alt="Screenshot 2024-05-22 at 17 29 00" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/1441fd73-e817-472b-9cb1-e184c8ac0d8e">

8. Verify that your Physical volume has been created successfully by running sudo pvs

```
sudo pvs
```

Result:

<img width="560" alt="Screenshot 2024-05-22 at 17 29 58" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/20da7506-c970-4639-83a5-bf738e50ace8">


9. Use vgcreate utility to add all 3 PVs to a volume group (VG). Name the VG webdata-vg

```
sudo vgcreate dbdata-vg /dev/xvdf1 /dev/xvdg1 /dev/xvdh1
```

Result:

<img width="673" alt="Screenshot 2024-05-22 at 17 31 10" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/33e4df95-2de5-424a-a0ae-4856deb29f4b">

10. Use lvcreate utility to create 2 logical volumes. apps-lv (Use half of the PV size),
and logs-lv Use the remaining space of the PV size. NOTE: apps-lv will be used to
store data for the Website while, logs-lv will be used to store data for logs.

```
sudo lvcreate -n db-lv -L 14G dbdata-vg
sudo lvcreate -n logs-lv -L 14G dbdata-vg
```

11. Verify that your Logical Volume has been created successfully by running sudo lvs

```
sudo lvs
```

Result:

<img width="697" alt="Screenshot 2024-05-23 at 11 54 19" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/cb8a9ecd-2a40-4f43-86fc-f4144ea4a182">


12. We need to verify all we have done so far on the database server instance so far with these commands.

```
sudo vgdisplay -v #view complete setup - VG, PV, and LV
sudo lsblk
```

Results:

![Screenshot 2024-05-22 at 17 36 27](https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/9e962159-3b84-4dba-a557-193c1ffbca11)

<img width="547" alt="Screenshot 2024-05-23 at 11 55 03" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/8ad79e86-f4dc-4276-9ad6-2f403809e038">


13. Use mkfs.ext4 to format the logical volumes with ext4 filesystem

```
sudo mkfs.ext4 /dev/dbdata-vg/db-lv && sudo mkfs.ext4 /dev/dbdata-vg/logs-lv
```

Result:

<img width="839" alt="Screenshot 2024-05-23 at 11 56 47" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/023b8ff3-c75c-49f4-9ee7-02457fd92aa2">

Now that we are done configuring the database logical volumes, we would be moving on with creating the mount points for the logical volumes and the required directories.

14. Create /db directory to store website files

```
sudo mkdir -p /db
```

15. Create /home/recovery/logs to store backup of log data

```
sudo mkdir -p /home/recovery/logs
```

16. Mount /db on apps-lv logical volume

```
sudo mount /dev/dbdata-vg/db-lv /db
```

17. Like we did for the webserver instance use rsync utility to backup all the files in the log directory /var/log into /home/recovery/logs (This is required before mounting the file system)

```
sudo rsync -av /var/log/. /home/recovery/logs/
```

Result:

<img width="732" alt="Screenshot 2024-05-23 at 12 02 17" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/765c6d4b-28e3-452b-94f8-24a5bbb8fa26">

18. Mount /var/log on logs-lv logical volume. (Note that all the existing data on /var/log will be deleted. That is why step of creating /db directory to store database files)

```
sudo mount /dev/dbdata-vg/logs-lv /var/log
```

19. Restore log files back into /var/log directory

```
sudo rsync -av /home/recovery/logs/. /var/log
```

Result:

<img width="725" alt="Screenshot 2024-05-23 at 12 05 15" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/60da1007-73ad-4f6e-b2be-8e9813f7875a">

Now we need to update the /etc/fstab file to ensure that the configurations we made is persistent across reboots.

20. Update /etc/fstab file so that the mount configuration will persist after restart of the server.
The UUID of the device will be used to update the /etc/fstab file;

```
sudo blkid
```

Result:

<img width="847" alt="Screenshot 2024-05-23 at 12 07 17" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/d4789e61-4ecf-421b-bb18-71c18b9a281a">

21. Update /etc/fstab in this format using your own UUID and rememeber to remove the leading and ending quotes.

```
sudo vi /etc/fstab
```

and add this

```
UUID=<uuid of your dbdata-vg-apps> /var/www/html ext4 defaults 0 0
UUID=<uuid of your dbdata-vg-logs> /var/log ext4 defaults 0 0
```

Result:

<img width="863" alt="Screenshot 2024-05-23 at 12 11 34" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/efdc4cc9-c569-44f0-82a1-138a9ea4ef19">

22. Test the configuration and reload the daemon

```
sudo mount -a
sudo systemctl daemon-reload
```

Result:

<img width="585" alt="Screenshot 2024-05-23 at 12 13 37" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/bf53afbb-126e-4b42-9e72-1afaf5fa9e1e">

23. Verify your setup by running df -h, output must look like this:

```
sudo df -h
```

Result:

<img width="616" alt="Screenshot 2024-05-23 at 12 14 38" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/9789d49e-d8eb-486e-887a-ab2ced7c6a2b">

Now your db server is ready to go and make other configurations as required.

### Install WordPress on your Web Server EC2 Instance

1. Update the repository

```
sudo yum update
```

Result:

<img width="834" alt="Screenshot 2024-05-23 at 12 20 04" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/03971961-2c0e-49fa-bd2d-c77be078edcc">

2. Install wget, Apache and it’s dependencies

```
sudo yum -y install wget httpd php php-mysqlnd php-fpm php-json
```

Result:

<img width="834" alt="Screenshot 2024-05-23 at 12 22 38" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/66de9fe3-a648-4952-9c1d-b384360fabfd">

3. Start the apache service

```
sudo systemctl enable httpd
sudo systemctl start httpd
```

Result:

<img width="826" alt="Screenshot 2024-05-23 at 12 23 46" src="https://github.com/sheezylion/web-solution-with-wordpress/assets/142250556/cff38880-a47b-4955-9b3c-0b1a5581f415">

4. Next, we install PHP and it’s depemdencies

```
sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
sudo yum install yum-utils http://rpms.remirepo.net/enterprise/remi-release-8.rpm
sudo yum module list php
sudo yum module reset php
sudo yum module enable php:remi-7.4
sudo yum install php php-opcache php-gd php-curl php-mysqlnd
sudo systemctl start php-fpm
sudo systemctl enable php-fpm
setsebool -P httpd_execmem 1
```



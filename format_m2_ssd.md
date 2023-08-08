# Formatting an NVMe M.2 SSD

1. Check where is the ssd located in /dev

		
	lsblk
	

*Note*: In RHEL my ssd appears as nvme0n1

2. Format the card using the fdisk utility

	
	sudo fdisk -l
	sudo fdisk /dev/nvme0n1
	# Enter n for new partition
	# Enter p for primary
	# Use default partition number
	# Use default first sector
	# Use default last sector		
	# Enter w to sync disks
	

3. Add a file system to the ssd

	
	sudo mkfs.xfs /dev/nvme0n1
	
*Note:* If receiving an error stating that the ssd contains a partition table (dos), use -f as below:

	
	sudo mkfs.xfs -f /dev/nvme0n1
	

4. We have now added a UUID to the ssd, we can proceed to add to the fstab.


# Mounting an persistent storage with fstab

1. Retrieve the UUID for the device

	
	lsblk -fs /dev/nvme0n1
	

2. Create a new mounting point; I create at the root filesystem

	
	sudo mkdir -p /name_of_mount_point
	

3. Add the following line into /etc/fstab

	
	UUID=ea74bbec-536d-490c-b8d9-5b40bbd7545b /boot xfs defaults 0 0
	

4. Regenerate mount units to let the machine register the new config

	
	systemctl daemon-reload
	

5. Try mounting the file system to verify the config

	
	mount name_of_mount_point
	

6. Done

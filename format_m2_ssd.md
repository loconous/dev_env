# Formatting an NVMe M.2 SSD

## Starting with an external NVMe drive (e.g., USB-C dongle)

1. Check where is the ssd located in /dev

		lsblk	

	*Note*: In RHEL my external ssd appears as sda

2. Unmount the disk and any partitions (e.g., sda1, sda2, etc)

		sudo umount /dev/sda1 || true

	*Optional*: If there is a cryptsetup (LUKS) partition, close it `sudo cryptsetup luksClose luks-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx || true`

3. Wipe partition table and filesystem signatures

		sudo wipefs -a /dev/sda

4. Overwrite every byte of the drive with zeros (takes a long time for large drives, e.g. ~1-2 hours for TB over USB)

		sudo dd if=/dev/zero of=/dev/device_name bs=1M status=progress

	*Faster option*: Wipe beginning and end where critical info is stored:
	
		sudo dd if=/dev/zero of=/dev/sda bs=1M count=10240

5. Transfer the NVMe drive from the external dongle to the internal bay in the machine

## Starting with now internal NVMe drive

1. Check where is the ssd located in /dev

		lsblk	

	*Note*: In RHEL my ssd appears as nvme0n1

2. If not done previously, wipe any partition table in the drive

		sudo wipefs -a /dev/nvme0n1

3. If not done previously, overwrite every byte of the drive with zeros

		sudo dd if=/dev/zero of=/dev/device_name bs=1M status=progress

4. Create new partition table 

		sudo fdisk /dev/nvme1n1
		# Enter g -> Create new GPT partition table
		# Enter n -> Create new partition
		# Use any defaults	
		# Enter w -> Write and quit

5. Format the partition/s with XFS

		sudo mkfs.xfs /dev/nvme1n1p1

	*Altrnative*: If you prefer ext4, use `sudo mkfs.ext4 /dev/nvme1n1p1`

## Mounting an persistent storage with fstab

1. Retrieve the UUID for the device
	
		lsblk -fs /dev/nvme0n1
	
2. Create a new mounting point; I create at the root filesystem
	
		sudo mkdir -p /name_of_mount_point
	
3. Add the following line into /etc/fstab
	
	UUID=ea74bbec-536d-490c-b8d9-5b40bbd7545b /name_of_mount_point xfs defaults 0 0
	
4. Regenerate mount units to let the machine register the new config
	
		systemctl daemon-reload
	
5. Test the /etc/fstab entry
	
		sudo mount -a
	
6. Done

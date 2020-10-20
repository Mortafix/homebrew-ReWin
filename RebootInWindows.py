import argparse
from subprocess import call, run, Popen, PIPE, check_output, CalledProcessError
from re import search

if __name__ == '__main__':
	# argparse
	parser = argparse.ArgumentParser(prog='rewin',description='Reboot in your BootCamp partition easly.',usage='rewin [-n PARTITION-NAME, -p SUDO-PASSWORD]',epilog='Example: rewin -n Windows10 -p NotSoSecurePassword -E')
	parser.add_argument('-n',type=str,help='BootCamp partition name',metavar=('NAME'))
	parser.add_argument('-p',type=str,help='admin password (security issue)',metavar=('PWD'))
	parser.add_argument('-E','--external-drive',action='store_true',help='BootCamp is in an external drive')
	args = parser.parse_args()
	name = args.n if args.n else "BOOTCAMP"
	pwd = args.p if args.p else None
	external = args.external_drive

	print("Trying to reboot in partition '{}'{}{}".format(name,' in external drive' if external else '',' with password' if pwd else ''))

	# script
	try:
		# disk info
		disk_info = check_output(['diskutil', 'info', name], timeout=1).decode()
		disk_number,disk_partition = search(r'(/dev/disk\ds)(\d)',disk_info).groups()
		print(f"Found '{name}' in {disk_number}{disk_partition}")
		# bless disk
		bless_cmd = f'sudo -S bless /usr/sbin/bless -device {disk_number}{1 if external else disk_partition} -setBoot -nextonly'
		output = call(f'echo {pwd} | {bless_cmd}',shell=True,stdin=PIPE) if pwd else Popen(bless_cmd,shell=True).wait()
		# rebooting
		if not output and str(input('\nAre you sure to reeboot? ([y]/n): ')).lower() in ['','y','yes']:
			print('REBOOTING!')
			call('sudo /sbin/shutdown -r now',shell=True)
	except (CalledProcessError, KeyboardInterrupt): exit(-1)
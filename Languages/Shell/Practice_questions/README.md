## Practice Questions

These simple exercises will help you practice what you learned.

## Index

- [Exercise 1: Hello, World!](#exercise-1-hello-world)
- [Exercise 2: Basic date](#exercise-2-basic-date)
- [Exercise 3: Great day](#exercise-3-great-day)
- [Exercise 4: Factors](#exercise-4-factors)
- [Exercise 5: Argument check](#exercise-5-argument-check)
- [Exercise 6: Files size](#exercise-6-files-size)
- [Exercise 7: Count chars](#exercise-7-count-chars)
- [Exercise 8: Sum](#exercise-8-sum)
- [Exercise 9: Number of arguments](#exercise-9-number-of-arguments)
- [Exercise 10: Empty files](#exercise-10-empty-files)
- [Exercise 11: Directories comparison](#exercise-11-directories-comparison)
- [Exercise 12: It's alive!](#exercise-12-its-alive)
- [Exercise 13: Automate user management on servers](#exercise-13-automate-user-management-on-servers)
- [Exercise 14: Automate backups to a separate server](#exercise-14-automate-backups-to-a-separate-server)
- [Exercise 15: Automate backups on a regular basis](#exercise-15-automate-backups-on-a-regular-basis)
- [Exercise 16: Automate monitoring available disk space](#exercise-16-automate-monitoring-available-disk-space)
- [Exercise 17: Automate monitoring disk space on a regular basis](#exercise-17-automate-monitoring-disk-space-on-a-regular-basis)
- [Exercise 18: Automate both disk space monitoring and taking backups on a regular basis](#exercise-18-automate-both-disk-space-monitoring-and-taking-backups-on-a-regular-basis)

## Exercise 1: Hello, World!

Define a variable with the string "Hello, World!"

Print the value of the variable you've defined and redirect the output to the file "Amazing_output.txt"

Solution [here](./Solutions/Hello_world.sh).

## Exercise 2: Basic date

Write a script that will put the current date in a file called "Date.txt"

Solution [here](./Solutions/Basic_date.sh).

## Exercise 3: Great day

Write a script that will print "Today is a great day!" unless it's given a day name and then it should print "Today is "

Note: no need to check whether the given argument is actually a valid day.

Solution [here](./Solutions/Great_day.sh).

## Exercise 4: Factors

Write a script that when given a number, will:

* Check if the number has 2 as factor, if yes it will print "one factor"
* Check if the number has 3 as factor, if yes it will print "one factor...actually two!"
* If none of them (2 and 3) is a factor, print the number itself.

Solution [here](./Solutions/Factors.sh).

## Exercise 5: Argument check

Write a script that will check if a given argument is the string "pizza"

If it's the string "pizza" print "with pineapple?"

If it's not the string "pizza" print "I want pizza!"

Note: assume the script is executed with an argument.

Solution 1 [here](./Solutions/Argument_check_1.sh).

Solution 2 [here](./Solutions/Argument_check_2.sh).

## Exercise 6: Files size

Print the name and size of every file and directory in current path.

Note: use at least one for loop!

Solution [here](./Solutions/Files_size.sh).

## Exercise 7: Count chars

Read input from the user until you get empty string.

For each of the lines you read, count the number of characters and print it.

Solution [here](./Solutions/Count_chars.sh).

## Exercise 8: Sum

Write a script that gets two numbers and prints their sum.

Make sure the input is valid (= you got two numbers from the user).

Test the script by running and passing it two numbers as arguments.

Solution [here](./Solutions/Sum.sh).

## Exercise 9: Number of arguments

Write a script that will print "Got it: " in case of one argument.

In case no arguments were provided, it will print "Usage: ./ "

In case of more than one argument, print "hey hey...too many!"

Solution [here](./Solutions/Number_of_arguments.sh).

## Exercise 10: Empty files

Write a script to remove all the empty files in a given directory (including nested directories).

Solution [here](./Solutions/Empty_files.sh).

## Exercise 11: Directories comparison

You are given two directories as arguments and the output should be any difference between the two directories.

With gnu find, you can use diff to compare directories recursively:

```
diff --recursive directory1 directory2
```

Solution [here](./Solutions/dirdiff.sh).

## Advanced Questions

All the problems in the following exercises are advanced level and require you to have access to a test server be it in a VM, Cloud or Phsyical Server. If you don't have any, don't worry and don't feel too bad about it. Just read the problems and see the suggested solution to improve your understanding.

## Exercise 12: It's alive!

Write a script to determine whether a given host is down or up.

Solution [here](./Solutions/It_is_alive.sh).

## Exercise 13: Automate user management on servers

Creating a user on multiple servers maybe something that you would do on a daily basis as a sysadmin. It is a tedious a task. Write a bash script that automates the entire process.

Hints: First, create a text file that includes all the server hostnames or IP addresses where you wish to add the user on.

For example, you can create the file **servers.txt** that includes the names of five different servers:

```
╭╴fjrodafo@linux[~]
╰─╴$ cat servers.txt
server1
server2
server3
server4
server5
```

These are server hostnames and the IP addresses are already assumed to have been included in the /etc/hosts file so that one can SSH into any of those servers. You can also use SSH config file. The script would first ask you to enter the username and the user id of the user who you want to add; then, it will loop over and connect to all the servers in the **servers.txt** file via SSH and add the requested user.

Solution [here](./Solutions/Automate_user_management_on_servers.sh).

## Exercise 14: Automate backups to a separate server

Write an automated script to backup archives of your files on a separate server.

Hints: Create an array named **backup_dirs** that stores all directory names that we want to backup. Next, create three other variables:

* **dest_dir**: To specify the backup destination directory.
* **dest_server**: To specify the backup destination server.
* **backup_time**: To specify the date of the backup.

Finally, for all the directories in the **backup_dirs** array, create a gzip compressed tar archive in **/tmp**, then use the scp command to send/copy the backup to the destination server. Finally, remove all the gzip archives from **/tmp**.

Solution [here](./Solutions/Automate_backups_to_a_separate_server.sh).

## Exercise 15: Automate backups on a regular basis

Take backups based on exercise 2 every day at midnight on the separate backup server.

Hint: Schedule the script described in exercise 2 to run as a cron job.

Solution:

```
╭╴fjrodafo@linux[~]
╰─╴$ crontab -e
0   0   *   *   * /home/fjrodafo/Documents/Scripts/backup.sh
```

## Exercise 16: Automate monitoring available disk space

Use the commands df , tail , awk and cut to grab the disk usage percentage of your system and check to see if it’s bigger than or equal to 90%.

Hint: First, created a **filesystems** array that holds all the filesystems that you want to monitor. Then, for each filesystem, you grab the usage percentage with the given commands and check to see if it’s bigger than or equal to 90%. If usage is above 90%, it should send an alert email indicating that the filesystem is running out of space.

Solution [here](./Solutions/Automate_monitoring_available_disk_space.sh).

## Exercise 17: Automate monitoring disk space on a regular basis

Check disk usage based on exercise 4 every six hours on your system.

Hint: Schedule the script described in exercise 4 to run as a cron job.

Solution:

```
╭╴fjrodafo@linux[~]
╰─╴$ crontab -e
0   */6 *       *       * /home/fjrodafo/Documents/Scripts/disk_space.sh
```

## Exercise 18: Automate both disk space monitoring and taking backups on a regular basis

Use Cron to take backups based on exercise 2 every day at midnight on the separate backup server. Also check disk usage based on exercise 4 every six hours on your system.

Hint: Schedule the script described in exercise 2 and 4 to run as a cron job.

Solution:

```
╭╴fjrodafo@linux[~]
╰─╴$ crontab -e
0   0   *   *   * /home/fjrodafo/Documents/Scripts/backup.sh
0   */6 *       *       * /home/fjrodafo/Documents/Scripts/disk_space.sh
```

Please note here, that we are using the same crontab file to execute both scripts on a regular basis.
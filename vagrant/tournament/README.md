# Swiss Tournament Results Project
## Introduction
This project uses a **Python** module that uses the **PostgreSQL** database to keep track of players and matches in a game tournament. This project is part of the Udacity **Full Stack Nanodegree Program**. It is designed to show competency in creating and using databases through the use of database schemas and how to manipulate data inside of the database.

### This project has 3 parts:
1. Defining the database schema (SQL table definitions) in **tournamenet.sql**
2. Writing Python code that will use it to track a Swiss tournament in **tournament.py**
3. A test script, **tournament_test.py**, has been included to test **tournamenet.py**

### Understanding the purpose of each file

- **tournament.sql**  - this file is used to set up the database schema (the table representation of the data structure).
- **tournament.py** - this file is used to provide access to the database via a library of functions which can add, delete or query data in the database to another python program (a client program). Remember that when you define a function, it does not execute, it simply means the function is defined to run a specific set of instructions when called.
- **tournament_test.py** - this is a client program which will use functions written in the tournament.py module. We've written this client program to test the implementation of functions in tournament.py

## Installation

The project uses a virtual machine (VM) to run a database server and a web app that uses it. The VM is a Linux server system that runs on top of your own computer. We're using the Vagrant software to configure and manage the VM.

### Required Tools to get project running

#### Git
On Windows, Git will provide you with a Unix-style terminal and shell (Git Bash). (On Mac or Linux systems you can use the regular terminal program.) You will need Git to install the configuration for the VM.
Download Git: https://git-scm.com/downloads

#### Virtual Box
VirtualBox is the software that actually runs the VM. Install the platform package for your operating system.  You do not need the extension pack or the SDK. You do not need to launch VirtualBox after installing it.
Download Virtual Box: https://www.virtualbox.org/wiki/Downloads

#### Vagrant
Vagrant is the software that configures the VM and lets you share files between your host computer and the VM's filesystem.  Install the version for your operating system. **Windows Note:** The Installer may ask you to grant network permissions to Vagrant or make a firewall exception. Be sure to allow this.
Download Vagrant: https://www.vagrantup.com/downloads.html

### Use Git/Github to fetch the VM Configuration
**Windows:** Use the Git Bash program (installed with Git) to get a Unix-style terminal. Make sure to run as administrator. **Other systems:** Use your favorite terminal program.

1. Go here: https://github.com/bdoguin/full-stack-nanodegree-vm
2. Fork the repository (Click **Fork** in the top-right corner)
3. Now we want to clone the newly forked repository to your computer. We will want to use the HTTPS method of cloning. Click **Clone or download** and then the **clipboard icon** to copy the repo's path.
4. Then from the terminal, run: `git clone PASTE_PATH_TO_REPO_HERE fullstack`

This will give you a directory named **fullstack**. **Note:** you will want to paste the path you copied from step 3 into `PASTE_PATH_TO_REPO_HERE`.

### Run the Virtual Machine
Using the terminal, change directory to fullstack/vagrant (`cd swisstournament/vagrant`), then type `vagrant up` to launch your virtual machine. 

Once it is up and running, type `vagrant ssh` to log into it. This will log your terminal in to the virtual machine, and you'll get a Linux shell prompt. When you want to log out, type exit at the shell prompt.  To turn the virtual machine off (without deleting anything), type vagrant halt. If you do this, you'll need to run vagrant up again before you can log into it.

If you would like to see what was installed in the VM, look in **/vagrant/pg_config.sh**.

### Create the database:
The Vagrant VM has PostgreSQL installed and configured, as well as the psql command line interface (CLI), so that you don't have to install or configure them on your local machine. The very first time we start working on this project, no database will exist - so first, we'll need to create the SQL database for our tournament project

1. Navigate to the tournamenet directory with
`vagrant@vagrant-ubuntu-trusty-32:/vagrant$ cd /vagrant/tournament`
2. Open psql with
`vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ psql`
3. Build and access the database with
`vagrant=> \i tournament.sql`
4. Quit psql with 
`tournament-> \q`

### Run the test script:
This code comes with a test script **tournamenet_test.py** that checks the database created with tournament.sql and the functions created in **tournament.py**.
1. Run tournamenet_test.py with
`vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ python tournament_test.py`

## Example of a 16 Player Swiss Tournament:
1. First round pairing is by random draw. For example, with 16 players they would be matched into 8 random pairs for the first round. For now, assume all games have a winner, and there are no draws.
2. After the first round, there will be a group of 8 players with a score of 1 (win), and a group of 8 players with a score of 0 (loss). For the 2nd round, players in each scoring group will be paired against each other 1's versus 1's and 0's versus 0's.
3. After round 2, there will be three scoring groups:
4 players who have won both games and have 2 points
8 players who have won a game and lost a game and have 1 point
4 players who have lost both games and have no points.
4. Again, for round 3, players are paired with players in their scoring group. After the third round, the typical scoring groups will be:
2 players who have won 3 games (3 points)
6 players with 2 wins (2 points)
6 players with 1 win (1 point)
2 players with no wins (0 points)
5. For the fourth (and in this case final) round, the process repeats, and players are matched with others in their scoring group. Note that there are only 2 players who have won all of their games so far they will be matched against each other for the "championship" game. After the final round, we'll have something that looks like this:
1 player with 4 points the winner!
4 players with 3 points tied for second place
6 players with 2 points
4 players with 1 point
1 player with 0 points

The Swiss system produces a clear winner in just a few rounds, no-one is eliminated and almost everyone wins at least one game, but there are many ties to deal with.


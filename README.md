<h1>Current Version 1.0 released on 21-Sep-2021</h1>

- 👋 Hi, welcome to DBA Genesis scripts
- 👀 Our goal is to simplify DBA's life
- 🌱 Access all our DBA scripts in one location
- 💞️ We update this repository time to time
- 📫 You can write to us at support@dbagenesis.com

<h2>How to download DBA Genesis scripts</h2>
<p>First make sure you have git package installed on the server, if not then install with root user</p>
<pre>yum -y install git</pre>

<p>Switch to Oracle user and clone all our DBA Genesis (dg) scripts from Git Hub to your local system</p>
<pre>su - oracle
mkdir dg-scripts
git clone https://github.com/dba-genesis/dg-scripts.git
ls dg-scripts</pre>

<h2>How to run DBA Genesis scripts inside Oracle database</h2>
<p>First we need to set the SQLPATH variable inside .bash_profile to point our downloaded scripts</p>
<pre>vi .bash_profile
export SQLPATH=/home/oracle/dg-scripts
--> save and close
. .bash_profile
</pre>

<p>Now we can connect to SQL*Plus and run any of DBA Genesis scripts</p>
<pre>sqlplus / as sysdba
SQL> @help.sql
</pre>

<!---
dba-genesis/dba-genesis is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->

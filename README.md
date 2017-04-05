# sre-project

To get project to work, run the following

vagrant up

This should bootstrap the following 2 servers:

salt_master
nginx_server_ubuntu

I didn't have time to pre-seed the minion, so please accept manually by doing

vagrant ssh salt_master

Run:

salt-key -A

And type 'y' to accept the minion

Run the following state:

salt '*nginx*' nginx-server state.apply

Once that is run, then log into nginx_server_ubuntu and run the follwing:

salt-call tls.create_self_signed_cert

Log back into the master(salt_master):

Rerun the state:

salt '*nginx*' nginx-server state.apply

States should be fully applied, and you should now be able to access your web content via ssl



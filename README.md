# PERSEPHONE SERVICES DOCKER

[persephone](https://github.com/secretisdead/persephone)

not gonna lie, this is a little annoying to get set up but it's not too hard

after cloning this repo, cd  into it and do the following

first, copy `.env.example` to `.env` and change any values and fill in any empty ones.

run docker compose up -d

run `docker exec -it persephone-webserver-1 bash`

run `./install.sh`

run `exit`

now edit the config file `data/persephone_installation/config/persephone.config` db section to the following:

change type to `mysql`

change host to `backend/<DATABASE_NAME>?charset=utf8` where `<DATABASE_NAME>` is the name of your database

change the user and pass fields to the values you put in your .env file

go to your website, and you should see an error mentioning your database. If so, run `docker exec -it persephone-webserver-1 bash` again, and run `touch /var/www/html/.installed`

return to your site and reload, and it should work!

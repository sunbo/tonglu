 set :application, "sameroads"
 set :repository,  "https://jtd.oicp.net/svn/project/#{application}"
 set :svn_username, "sunbo"
 set :svn_password, "111111"

 set :use_sudo,false
 
set :deploy_to,"/opt/www/#{application}"
set :user,"root"
set :password,"qaz\/\'\]\!\@\#\$\%\^\&\*\(\)"

 #depend :local, :command, "convert"
 #depend :remote, :command, "iconv"

 # If you aren't using Subversion to manage your source code, specify
 # your SCM below:
 # set :scm, :subversion

role :app, "211.94.154.44"
role :web, "211.94.154.44"
role :db,  "211.94.154.44", :primary => true

# task :create_file_link, :roles => :web do
#   run "ln -s #{deploy_to}/shared/detail/ #{deploy_to}/current/public/detail"
# end
#
# task :chmod, :roles => :web do
#   run "chmod -fR 755 #{deploy_to}/current/script/*"
# end
#
# after "deploy:symlink", :chmod, :create_file_link
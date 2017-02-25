package ['tomcat7', 'tomcat7-webapps', 'tomcat7-admin-webapps' ] do
  action :install
end

template '/usr/share/tomcat7/conf/tomcat-users.xml' do
  source 'tomcat-users.xml.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

service "tomcat7" do
  action :enable
end

service "tomcat7" do
  action :restart
end

remote_file '/usr/share/tomcat7/webapps/spring-boot.war' do
  source 'https://repo1.maven.org/maven2/org/springframework/boot/spring-boot-deployment-test-tomcat/1.3.1.RELEASE/spring-boot-deployment-test-tomcat-1.3.1.RELEASE.war'
  action :create
end

service "tomcat7" do
  action :restart
end

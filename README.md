# my-stack-cookbook

Download:

https://downloads.chef.io/chef-dk/
http://www.vagrantup.com/downloads.html
https://www.virtualbox.org/wiki/Downloads

TODO: Enter the cookbook description here.

`scp -P 2222 nginx-clojure-0.3.0.tar.gz vagrant@127.0.0.1:/tmp`
`mysql -h 127.0.0.1 --passsword=password --user=root`

## Vagrant plugins - codify later

omnibus (4.0.0)
vagrant-berkshelf (4.0.2)
vagrant-librarian-chef (0.2.1)
vagrant-share (1.1.3, system)
vagrant-vbguest (0.10.0)

## Error on chef folders not synced
```bash
rm .vagrant/machines/default/virtualbox/synced_folders
vagrant reload --provision
```

## Links used

* http://misheska.com/blog/2013/06/16/getting-started-writing-chef-cookbooks-the-berkshelf-way/
* http://www.gotealeaf.com/blog/chef-basics-for-rails-developers
* http://stackoverflow.com/questions/20059546/how-to-use-rbenv-with-passenger
* https://guides.github.com/introduction/flow/
* https://github.com/someara/mysql_usage_example/blob/master/templates/default/mysite.cnf.erb
* https://supermarket.chef.io/cookbooks/mysql
* https://blog.safaribooksonline.com/2014/07/21/chef-wrapper-cookbooks-use/
* http://peterjmit.com/blog/a-better-workflow-with-chef-and-vagrant.html
* https://www.chef.io/blog/2013/12/03/doing-wrapper-cookbooks-right/
* https://github.com/MeanFlow/
* https://github.com/miketheman/nginx
* https://supermarket.chef.io/cookbooks/nginx
* http://nginx-clojure.github.io/quickstart.html


## Supported Platforms

TODO: List your supported platforms.


## Usage

### my-stack::default

Include `my-stack` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[my-stack::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
# my-stack
# my-stack

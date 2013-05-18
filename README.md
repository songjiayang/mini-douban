# Mini::Douban

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'mini-douban'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mini-douban

## Requirement

    gem install xml-simple

## Example

    require 'mini/douban'
    Mini::Douban.book_api :id=>3420144

参数格式大致为
{:id=>3420144, :isbn=>'9781430218333', original=>false}.
其中Id 和ISBN至少有一个.Id优先.original默认为false,可以不填.

具体含义：
* id表示豆瓣对应的图书id;
* isbn表示对应豆瓣图书的isbn编号(10或13位即可);
* original表示是否显示原本信息.



## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

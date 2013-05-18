require "mini/douban/version"
require 'xmlsimple'
require 'net/http'

module Mini
  module Douban

    BOOK_API_WITH_ID = ' http://api.douban.com/book/subject/'
    BOOK_API_WITH_ISBN = 'http://api.douban.com/book/subject/isbn/'

    def self.book_api(opts = {})
      begin
        if !opts.respond_to? :keys or opts.empty?
          return 'please input a hash for api options. like {:id=>2023013,:isbn=>9787543639133,:original=>true}'
        end

        opts = opts.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

        if opts[:id]
          book_with_xml = Net::HTTP.get_response(URI.parse(BOOK_API_WITH_ID + opts[:id].to_s)).body
        elsif opts[:isbn]
          book_with_xml = Net::HTTP.get_response(URI.parse(BOOK_API_WITH_ISBN + opts[:isbn].to_s)).body
        else
          return 'input options lack id or isbn'
        end

        hash_book = XmlSimple.xml_in(book_with_xml)

        if hash_book.include?('attribute') and opts[:original] != true
          sample_book = {}
          hash_book['attribute'].map{|attr| sample_book[attr['name']] = attr['content']}
          sample_book['tags'] = hash_book['tag'].map{ |tag| tag['name'] } if hash_book['tag']
          sample_book['summary'] = hash_book['summary'].join if hash_book['summary']
          sample_book['links'] = hash_book['link'].map{ |m| m['href']} if hash_book['link']
          sample_book['rating'] = hash_book['rating'].first['average'] if hash_book['rating']
          sample_book['rater_number'] = hash_book['rating'].first['numRaters'] if hash_book['rating']
          if sample_book['links']
            sample_book['image_url'] = sample_book['links'].select{ |s| s.start_with?('http://img')}.join
            sample_book['api_url'] = sample_book['links'].select{ |s| s.start_with?('http://api')}.join
            sample_book['mobile_url'] = sample_book['links'].select{ |s| s.start_with?('http://m')}.join
            sample_book['website_url'] = sample_book['links'].select{ |s| s.start_with?('http://book')}.join
          end
          return sample_book.inject({}){|book_info,(k,v)| book_info[k.to_sym] = v; book_info}
        end
        hash_book
      rescue Exception => e
        return 'Not found book in douban api with id or isbn'
      end
    end

  end
end

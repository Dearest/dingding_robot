
class GocnSpider
  HOME_PATH = 'https://gocn.io/'.freeze
  ROBOT = 'https://oapi.dingtalk.com/robot/send?access_token=xxxx'.freeze

  def self.scheduler
    body = { msgtype: 'text', text: { content: news_content } }.to_json
    options = { headers: { 'Content-Type' => 'application/json' },
                body: body }
    HTTParty.post(ROBOT, options)
  end

  private

  class << self
    def news_content
      content = parse_page(parse_home)
      content.unshift("GOCN每日新闻(#{DateTime.now.strftime('%F')})")
      content.join("\n")
    end

    # return today GOCN news url
    def parse_home
      home_doc = Nokogiri::HTML.parse(HTTParty.get(HOME_PATH).body)
      news = home_doc.css('.aw-question-content h4 a').select do |item|
        item.text =~ /GOCN每日新闻\(#{DateTime.now.strftime('%F')}\)/
      end
      news.first.attribute('href').value
    end

    # return news_content
    def parse_page(page_url)
      page_doc = Nokogiri::HTML.parse(HTTParty.get(page_url).body)
      page_doc.css('div.content.markitup-box p').map(&:text)
    end
  end
end
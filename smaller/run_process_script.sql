.mode csv
.header on
.output 'stats/overall_stats-blog_flickr_net_en'
select count(*) as total_measurements from measurements where url like 'http://blog.flickr.net/en';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://blog.flickr.net/en';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://blog.flickr.net/en' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://blog.flickr.net/en' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://blog.flickr.net/en' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://blog.flickr.net/en' and r.mimetype like '%css%';
.output 'stats/image_stats-blog_flickr_net_en'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://blog.flickr.net/en%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-blog_flickr_net_en'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://blog.flickr.net/en%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-blog_flickr_net_en'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://blog.flickr.net/en%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-blog_flickr_net_en'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://blog.flickr.net/en%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-en_wikipedia_org_wiki_Main_Page'
select count(*) as total_measurements from measurements where url like 'http://en.wikipedia.org/wiki/Main_Page';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://en.wikipedia.org/wiki/Main_Page';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://en.wikipedia.org/wiki/Main_Page' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://en.wikipedia.org/wiki/Main_Page' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://en.wikipedia.org/wiki/Main_Page' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://en.wikipedia.org/wiki/Main_Page' and r.mimetype like '%css%';
.output 'stats/image_stats-en_wikipedia_org_wiki_Main_Page'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://en.wikipedia.org/wiki/Main_Page%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-en_wikipedia_org_wiki_Main_Page'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://en.wikipedia.org/wiki/Main_Page%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-en_wikipedia_org_wiki_Main_Page'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://en.wikipedia.org/wiki/Main_Page%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-en_wikipedia_org_wiki_Main_Page'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://en.wikipedia.org/wiki/Main_Page%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-www_amazon_com_'
select count(*) as total_measurements from measurements where url like 'http://www.amazon.com/';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.amazon.com/';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.amazon.com/' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.amazon.com/' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.amazon.com/' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.amazon.com/' and r.mimetype like '%css%';
.output 'stats/image_stats-www_amazon_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.amazon.com/%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-www_amazon_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.amazon.com/%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-www_amazon_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.amazon.com/%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-www_amazon_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.amazon.com/%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-www_bbc_co_uk_news'
select count(*) as total_measurements from measurements where url like 'http://www.bbc.co.uk/news';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.bbc.co.uk/news';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.bbc.co.uk/news' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.bbc.co.uk/news' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.bbc.co.uk/news' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.bbc.co.uk/news' and r.mimetype like '%css%';
.output 'stats/image_stats-www_bbc_co_uk_news'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.bbc.co.uk/news%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-www_bbc_co_uk_news'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.bbc.co.uk/news%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-www_bbc_co_uk_news'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.bbc.co.uk/news%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-www_bbc_co_uk_news'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.bbc.co.uk/news%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-www_ebay_com_'
select count(*) as total_measurements from measurements where url like 'http://www.ebay.com/';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.ebay.com/';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.ebay.com/' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.ebay.com/' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.ebay.com/' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.ebay.com/' and r.mimetype like '%css%';
.output 'stats/image_stats-www_ebay_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.ebay.com/%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-www_ebay_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.ebay.com/%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-www_ebay_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.ebay.com/%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-www_ebay_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.ebay.com/%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-www_google_com_'
select count(*) as total_measurements from measurements where url like 'http://www.google.com/';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.google.com/';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.google.com/' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.google.com/' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.google.com/' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.google.com/' and r.mimetype like '%css%';
.output 'stats/image_stats-www_google_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.google.com/%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-www_google_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.google.com/%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-www_google_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.google.com/%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-www_google_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.google.com/%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-www_imdb_com_'
select count(*) as total_measurements from measurements where url like 'http://www.imdb.com/';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.imdb.com/';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.imdb.com/' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.imdb.com/' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.imdb.com/' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.imdb.com/' and r.mimetype like '%css%';
.output 'stats/image_stats-www_imdb_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.imdb.com/%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-www_imdb_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.imdb.com/%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-www_imdb_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.imdb.com/%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-www_imdb_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.imdb.com/%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-www_npr_org_'
select count(*) as total_measurements from measurements where url like 'http://www.npr.org/';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.npr.org/';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.npr.org/' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.npr.org/' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.npr.org/' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.npr.org/' and r.mimetype like '%css%';
.output 'stats/image_stats-www_npr_org_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.npr.org/%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-www_npr_org_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.npr.org/%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-www_npr_org_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.npr.org/%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-www_npr_org_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.npr.org/%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-www_yle_fi_'
select count(*) as total_measurements from measurements where url like 'http://www.yle.fi/';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.yle.fi/';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.yle.fi/' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.yle.fi/' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.yle.fi/' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.yle.fi/' and r.mimetype like '%css%';
.output 'stats/image_stats-www_yle_fi_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.yle.fi/%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-www_yle_fi_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.yle.fi/%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-www_yle_fi_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.yle.fi/%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-www_yle_fi_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.yle.fi/%' and mimetype like '%css%'  ;
.output 'stats/overall_stats-www_youtube_com_'
select count(*) as total_measurements from measurements where url like 'http://www.youtube.com/';
select count(*) as total_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.youtube.com/';
select count(*) as total_image_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.youtube.com/' and r.mimetype like '%image%';
select count(*) as total_html_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.youtube.com/' and r.mimetype like '%html%';
select count(*) as total_javascript_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.youtube.com/' and r.mimetype like '%javascript%';
select count(*) as total_css_requests from measurements as m join requests as r on m.archivename = r.mid where m.url like 'http://www.youtube.com/' and r.mimetype like '%css%';
.output 'stats/image_stats-www_youtube_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.youtube.com/%' and mimetype like '%image%'  and size <= 10000  ;
.output 'stats/html_stats-www_youtube_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.youtube.com/%' and mimetype like '%html%'  ;
.output 'stats/javascript_stats-www_youtube_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.youtube.com/%' and mimetype like '%javascript%'  ;
.output 'stats/css_stats-www_youtube_com_'
select (r.starttimeoffset*1000) as starttime, r.duration, r.size, (starttime+r.duration) as total from measurements as m join requests as r on m.archivename = r.mid where starttime >= 0 and duration >= 0 and m.url like '%http://www.youtube.com/%' and mimetype like '%css%'  ;

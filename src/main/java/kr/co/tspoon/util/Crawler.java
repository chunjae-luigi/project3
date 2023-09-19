package kr.co.tspoon.util;

import kr.co.tspoon.dto.News;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Crawler {
    private final static String USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36";
    public static List<News> naverNews() throws IOException {
        List<News> list = new ArrayList<>();
        Connection conn = Jsoup.connect("http://news.naver.com")
                .header("Content-Type", "application/json;charset=UTF-8")
                .userAgent(USER_AGENT)
                .method(Connection.Method.GET)
                .ignoreContentType(true);
        Document doc = conn.get();

        Elements titles = doc.select(".comp_journal_subscribe .cjs_ctw .channel");
        Elements imgs = doc.select(".comp_journal_subscribe .cjs_news_mw img");
        Elements contents = doc.select(".comp_journal_subscribe .cjs_news_tw .cjs_t");
        for (int i = 0; i < 5; i++) {
            Element title = titles.get(i);
            Element img = imgs.get(i);
            Element content = contents.get(i);
            String titleStr = title.text();
            String imgSrc = img.attr("src");
            String contentStr = content.text();
            News dto = new News(titleStr, imgSrc, contentStr);
            list.add(dto);
        }
        for(News news:list){
            System.out.println(news.toString());
        }
        return list;
    }

    public static List<News> naverNewsKeyword(String keyword) throws Exception{
        List<News> list = new ArrayList<>();
        String url = "https://search.naver.com/search.naver?where=news&ie=utf8&sm=nws_hty&query="+keyword;

        Connection conn = Jsoup.connect(url)
                .header("Content-Type", "application/json;charset=UTF-8")
                .userAgent(USER_AGENT)
                .method(Connection.Method.GET)
                .ignoreContentType(true);

        Document doc = conn.get();
        Elements titles = doc.select(".news_wrap .news_tit");
        Elements imgs = doc.select(".news_wrap > a > img");
        Elements contents = doc.select(".news_wrap .dsc_wrap .dsc_txt_wrap");

        for(int i=0; i<9; i++){
            Element title = titles.get(i);
            Element img = imgs.get(i);
            Element content = contents.get(i);
            String titleStr = title.text();
            String imgSrc = img.attr("data-lazysrc");
            String contentStr = content.text();
            News dto = new News();
            dto.setTitle(titleStr);
            dto.setImg(imgSrc);
            dto.setContent(contentStr);
            list.add(dto);
        }

        return list;
    }
}
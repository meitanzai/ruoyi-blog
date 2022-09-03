package com.ruoyi;

import com.ruoyi.common.utils.MarkdownUtils;
import org.commonmark.Extension;
import org.commonmark.ext.task.list.items.TaskListItemsExtension;
import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

import java.util.Arrays;
import java.util.List;

/**
 * web容器中进行部署
 * 
 * @author ruoyi
 */
public class RuoYiServletInitializer extends SpringBootServletInitializer
{
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application)
    {
        return application.sources(RuoYiApplication.class);
    }

    public static void main(String[] args) {
        List<Extension> extensions = Arrays.asList(

                TaskListItemsExtension.create()
        );
        Parser parser = Parser.builder()  .extensions(extensions).build();
        Node document = parser.parse("- [ ] task #1\n" +
                "- [x] task #2");
        HtmlRenderer renderer = HtmlRenderer.builder().build();
        TaskListItemsExtension.create();
        renderer.render(document);  // "<p>This is <em>Sparta</em></p>\n"
        System.out.println(renderer.render(document));

        System.out.println( MarkdownUtils.renderMarkdown("- [ ] task #1\n" +
                "- [x] task #2"));
    }
}

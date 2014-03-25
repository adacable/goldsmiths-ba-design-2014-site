def paginate_articles 
    #get articles for tags and sort
    articles_to_paginate = sorted_articles
    article_groups = []
    until articles_to_paginate.empty?
        article_groups << articles_to_paginate.slice!(0..9)
    end
    article_groups.each_with_index do |subarticles, i|
        first = i*config[:page_size] + 1
        last  = (i+1)*config[:page_size]
        if i != 0
            urlExtention = "#{i}/" 
        else
            urlExtention = "" 
        end
        @items << Nanoc::Item.new(
            "= render 'taggPage', :item_id => #{i} ",
            { :title => "Archive (articles #{last} to #{first})" },
            "/Blog/Posts/" + urlExtention
        )
    end
end


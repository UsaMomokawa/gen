# frozen_string_literal: true

module MetaTagsHelper
  def default_meta_tags
    {
      title: "GEN",
      reverse: true,
      charset: "utf-8",
      description: "漫画描きがつくった、漫画を描く人のための、進捗管理アプリです。",
      viewport: "width=device-width, initial-scale=1.0",
      og: {
        title: :title,
        type: "website",
        site_name: "GEN",
        description: :description,
        image: "https://genkougen.herokuapp.com/ogp/ogp.png",
        url: "https://genkougen.herokuapp.com"
      },
      twitter: {
        card: "summary_large_image",
        site: "@Usa_Momokawa",
      }
    }
  end
end

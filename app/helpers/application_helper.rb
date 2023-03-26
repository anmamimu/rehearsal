# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: '日本舞踊のお稽古アプリ',
      title: '振り譜のように使える日本舞踊のお稽古アプリ',
      reverse: true,
      separator: '|',
      description: '日本舞踊のお稽古の際に役立てていただける、振り書きやメモ、写真や音声を記録出来るアプリです。',
      keywords: '日舞,日本舞踊,お稽古,踊り,舞台,舞,狂言,歌舞伎',
      canonical: request.original_url,
      noindex: !Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('icon.png') }
      ],
      og: {
        site_name: :site,
        title: :titel,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('icon.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@n3Dlfljrvair9AK'
      }
    }
  end
end

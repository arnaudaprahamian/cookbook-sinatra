# This is the HTML Parser for letscookfrench.com
require 'nokogiri'
require 'open-uri'

class Parser
  def analyse_html_letscook(keyword,difficulty)
    @array_result = []
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{keyword}#{difficulty}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc.search('.m_contenu_resultat').each do |contenu|
      name = contenu.search('.m_titre_resultat').text.split(' ').join(' ')
      descriptions = contenu.search('.m_texte_resultat').text.split(' ').join(' ')
      time = contenu.search(".m_detail_time").text.scan( /\w+\s\w+/).last
      difficulty = contenu.search(".m_detail_recette").text.scan(/(Easy)|(Very easy)|(Moderate)|(Difficult)/).first.first
      @array_result << {name: name, description: descriptions, cooking_time: time, difficulty: difficulty, status: false}
    end
    return @array_result
  end

  def analyse_html_marmiton(keyword,difficulty)
    @array_result = []
    url = "http://www.marmiton.org/recettes/recherche.aspx?aqt=#{keyword}#{difficulty}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc = doc.css(".recette_classique")
    doc.search('.m_contenu_resultat').each do |contenu|
      name = contenu.search('.m_titre_resultat').text.split(' ').join(' ')
      descriptions = contenu.search('.m_texte_resultat').text.split(' ').join(' ')
      time = contenu.search(".m_detail_time").text.scan( /\w+\s\w+/).last
      difficulty = contenu.search(".m_detail_recette").text.scan(/(Facile)|(Très facile)|(Moyenne)|(Difficile)/).first.compact.first
      @array_result << {name: name, description: descriptions, cooking_time: time, difficulty: difficulty, status: false}
    end
    return @array_result
  end
end

